#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Postgres DDL extractor by table prefix.

Extracts:
  - CREATE TABLE for tables matching prefix
  - ALTER TABLE ... ADD CONSTRAINT ... for those tables
  - CREATE INDEX / CREATE UNIQUE INDEX ON those tables
  - COMMENT ON TABLE/COLUMN for those tables
  - CREATE SEQUENCE and ALTER SEQUENCE OWNED BY, when:
      * sequence name starts with prefix, OR
      * statement references any matched table (OWNED BY, DEFAULT nextval, etc.)

Usage:
  python scripts/tools/extract_ddl.py --in base.sql --prefix adm_ --out out.sql --schema sagnus
"""

import argparse
import re
from pathlib import Path
from datetime import datetime
from typing import List, Tuple, Optional, Set

RE_CREATE_TABLE = re.compile(
    r'^\s*CREATE\s+TABLE\s+(IF\s+NOT\s+EXISTS\s+)?(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?)\s*\(',
    re.IGNORECASE | re.DOTALL
)

RE_ALTER_TABLE_TARGET = re.compile(
    r'^\s*ALTER\s+TABLE\s+(ONLY\s+)?(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?)\b',
    re.IGNORECASE | re.DOTALL
)

RE_ALTER_TABLE_ADD_CONSTRAINT = re.compile(
    r'\bADD\s+CONSTRAINT\b|\bADD\s+PRIMARY\s+KEY\b|\bADD\s+UNIQUE\b|\bADD\s+FOREIGN\s+KEY\b|\bADD\s+CHECK\b',
    re.IGNORECASE
)

RE_CREATE_INDEX_ON = re.compile(
    r'^\s*CREATE\s+(UNIQUE\s+)?INDEX\b.*\bON\s+(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?)\b',
    re.IGNORECASE | re.DOTALL
)

RE_COMMENT_ON_TABLE = re.compile(
    r'^\s*COMMENT\s+ON\s+TABLE\s+(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?)\b',
    re.IGNORECASE | re.DOTALL
)

RE_COMMENT_ON_COLUMN = re.compile(
    r'^\s*COMMENT\s+ON\s+COLUMN\s+(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?\s*\.\s*("[^"]+"|\w+))\b',
    re.IGNORECASE | re.DOTALL
)

RE_CREATE_SEQUENCE = re.compile(
    r'^\s*CREATE\s+SEQUENCE\s+(IF\s+NOT\s+EXISTS\s+)?(?P<name>("[^"]+"|\w+)(\s*\.\s*("[^"]+"|\w+))?)\b',
    re.IGNORECASE | re.DOTALL
)

def normalize_ident(ident: str) -> str:
    ident = ident.strip()
    ident = re.sub(r'\s*\.\s*', '.', ident)
    ident = ident.replace('"', '')
    return ident

def split_sql_statements(sql_text: str) -> List[str]:
    statements: List[str] = []
    buf: List[str] = []

    in_squote = False
    in_dquote = False
    dollar_tag: Optional[str] = None

    i = 0
    n = len(sql_text)

    while i < n:
        ch = sql_text[i]
        nxt = sql_text[i+1] if i + 1 < n else ''

        # Line comment --
        if dollar_tag is None and not in_squote and not in_dquote and ch == '-' and nxt == '-':
            buf.append(ch); buf.append(nxt)
            i += 2
            while i < n and sql_text[i] != '\n':
                buf.append(sql_text[i]); i += 1
            continue

        # Block comment /* ... */
        if dollar_tag is None and not in_squote and not in_dquote and ch == '/' and nxt == '*':
            buf.append(ch); buf.append(nxt)
            i += 2
            while i < n and not (sql_text[i] == '*' and (i+1 < n and sql_text[i+1] == '/')):
                buf.append(sql_text[i]); i += 1
            if i < n:
                buf.append('*'); buf.append('/'); i += 2
            continue

        # Dollar-quote start/end
        if not in_squote and not in_dquote and ch == '$':
            j = i + 1
            while j < n and sql_text[j] != '$' and (sql_text[j].isalnum() or sql_text[j] == '_'):
                j += 1
            if j < n and sql_text[j] == '$':
                tag = sql_text[i:j+1]  # $$ or $tag$
                if dollar_tag is None:
                    dollar_tag = tag
                    buf.append(tag)
                    i = j + 1
                    continue
                elif dollar_tag == tag:
                    dollar_tag = None
                    buf.append(tag)
                    i = j + 1
                    continue

        # Quote toggles
        if dollar_tag is None:
            if ch == "'" and not in_dquote:
                if in_squote and nxt == "'":
                    buf.append(ch); buf.append(nxt); i += 2; continue
                in_squote = not in_squote
                buf.append(ch); i += 1; continue
            if ch == '"' and not in_squote:
                in_dquote = not in_dquote
                buf.append(ch); i += 1; continue

        # Terminator
        if ch == ';' and not in_squote and not in_dquote and dollar_tag is None:
            buf.append(ch)
            stmt = ''.join(buf).strip()
            if stmt:
                statements.append(stmt)
            buf = []
            i += 1
            continue

        buf.append(ch); i += 1

    tail = ''.join(buf).strip()
    if tail:
        statements.append(tail)
    return statements

def extract_table_names(statements: List[str], prefix: str) -> Set[str]:
    matched: Set[str] = set()
    for st in statements:
        m = RE_CREATE_TABLE.match(st)
        if not m:
            continue
        name = normalize_ident(m.group('name'))
        table = name.split('.')[-1]
        if table.lower().startswith(prefix.lower()):
            matched.add(name.lower())
    return matched

def stmt_references_table(stmt: str, tables: Set[str]) -> bool:
    low = stmt.lower()
    for t in tables:
        if t in low:
            return True
        bare = t.split('.')[-1]
        if re.search(r'\b' + re.escape(bare) + r'\b', low):
            return True
    return False

def sequence_relevant(stmt: str, prefix: str, tables: Set[str]) -> bool:
    m = RE_CREATE_SEQUENCE.match(stmt)
    if m:
        seq = normalize_ident(m.group('name')).lower()
        bare = seq.split('.')[-1]
        if bare.startswith(prefix.lower()):
            return True
    return stmt_references_table(stmt, tables)

def extract_blocks(sql_text: str, prefix: str) -> Tuple[List[str], List[str], List[str], List[str], List[str]]:
    statements = split_sql_statements(sql_text)
    tables = extract_table_names(statements, prefix)

    create_tables: List[str] = []
    sequences: List[str] = []
    constraints: List[str] = []
    indexes: List[str] = []
    comments: List[str] = []

    for st in statements:
        m = RE_CREATE_TABLE.match(st)
        if m:
            name = normalize_ident(m.group('name')).lower()
            if name in tables:
                create_tables.append(st)

    for st in statements:
        if RE_CREATE_SEQUENCE.match(st) or st.strip().lower().startswith('alter sequence'):
            if sequence_relevant(st, prefix, tables):
                sequences.append(st)

    for st in statements:
        m = RE_ALTER_TABLE_TARGET.match(st)
        if m:
            tbl = normalize_ident(m.group('name')).lower()
            if tbl in tables and RE_ALTER_TABLE_ADD_CONSTRAINT.search(st):
                constraints.append(st)

    for st in statements:
        m = RE_CREATE_INDEX_ON.match(st)
        if m:
            tbl = normalize_ident(m.group('name')).lower()
            if tbl in tables:
                indexes.append(st)

    for st in statements:
        m1 = RE_COMMENT_ON_TABLE.match(st)
        if m1:
            tbl = normalize_ident(m1.group('name')).lower()
            if tbl in tables:
                comments.append(st)
            continue
        m2 = RE_COMMENT_ON_COLUMN.match(st)
        if m2:
            full = normalize_ident(m2.group('name')).lower()
            parts = full.split('.')
            if len(parts) >= 2:
                tbl = '.'.join(parts[:-1])
                if tbl in tables or parts[-2] in {t.split('.')[-1] for t in tables}:
                    comments.append(st)

    return create_tables, sequences, constraints, indexes, comments

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--in', dest='inp', required=True, help='Input SQL DDL file')
    ap.add_argument('--prefix', required=True, help='Table prefix (e.g., adm_)')
    ap.add_argument('--out', required=True, help='Output file to write extracted DDL')
    ap.add_argument('--schema', default='', help='Optional schema name to add SET search_path')
    args = ap.parse_args()

    sql_path = Path(args.inp)
    text = sql_path.read_text(encoding='utf-8', errors='ignore')

    create_tables, sequences, constraints, indexes, comments = extract_blocks(text, args.prefix)

    header = [
        f'-- Auto-generated by extract_ddl.py (v2) at {datetime.now().isoformat()}',
        f'-- Source: {sql_path.name}',
        f'-- Prefix: {args.prefix}',
        '',
    ]
    if args.schema:
        header += [f'SET search_path TO {args.schema};', '']

    out_lines: List[str] = []
    out_lines += header

    def emit(section: str, items: List[str]):
        if not items:
            return
        out_lines.append('-- ------------------------------------------------------------------')
        out_lines.append(f'-- {section} ({len(items)})')
        out_lines.append('-- ------------------------------------------------------------------')
        out_lines.append('')
        for it in items:
            s = it.rstrip()
            out_lines.append(s if s.endswith(';') else (s + ';'))
            out_lines.append('')
        out_lines.append('')

    emit('CREATE TABLE', create_tables)
    emit('SEQUENCES (relevant)', sequences)
    emit('CONSTRAINTS (ALTER TABLE ... ADD ...)', constraints)
    emit('INDEXES', indexes)
    emit('COMMENTS', comments)

    Path(args.out).write_text('\n'.join(out_lines).strip() + '\n', encoding='utf-8')

    print(f'Tables: {len(create_tables)} | Seq: {len(sequences)} | Cons: {len(constraints)} | Idx: {len(indexes)} | Comm: {len(comments)}')
    print(f'Wrote: {args.out}')

if __name__ == '__main__':
    main()

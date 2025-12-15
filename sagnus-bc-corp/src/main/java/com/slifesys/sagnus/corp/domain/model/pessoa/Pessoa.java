package com.slifesys.sagnus.corp.domain.model.pessoa;

import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Getter;

import java.time.Instant;

@Getter
public class Pessoa {

    private final PessoaId id;     // null quando novo (até persistir)
    private final TipoPessoa tipo;

    private Documento documento;
    private Nome nome;
    private Email email;
    private Endereco endereco;

    private boolean ativa;
    private Instant criadaEm;
    private Instant atualizadaEm;

    private Pessoa(PessoaId id, TipoPessoa tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public static Pessoa criarNova(TipoPessoa tipo,
                                  String documento,
                                  String nome,
                                  String email,
                                  Endereco endereco) {
        if (tipo == null) {
            throw new BusinessException("CORP-000", "Tipo de pessoa é obrigatório.");
        }

        Pessoa p = new Pessoa(null, tipo);
        p.documento = Documento.of(documento, tipo);
        p.nome = Nome.of(nome);
        p.email = Email.of(email);
        p.endereco = endereco;

        p.ativa = true;
        p.criadaEm = Instant.now();
        p.atualizadaEm = p.criadaEm;
        return p;
    }

    public void alterarDados(String nome, String email, Endereco endereco) {
        this.nome = Nome.of(nome);
        this.email = Email.of(email);
        this.endereco = endereco;
        this.atualizadaEm = Instant.now();
    }

    public void inativar(String motivo) {
        if (!this.ativa) return;
        if (motivo == null || motivo.isBlank()) {
            throw new BusinessException("CORP-020", "Motivo de inativação é obrigatório.");
        }
        this.ativa = false;
        this.atualizadaEm = Instant.now();
    }

    public void reativar() {
        if (this.ativa) return;
        this.ativa = true;
        this.atualizadaEm = Instant.now();
    }
}

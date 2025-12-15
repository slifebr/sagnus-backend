package com.slifesys.sagnus.corp.domain.model.pessoa;

import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Getter;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Getter
public class Pessoa {

    private final PessoaId id;
    private final TipoPessoa tipo;

    private Documento documento;
    private Nome nome;
    private Email email;
    private String site;

    private boolean ativa;
    private Instant criadaEm;
    private Instant atualizadaEm;

    private final List<Endereco> enderecos = new ArrayList<>();

    private Pessoa(PessoaId id, TipoPessoa tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    public static Pessoa criarNova(TipoPessoa tipo,
                                  String documento,
                                  String nome,
                                  String email,
                                  String site) {
        if (tipo == null) {
            throw new BusinessException("CORP-000", "Tipo de pessoa é obrigatório.");
        }

        Pessoa p = new Pessoa(null, tipo);
        p.documento = Documento.of(documento, tipo);
        p.nome = Nome.of(nome);
        p.email = Email.of(email);
        p.site = (site != null && !site.isBlank()) ? site.trim() : null;

        p.ativa = true;
        p.criadaEm = Instant.now();
        p.atualizadaEm = p.criadaEm;
        return p;
    }

    public static Pessoa reconstruir(PessoaId id,
                                    TipoPessoa tipo,
                                    Documento documento,
                                    Nome nome,
                                    Email email,
                                    String site,
                                    boolean ativa,
                                    Instant criadaEm,
                                    Instant atualizadaEm,
                                    List<Endereco> enderecos) {
        if (id == null) throw new BusinessException("CORP-900", "Id obrigatório na reconstrução.");
        if (tipo == null) throw new BusinessException("CORP-901", "Tipo obrigatório na reconstrução.");

        Pessoa p = new Pessoa(id, tipo);
        p.documento = documento;
        p.nome = nome;
        p.email = email;
        p.site = site;
        p.ativa = ativa;
        p.criadaEm = criadaEm;
        p.atualizadaEm = atualizadaEm;

        if (enderecos != null) p.enderecos.addAll(enderecos);
        return p;
    }

    public void alterarDados(String nome, String email, String site) {
        this.nome = Nome.of(nome);
        this.email = Email.of(email);
        this.site = (site != null && !site.isBlank()) ? site.trim() : null;
        this.atualizadaEm = Instant.now();
    }
}

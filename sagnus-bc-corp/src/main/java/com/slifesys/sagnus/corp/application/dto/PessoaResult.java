package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaResult {
    Long id;
    TipoPessoa tipo;
    String documento;
    String nome;
    String email;
    String site;
    boolean ativa;

    public static PessoaResult from(com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa p) {
        if (p == null) return null;
        return PessoaResult.builder()
                .id(p.getId() != null ? p.getId().getValue() : null)
                .tipo(p.getTipo())
                .documento(p.getDocumento().getValue())
                .nome(p.getNome().getValue())
                .email(p.getEmail() != null ? p.getEmail().getValue() : null)
                .site(p.getSite())
                .ativa(p.isAtiva())
                .build();
    }
}

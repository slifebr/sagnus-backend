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
}

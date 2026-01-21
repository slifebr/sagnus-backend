package com.slifesys.sagnus.corp.contract.pessoa;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaDTO {
    Long id;
    TipoPessoa tipo;
    String documento;
    String nome;
    String email;
    String site;
    boolean ativa;
}

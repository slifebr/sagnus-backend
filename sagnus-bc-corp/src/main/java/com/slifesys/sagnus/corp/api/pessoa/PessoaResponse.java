package com.slifesys.sagnus.corp.api.pessoa;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaResponse {
    Long id;
    String nome;
    String tipo;
    String site;
    String email;
}

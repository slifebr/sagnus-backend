package com.slifesys.sagnus.corp.contract.pessoa;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaUpdateRequest {
    Long id;
    String nome;
    String email;
    String site;
}

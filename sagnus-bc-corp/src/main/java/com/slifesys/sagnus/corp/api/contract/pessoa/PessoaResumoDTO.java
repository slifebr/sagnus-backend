package com.slifesys.sagnus.corp.api.contract.pessoa;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaResumoDTO {
    Long pessoaId;
    String nome;
    String tipo; // "F" ou "J"
    String documento; // CPF ou CNPJ
}

package com.slifesys.sagnus.estoque.application.result;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class CreateAlmoxarifadoResult {
    Long id;
    String nome;
    String status;
    String mensagem;
}

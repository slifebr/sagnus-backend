package com.slifesys.sagnus.nfe.contract.emitir;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class EmitirNfeResponse {
    String nfeId;
    String status;
    String mensagem;
}

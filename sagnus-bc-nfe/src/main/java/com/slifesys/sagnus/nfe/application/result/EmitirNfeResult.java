package com.slifesys.sagnus.nfe.application.result;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class EmitirNfeResult {
    String nfeId;
    String status;
    String mensagem;
}

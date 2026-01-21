package com.slifesys.sagnus.nfe.contract.emitir;

import lombok.Builder;
import lombok.Value;

import java.util.List;

@Value
@Builder
public class EmitirNfeRequest {
    Long emitentePessoaId;
    Long destinatarioPessoaId;

    List<EmitirNfeItemRequest> itens;
}

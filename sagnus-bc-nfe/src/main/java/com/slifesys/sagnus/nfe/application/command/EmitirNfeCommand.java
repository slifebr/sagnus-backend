package com.slifesys.sagnus.nfe.application.command;

import lombok.Builder;
import lombok.Value;

import java.util.List;

@Value
@Builder
public class EmitirNfeCommand {
    Long emitentePessoaId;
    Long destinatarioPessoaId;

    // itens
    List<EmitirNfeItemCommand> itens;

    // (futuro) naturezaOperacao, dataEmissao, etc.
}

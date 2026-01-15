package com.slifesys.sagnus.corp.application.command;

import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class AlterarPessoaCommand {
    Long id;
    String nome;
    String email;
    String site;
}

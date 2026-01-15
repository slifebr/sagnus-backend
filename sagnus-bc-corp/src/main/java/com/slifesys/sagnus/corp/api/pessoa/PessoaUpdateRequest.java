package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.command.AlterarPessoaCommand;
import lombok.Data;

@Data
public class PessoaUpdateRequest {
    private String nome;
    private String site;
    private String email;

    public AlterarPessoaCommand toCommand(Long id) {
        return AlterarPessoaCommand.builder()
                .id(id)
                .nome(nome)
                .site(site)
                .email(email)
                .build();
    }
}

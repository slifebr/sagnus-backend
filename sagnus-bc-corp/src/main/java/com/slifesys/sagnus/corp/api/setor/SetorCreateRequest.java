package com.slifesys.sagnus.corp.api.setor;

import com.slifesys.sagnus.corp.application.command.CadastrarSetorCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class SetorCreateRequest {

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    private String usuario;

    public CadastrarSetorCommand toCommand() {
        return CadastrarSetorCommand.builder()
                .nome(nome)
                .descricao(descricao)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

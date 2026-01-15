package com.slifesys.sagnus.corp.api.tipoadmissao;

import com.slifesys.sagnus.corp.application.command.CadastrarTipoAdmissaoCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class TipoAdmissaoCreateRequest {

    private String codigo;

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    private String usuario;

    public CadastrarTipoAdmissaoCommand toCommand() {
        return CadastrarTipoAdmissaoCommand.builder()
                .codigo(codigo)
                .nome(nome)
                .descricao(descricao)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

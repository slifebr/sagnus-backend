package com.slifesys.sagnus.corp.api.unidade;

import com.slifesys.sagnus.corp.application.dto.CadastrarUnidadeCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UnidadeCreateRequest {

    private String sigla;

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    private String usuario;

    public CadastrarUnidadeCommand toCommand() {
        return CadastrarUnidadeCommand.builder()
                .sigla(sigla)
                .nome(nome)
                .descricao(descricao)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

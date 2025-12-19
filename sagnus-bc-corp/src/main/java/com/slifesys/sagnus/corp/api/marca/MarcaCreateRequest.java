package com.slifesys.sagnus.corp.api.marca;

import com.slifesys.sagnus.corp.application.dto.CadastrarMarcaCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class MarcaCreateRequest {

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    // User context in real app would come from security context, here we pass or
    // mock it
    private String usuario;

    public CadastrarMarcaCommand toCommand() {
        return CadastrarMarcaCommand.builder()
                .nome(nome)
                .descricao(descricao)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

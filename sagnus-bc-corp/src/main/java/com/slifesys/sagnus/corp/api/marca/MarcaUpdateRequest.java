package com.slifesys.sagnus.corp.api.marca;

import com.slifesys.sagnus.corp.application.command.AlterarMarcaCommand;
import lombok.Data;

@Data
public class MarcaUpdateRequest {

    private String nome;
    private String descricao;
    private String usuario;

    public AlterarMarcaCommand toCommand(Long id) {
        return AlterarMarcaCommand.builder()
                .id(id)
                .nome(nome)
                .descricao(descricao)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

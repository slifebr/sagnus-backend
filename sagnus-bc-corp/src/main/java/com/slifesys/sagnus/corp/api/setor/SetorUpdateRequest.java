package com.slifesys.sagnus.corp.api.setor;

import com.slifesys.sagnus.corp.application.dto.AlterarSetorCommand;
import lombok.Data;

@Data
public class SetorUpdateRequest {

    private String nome;
    private String descricao;
    private String usuario;

    public AlterarSetorCommand toCommand(Long id) {
        return AlterarSetorCommand.builder()
                .id(id)
                .nome(nome)
                .descricao(descricao)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

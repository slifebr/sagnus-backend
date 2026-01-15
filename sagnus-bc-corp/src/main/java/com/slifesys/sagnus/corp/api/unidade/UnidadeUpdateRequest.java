package com.slifesys.sagnus.corp.api.unidade;

import com.slifesys.sagnus.corp.application.command.AlterarUnidadeCommand;
import lombok.Data;

@Data
public class UnidadeUpdateRequest {

    private String sigla;
    private String nome;
    private String descricao;
    private String usuario;

    public AlterarUnidadeCommand toCommand(Long id) {
        return AlterarUnidadeCommand.builder()
                .id(id)
                .sigla(sigla)
                .nome(nome)
                .descricao(descricao)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

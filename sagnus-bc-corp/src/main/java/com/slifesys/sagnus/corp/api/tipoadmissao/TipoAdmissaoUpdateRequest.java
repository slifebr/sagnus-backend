package com.slifesys.sagnus.corp.api.tipoadmissao;

import com.slifesys.sagnus.corp.application.command.AlterarTipoAdmissaoCommand;
import lombok.Data;

@Data
public class TipoAdmissaoUpdateRequest {

    private String codigo;
    private String nome;
    private String descricao;
    private String usuario;

    public AlterarTipoAdmissaoCommand toCommand(Long id) {
        return AlterarTipoAdmissaoCommand.builder()
                .id(id)
                .codigo(codigo)
                .nome(nome)
                .descricao(descricao)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

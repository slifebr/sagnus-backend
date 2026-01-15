package com.slifesys.sagnus.corp.api.tiporelacionamento;

import com.slifesys.sagnus.corp.application.command.AlterarTipoRelacionamentoCommand;
import lombok.Data;

@Data
public class TipoRelacionamentoUpdateRequest {

    private String nome;
    private String descricao;
    private String usuario;

    public AlterarTipoRelacionamentoCommand toCommand(Long id) {
        return AlterarTipoRelacionamentoCommand.builder()
                .id(id)
                .nome(nome)
                .descricao(descricao)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

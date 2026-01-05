package com.slifesys.sagnus.corp.api.tiporelacionamento;

import com.slifesys.sagnus.corp.application.dto.CadastrarTipoRelacionamentoCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class TipoRelacionamentoCreateRequest {

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private String descricao;

    private String usuario;

    public CadastrarTipoRelacionamentoCommand toCommand() {
        return CadastrarTipoRelacionamentoCommand.builder()
                .nome(nome)
                .descricao(descricao)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

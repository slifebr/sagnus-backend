package com.slifesys.sagnus.adm.application.command;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateModuloCommand(
        @NotBlank @Size(max = 3) String codigo,
        @NotBlank @Size(max = 100) String nome,
        String descricao,
        @NotBlank @Size(max = 30) String usuCriacao
) {
}

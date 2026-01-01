package com.slifesys.sagnus.adm.application.command;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateCategoriaCommand(
        @NotBlank @Size(max=100) String nome,
        @Size(max=50) String cor,
        @NotBlank @Size(max=30) String usuCriacao
) {
}

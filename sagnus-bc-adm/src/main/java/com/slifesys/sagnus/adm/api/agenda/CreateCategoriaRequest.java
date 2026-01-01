package com.slifesys.sagnus.adm.api.agenda;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateCategoriaRequest(
        @NotBlank @Size(max=100) String nome,
        @Size(max=50) String cor,
        @NotBlank @Size(max=30) String usuCriacao
) {
}

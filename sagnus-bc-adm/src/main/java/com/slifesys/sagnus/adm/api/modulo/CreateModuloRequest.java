package com.slifesys.sagnus.adm.api.modulo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateModuloRequest(
        @NotBlank @Size(max=3) String codigo,
        @NotBlank @Size(max=100) String nome,
        String descricao,
        @NotBlank @Size(max=30) String usuCriacao
) {
}

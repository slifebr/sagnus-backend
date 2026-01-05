package com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateExampleRequest(
        @NotBlank @Size(max = 80) String nome
) {}

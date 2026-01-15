package com.slifesys.sagnus.fina.base.api.example;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CreateExampleRequest(
        @NotBlank @Size(max = 80) String nome
) {}

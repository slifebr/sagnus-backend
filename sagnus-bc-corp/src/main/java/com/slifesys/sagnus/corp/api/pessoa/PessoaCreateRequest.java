package com.slifesys.sagnus.corp.api.pessoa;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class PessoaCreateRequest {

    @NotBlank
    @Size(max = 150)
    private String nome;

    /** 'F' ou 'J' */
    @Size(max = 1)
    private String tipo;

    @Size(max = 250)
    private String site;

    @Size(max = 250)
    private String email;
}

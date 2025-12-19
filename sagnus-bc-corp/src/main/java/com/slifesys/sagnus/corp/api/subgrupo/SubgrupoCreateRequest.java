package com.slifesys.sagnus.corp.api.subgrupo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubgrupoCreateRequest {
    @NotNull(message = "O ID do grupo é obrigatório")
    private Long idGrupo;

    @NotBlank(message = "O nome é obrigatório")
    private String nome;

    private String descricao;
}

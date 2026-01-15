package com.slifesys.sagnus.adm.domain.model.empresa;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Empresa {
    private Long id;
    private String nome;
    private String nif;
    private boolean ativo;
}

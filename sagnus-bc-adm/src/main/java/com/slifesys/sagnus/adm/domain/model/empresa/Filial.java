package com.slifesys.sagnus.adm.domain.model.empresa;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Filial {
    private Long id;
    private Long empresaId;
    private String nome;
    private String codigo;
    private boolean ativo;
}

package com.slifesys.sagnus.adm.domain.model.parametro;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ParametroSistema {
    private Long id;
    private String chave;
    private String valor;
    private String escopo; // EMPRESA, FILIAL, GLOBAL
    private boolean ativo;
}

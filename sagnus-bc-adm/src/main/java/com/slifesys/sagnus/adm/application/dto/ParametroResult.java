package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ParametroResult {
    private Long id;
    private String chave;
    private String valor;
    private String escopo;
    private boolean ativo;
}

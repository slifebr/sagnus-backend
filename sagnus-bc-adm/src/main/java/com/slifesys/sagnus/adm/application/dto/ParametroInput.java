package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ParametroInput {
    private String chave;
    private String valor;
    private String escopo;
}

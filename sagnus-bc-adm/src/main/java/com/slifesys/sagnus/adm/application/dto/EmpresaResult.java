package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class EmpresaResult {
    private Long id;
    private String nome;
    private String nif;
    private boolean ativo;
}

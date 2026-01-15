package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class FilialResult {
    private Long id;
    private Long empresaId;
    private String nome;
    private String codigo;
    private boolean ativo;
}

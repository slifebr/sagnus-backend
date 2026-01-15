package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;
import java.util.List;

@Getter
@Builder
public class PerfilResult {
    private Long id;
    private String nome;
    private boolean ativo;
    private List<String> permissoes; // Codes only for simplicity in result
}

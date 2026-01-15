package com.slifesys.sagnus.adm.application.dto;

import lombok.Builder;
import lombok.Getter;
import java.util.List;

@Getter
@Builder
public class UsuarioResult {
    private Long id;
    private String username;
    private String nome;
    private String email;
    private boolean ativo;
    private List<PerfilResult> perfis;
}

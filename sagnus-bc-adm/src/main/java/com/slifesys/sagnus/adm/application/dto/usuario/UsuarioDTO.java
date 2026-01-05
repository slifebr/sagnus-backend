package com.slifesys.sagnus.adm.application.dto.usuario;

import lombok.Data;

@Data
public class UsuarioDTO {
    private Long id;
    private String nome;
    private String login;
    private String senha;
    private String email;
    private Boolean ativo;
    private Long empresaId;
}

package com.slifesys.sagnus.adm.application.dto.usuario;

import lombok.Data;

@Data
public class PerfilDTO {
    private Long id;
    private String nome;
    private String descricao;
    private Boolean ativo;
}

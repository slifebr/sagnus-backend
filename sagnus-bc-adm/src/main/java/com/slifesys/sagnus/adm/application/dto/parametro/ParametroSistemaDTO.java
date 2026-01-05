package com.slifesys.sagnus.adm.application.dto.parametro;

import lombok.Data;

@Data
public class ParametroSistemaDTO {
    private Long id;
    private String nome;
    private String valor;
    private String descricao;
}

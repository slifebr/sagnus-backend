package com.slifesys.sagnus.estoque.application.dto;

import lombok.Data;

@Data
public class EstoqueLocalDTO {
    private Long id;
    private String nome;
    private Boolean ativo;
}

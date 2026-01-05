package com.slifesys.sagnus.estoque.domain.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EstoqueLocal {
    private Long id;
    private String nome;
    private boolean ativo = true;
}

package com.slifesys.sagnus.adm.domain.model.usuario;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Permissao {
    private Long id;
    private String codigo;
    private String descricao;
}

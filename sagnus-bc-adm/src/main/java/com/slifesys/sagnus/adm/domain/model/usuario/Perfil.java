package com.slifesys.sagnus.adm.domain.model.usuario;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Set;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Perfil {
    private Long id;
    private String nome;
    private boolean ativo;
    private Set<Permissao> permissoes;
}

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
public class Usuario {
    private Long id;
    private String username;
    private String nome;
    private String email;
    private boolean ativo;
    private Set<Perfil> perfis;
}

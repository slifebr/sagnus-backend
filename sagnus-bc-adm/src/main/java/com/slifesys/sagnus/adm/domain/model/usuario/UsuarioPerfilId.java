package com.slifesys.sagnus.adm.domain.model.usuario;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsuarioPerfilId implements Serializable {

    @Column(name = "usuario_id")
    private Long usuarioId;

    @Column(name = "perfil_id")
    private Long perfilId;
}

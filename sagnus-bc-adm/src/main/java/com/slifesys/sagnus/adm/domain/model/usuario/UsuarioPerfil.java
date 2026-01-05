package com.slifesys.sagnus.adm.domain.model.usuario;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Representa a associação entre um Usuário e um Perfil.
 */
@Entity
@Table(name = "adm_usuario_perfil")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class UsuarioPerfil {

    @EmbeddedId
    @EqualsAndHashCode.Include
    private UsuarioPerfilId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("usuarioId")
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("perfilId")
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;
}

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
 * Representa a associação entre um Perfil e uma Permissão.
 */
@Entity
@Table(name = "adm_perfil_permissao")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class PerfilPermissao {

    @EmbeddedId
    @EqualsAndHashCode.Include
    private PerfilPermissaoId id;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("perfilId")
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("permissaoId")
    @JoinColumn(name = "permissao_id")
    private Permissao permissao;
}

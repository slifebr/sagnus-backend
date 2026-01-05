package com.slifesys.sagnus.adm.domain.model.parametro;

import com.slifesys.sagnus.adm.domain.model.enums.EscopoParametro;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Representa um Parâmetro de Sistema.
 */
@Entity
@Table(name = "adm_parametro_sistema")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ParametroSistema {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    @NotBlank
    @Column(nullable = false, unique = true)
    private String chave;

    @NotBlank
    @Column(nullable = false)
    private String valor;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private EscopoParametro escopo;

    @NotNull
    @Column(nullable = false)
    private Boolean ativo = true;
}

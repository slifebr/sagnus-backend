package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "adm_parametro_sistema")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ParametroSistemaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    @Column(nullable = false, unique = true)
    private String chave;

    @Column(nullable = false)
    private String valor;

    @Column(nullable = false)
    private String escopo;

    @Column(nullable = false)
    private Boolean ativo = true;
}

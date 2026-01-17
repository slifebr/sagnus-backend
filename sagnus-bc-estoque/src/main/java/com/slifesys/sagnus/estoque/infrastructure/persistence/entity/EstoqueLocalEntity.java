package com.slifesys.sagnus.estoque.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "supr_estq_local", schema = "sagnus")
public class EstoqueLocalEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_almoxarifado", nullable = false)
    private com.slifesys.sagnus.estoque.domain.model.Almoxarifado almoxarifado;

    @ManyToOne
    @JoinColumn(name = "id_grade", nullable = false)
    private com.slifesys.sagnus.estoque.domain.model.Grade grade;

    private java.math.BigDecimal quantidade;

    @Column(name = "estq_max")
    private java.math.BigDecimal estqMax;

    @Column(name = "estq_min")
    private java.math.BigDecimal estqMin;
}

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

    @Column(nullable = false)
    private String nome;

    private boolean ativo = true;
}

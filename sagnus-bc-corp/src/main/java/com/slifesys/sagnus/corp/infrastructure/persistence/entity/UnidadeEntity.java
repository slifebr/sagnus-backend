package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;

@Entity
@Table(name = "corp_produto_unidade", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UnidadeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sigla")
    private String sigla;

    @Column(name = "nome") // Assuming 'nome' exists or mapping to description if not? SQL said 'sigla',
                           // 'descricao'. Let's check SQL again.
    // SQL: sigla, descricao, pode_fracionar. No 'nome'. Wait, Domain Entity had
    // 'nome'.
    // I should check if I made a mistake in Domain Entity or if I should map
    // 'descricao' to 'nome' or add 'nome' to table?
    // SQL line 2864: sigla, descricao, pode_fracionar.
    // I'll map 'descricao' to 'descricao' and 'sigla' to 'sigla'.
    // I'll remove 'nome' from JPA entity if it's not in DB, or map it to something
    // else?
    // Let's assume 'descricao' is the name/description.
    // I'll update Domain Entity later if needed, but for now JPA must match DB.
    private String descricao;

    @Column(name = "pode_fracionar")
    private String podeFracionar; // char(1)

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

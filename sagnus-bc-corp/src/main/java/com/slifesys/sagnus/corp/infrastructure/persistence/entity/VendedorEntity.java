package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "corp_vendedor", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class VendedorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_colaborador", nullable = false)
    private Long idColaborador; // Maps to 'id_colaborador' in SQL, likely 'idPessoa' in Domain

    @Column(name = "id_comissao_perfil")
    private Long idComissaoPerfil;

    @Column(name = "comissao")
    private BigDecimal comissao;

    @Column(name = "meta_venda")
    private BigDecimal metaVenda;

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

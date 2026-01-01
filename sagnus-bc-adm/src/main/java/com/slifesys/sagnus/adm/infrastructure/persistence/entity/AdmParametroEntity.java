package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(schema = "sagnus", name = "adm_parametro")
public class AdmParametroEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "fin_parcela_aberto")
    private Long finParcelaAberto;

    @Column(name = "fin_parcela_quitado")
    private Long finParcelaQuitado;

    @Column(name = "fin_parcela_quitado_parcial")
    private Long finParcelaQuitadoParcial;

    @Column(name = "fin_tipo_recebimento_edi")
    private Long finTipoRecebimentoEdi;

    @Column(name = "compra_fin_doc_origem")
    private Long compraFinDocOrigem;

    @Column(name = "compra_conta_caixa")
    private Long compraContaCaixa;

    @Column(name = "criado_em", nullable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao", length = 30, nullable = false)
    private String usuCriacao;

    @Column(name = "atualizado_em")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao", length = 30)
    private String usuAlteracao;
}

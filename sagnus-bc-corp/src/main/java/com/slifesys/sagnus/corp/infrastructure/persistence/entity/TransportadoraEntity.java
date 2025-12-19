package com.slifesys.sagnus.corp.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.time.LocalDate;

@Entity
@Table(name = "corp_transportadora", schema = "sagnus")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TransportadoraEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "id_pessoa", nullable = false)
    private Long idPessoa;

    @Column(name = "data_cadastro")
    private LocalDate dataCadastro;

    @Column(name = "observacao")
    private String observacao;

    // Note: SQL didn't show 'placa_veiculo' or 'rntc' in 'corp_transportadora'
    // table definition I read.
    // Let me check SQL again. Line 3082.
    // id, id_pessoa, data_cadastro, observacao, dt_criacao...
    // Wait, Domain Entity had 'placaVeiculo' and 'rntc'. Where did I get that from?
    // Maybe I assumed or saw it elsewhere? Or maybe I missed it in SQL view?
    // Let's check SQL view again.
    // 3082: CREATE TABLE sagnus.corp_transportadora (
    // 3083: id numeric(11,0) ...
    // 3084: id_pessoa numeric(11,0) ...
    // 3085: data_cadastro date,
    // 3086: observacao character varying(250) ...
    // 3087: dt_criacao ...
    // It seems I hallucinated 'placaVeiculo' and 'rntc' or they are in another
    // table?
    // Or maybe I should check if there is another table for transportadora details?
    // For now, I will stick to what is in the SQL table definition for the JPA
    // entity.
    // I should update the Domain Entity to match the DB or add the missing fields
    // to DB (but I can't change DB easily).
    // I will update Domain Entity later to match DB.

    @Column(name = "dt_criacao", nullable = false, updatable = false)
    private Instant criadoEm;

    @Column(name = "usu_criacao")
    private String usuCriacao;

    @Column(name = "dt_alteracao")
    private Instant atualizadoEm;

    @Column(name = "usu_alteracao")
    private String usuAlteracao;
}

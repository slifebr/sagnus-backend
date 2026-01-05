package com.slifesys.sagnus.estoque.domain.model;

import java.math.BigDecimal;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "supr_estq_tamanho")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Tamanho {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    private String codigo;

    private String nome;

    private BigDecimal altura;

    private BigDecimal comprimento;
    
    private BigDecimal largura;
}

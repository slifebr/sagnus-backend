package com.slifesys.sagnus.estoque.domain.model;

import java.math.BigDecimal;
import com.slifesys.sagnus.corp.domain.model.Produto;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "supr_estq_grade")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Grade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_produto", nullable = false)
    private Produto produto;

    @ManyToOne
    @JoinColumn(name = "id_estq_marca")
    private Marca marca;

    @ManyToOne
    @JoinColumn(name = "id_estq_sabor")
    private Sabor sabor;

    @ManyToOne
    @JoinColumn(name = "id_estq_tamanho")
    private Tamanho tamanho;

    @ManyToOne
    @JoinColumn(name = "id_estq_cor")
    private Cor cor;

    private String codigo;

    private BigDecimal quantidade;
}

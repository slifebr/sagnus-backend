package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "nfe_item")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NfeItemEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "nfe_id", nullable = false)
    private NfeEntity nfe;

    @Column(name = "n_item", nullable = false)
    private Integer nItem;

    @Column(name = "produto_id", nullable = false)
    private Long produtoId;

    @Column(name = "descricao", nullable = false, length = 400)
    private String descricao;

    @Column(name = "ncm", nullable = false, length = 8)
    private String ncm;

    @Column(name = "cfop", nullable = false, length = 4)
    private String cfop;

    @Column(name = "ucom", nullable = false, length = 10)
    private String uCom;

    @Column(name = "quantidade", nullable = false, precision = 18, scale = 6)
    private BigDecimal quantidade;

    @Column(name = "valor_unitario", nullable = false, precision = 18, scale = 6)
    private BigDecimal valorUnitario;

    @Column(name = "desconto", nullable = false, precision = 18, scale = 6)
    private BigDecimal desconto;

    @Column(name = "frete", nullable = false, precision = 18, scale = 6)
    private BigDecimal frete;

    @Column(name = "seguro", nullable = false, precision = 18, scale = 6)
    private BigDecimal seguro;

    @Column(name = "outras", nullable = false, precision = 18, scale = 6)
    private BigDecimal outras;

    @Column(name = "tributacao_json", columnDefinition = "text")
    private String tributacaoJson;

}

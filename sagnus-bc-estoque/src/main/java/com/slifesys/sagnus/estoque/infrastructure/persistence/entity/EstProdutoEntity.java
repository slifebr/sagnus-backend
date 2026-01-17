package com.slifesys.sagnus.estoque.infrastructure.persistence.entity;

import jakarta.persistence.*;
import lombok.Data;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "supr_estq_produto")
@Data
public class EstProdutoEntity implements Serializable{
        private static final long serialVersionUID = 1L;
    
        public EstProdutoEntity() {
            //standard constructor
        }
    
        @Id 
        @GeneratedValue(strategy = GenerationType.IDENTITY) 
        private Integer id;
    
        @Column(name="id_tribut_icms_custom_cab")
        private Integer idTributIcmsCustomCab;
    
        @Column(name="id_tribut_grupo_tributario")
        private Integer idTributGrupoTributario;
    
        @Column(name="nome")
        private String nome;
    
        @Column(name="descricao")
        private String descricao;
    
        @Column(name="gtin")
        private String gtin;
    
        @Column(name="codigo_interno")
        private String codigoInterno;
    
        @Column(name="valor_compra")
        private BigDecimal valorCompra;
    
        @Column(name="valor_venda")
        private BigDecimal valorVenda;
    
        @Column(name="codigo_ncm")
        private String codigoNcm;
    
        @Column(name="estoque_minimo")
        private BigDecimal estoqueMinimo;
    
        @Column(name="estoque_maximo")
        private BigDecimal estoqueMaximo;
    
        @Column(name="quantidade_estoque")
        private BigDecimal quantidadeEstoque;
    
        @Temporal(TemporalType.DATE)
        @Column(name="data_cadastro")
        private Date dataCadastro;
    
        /*
        @ManyToOne 
        @JoinColumn(name="id_produto_unidade")
        private ProdutoUnidadeModel produtoUnidadeModel; 
    
        @ManyToOne 
        @JoinColumn(name="id_produto_marca")
        private ProdutoMarcaModel produtoMarcaModel; 
    
        @ManyToOne 
        @JoinColumn(name="id_produto_subgrupo")
        private ProdutoSubgrupoModel produtoSubgrupoModel; 
        */ 
}

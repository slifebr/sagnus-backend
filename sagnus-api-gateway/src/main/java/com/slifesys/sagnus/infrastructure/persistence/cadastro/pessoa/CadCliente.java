package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
//import com.slifesys.fenix.model.viewsDB.ViewPessoaCliente;

@Entity
@Table(name = "CAD_CLIENTE")
@NamedQuery(name = "Cliente.findAll", query = "SELECT t FROM CadCliente t")
public class CadCliente implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Temporal(TemporalType.DATE)
    @Column(name = "DESDE")
    private Date desde;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_CADASTRO")
    private Date dataCadastro;

    @Column(name = "TAXA_DESCONTO")
    private BigDecimal taxaDesconto;

    @Column(name = "LIMITE_CREDITO")
    private BigDecimal limiteCredito;

    @Column(name = "OBSERVACAO")
    private String observacao;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "ID_PESSOA")
    private CadPessoa pessoa;

    /*
        @OneToOne
        @NotFound(action = NotFoundAction.IGNORE)
        @JoinColumn(name="ID_PESSOA", nullable=true, insertable=false, updatable=false)
        private ViewPessoaCliente viewPessoaCliente;

        @ManyToOne
        @JoinColumn(name="ID_TABELA_PRECO")
        private TabelaPreco tabelaPreco;
    */
    public CadCliente() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDesde() {
        return this.desde;
    }

    public void setDesde(Date desde) {
        this.desde = desde;
    }

    public Date getDataCadastro() {
        return this.dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public BigDecimal getTaxaDesconto() {
        return this.taxaDesconto;
    }

    public void setTaxaDesconto(BigDecimal taxaDesconto) {
        this.taxaDesconto = taxaDesconto;
    }

    public BigDecimal getLimiteCredito() {
        return this.limiteCredito;
    }

    public void setLimiteCredito(BigDecimal limiteCredito) {
        this.limiteCredito = limiteCredito;
    }

    public String getObservacao() {
        return this.observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    /*
        public ViewPessoaCliente getViewPessoaCliente() {
            return this.viewPessoaCliente;
        }

        public void setViewPessoaCliente(ViewPessoaCliente viewPessoaCliente) {
            this.viewPessoaCliente = viewPessoaCliente;
        }
    */
    public CadPessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(CadPessoa pessoa) {
        this.pessoa = pessoa;
    }

    public Boolean getBloqueado() {
        return false;
    }

    public void setBloqueado(Boolean bloqueado) {
        this.setBloqueado(bloqueado);
    }
    
/*
    public TabelaPreco getTabelaPreco() {
        return this.tabelaPreco;
    }

    public void setTabelaPreco(TabelaPreco tabelaPreco) {
        this.tabelaPreco = tabelaPreco;
    }
*/

}
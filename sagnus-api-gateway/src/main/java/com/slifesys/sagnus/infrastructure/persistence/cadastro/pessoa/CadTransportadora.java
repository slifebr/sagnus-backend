package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;
//import com.slifesys.fenix.model.viewsDB.ViewPessoaTransportadora;

@Entity
@Table(name = "CAD_TRANSPORTADORA")
@NamedQuery(name = "Transportadora.findAll", query = "SELECT t FROM CadTransportadora t")
public class CadTransportadora implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_CADASTRO")
    private Date dataCadastro;

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
        private ViewPessoaTransportadora viewPessoaTransportadora;
    */
    public CadTransportadora() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDataCadastro() {
        return this.dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getObservacao() {
        return this.observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    /*
        public ViewPessoaTransportadora getViewPessoaTransportadora() {
            return this.viewPessoaTransportadora;
        }

        public void setViewPessoaTransportadora(ViewPessoaTransportadora viewPessoaTransportadora) {
            this.viewPessoaTransportadora = viewPessoaTransportadora;
        }
    */
    public CadPessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(CadPessoa pessoa) {
        this.pessoa = pessoa;
    }


}

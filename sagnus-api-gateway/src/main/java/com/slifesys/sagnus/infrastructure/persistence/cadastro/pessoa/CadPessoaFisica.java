package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "CAD_PESSOA_FISICA")
@NamedQuery(name = "PessoaFisica.findAll", query = "SELECT t FROM CadPessoaFisica t")
public class CadPessoaFisica implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "CPF")
    private String cpf;

    @Column(name = "RG")
    private String rg;

    @Column(name = "ORGAO_RG")
    private String orgaoRg;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_EMISSAO_RG")
    private Date dataEmissaoRg;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_NASCIMENTO")
    private Date dataNascimento;

    @Column(name = "SEXO")
    private String sexo;

    @Column(name = "RACA")
    private String raca;

    @Column(name = "NACIONALIDADE")
    private String nacionalidade;

    @Column(name = "NATURALIDADE")
    private String naturalidade;

    @Column(name = "NOME_PAI")
    private String nomePai;

    @Column(name = "NOME_MAE")
    private String nomeMae;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "ID_PESSOA")
    private CadPessoa pessoa;

    /*
        @ManyToOne
        @JoinColumn(name="ID_NIVEL_FORMACAO")
        private NivelFormacao nivelFormacao;

        @ManyToOne
        @JoinColumn(name="ID_ESTADO_CIVIL")
        private EstadoCivil estadoCivil;
    */
    public CadPessoaFisica() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCpf() {
        return this.cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return this.rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getOrgaoRg() {
        return this.orgaoRg;
    }

    public void setOrgaoRg(String orgaoRg) {
        this.orgaoRg = orgaoRg;
    }

    public Date getDataEmissaoRg() {
        return this.dataEmissaoRg;
    }

    public void setDataEmissaoRg(Date dataEmissaoRg) {
        this.dataEmissaoRg = dataEmissaoRg;
    }

    public Date getDataNascimento() {
        return this.dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getSexo() {
        return this.sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getRaca() {
        return this.raca;
    }

    public void setRaca(String raca) {
        this.raca = raca;
    }

    public String getNacionalidade() {
        return this.nacionalidade;
    }

    public void setNacionalidade(String nacionalidade) {
        this.nacionalidade = nacionalidade;
    }

    public String getNaturalidade() {
        return this.naturalidade;
    }

    public void setNaturalidade(String naturalidade) {
        this.naturalidade = naturalidade;
    }

    public String getNomePai() {
        return this.nomePai;
    }

    public void setNomePai(String nomePai) {
        this.nomePai = nomePai;
    }

    public String getNomeMae() {
        return this.nomeMae;
    }

    public void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae;
    }

    public CadPessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(CadPessoa pessoa) {
        this.pessoa = pessoa;
    }
/*
    public NivelFormacao getNivelFormacao() {
        return this.nivelFormacao;
    }

    public void setNivelFormacao(NivelFormacao nivelFormacao) {
        this.nivelFormacao = nivelFormacao;
    }

    public EstadoCivil getEstadoCivil() {
        return this.estadoCivil;
    }

    public void setEstadoCivil(EstadoCivil estadoCivil) {
        this.estadoCivil = estadoCivil;
    }
*/

}
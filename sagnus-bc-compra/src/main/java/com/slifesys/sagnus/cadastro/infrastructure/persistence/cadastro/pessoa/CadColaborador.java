package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;
//import com.slifesys.fenix.model.viewsDB.ViewPessoaColaborador;

@Entity
@Table(name = "CAD_COLABORADOR")
@NamedQuery(name = "Colaborador.findAll", query = "SELECT t FROM CadColaborador t")
public class CadColaborador implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MATRICULA")
    private String matricula;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_CADASTRO")
    private Date dataCadastro;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_ADMISSAO")
    private Date dataAdmissao;

    @Temporal(TemporalType.DATE)
    @Column(name = "DATA_DEMISSAO")
    private Date dataDemissao;

    @Column(name = "CTPS_NUMERO")
    private String ctpsNumero;

    @Column(name = "CTPS_SERIE")
    private String ctpsSerie;

    @Temporal(TemporalType.DATE)
    @Column(name = "CTPS_DATA_EXPEDICAO")
    private Date ctpsDataExpedicao;

    @Column(name = "CTPS_UF")
    private String ctpsUf;

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
        private ViewPessoaColaborador viewPessoaColaborador;

        @ManyToOne
        @JoinColumn(name="ID_CARGO")
        private Cargo cargo;

        @ManyToOne
        @JoinColumn(name="ID_SETOR")
        private Setor setor;

        @ManyToOne
        @JoinColumn(name="ID_COLABORADOR_SITUACAO")
        private ColaboradorSituacao colaboradorSituacao;

        @ManyToOne
        @JoinColumn(name="ID_TIPO_ADMISSAO")
        private TipoAdmissao tipoAdmissao;

        @ManyToOne
        @JoinColumn(name="ID_COLABORADOR_TIPO")
        private ColaboradorTipo colaboradorTipo;

        @ManyToOne
        @JoinColumn(name="ID_SINDICATO")
        private Sindicato sindicato;
    */
    public CadColaborador() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMatricula() {
        return this.matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Date getDataCadastro() {
        return this.dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public Date getDataAdmissao() {
        return this.dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public Date getDataDemissao() {
        return this.dataDemissao;
    }

    public void setDataDemissao(Date dataDemissao) {
        this.dataDemissao = dataDemissao;
    }

    public String getCtpsNumero() {
        return this.ctpsNumero;
    }

    public void setCtpsNumero(String ctpsNumero) {
        this.ctpsNumero = ctpsNumero;
    }

    public String getCtpsSerie() {
        return this.ctpsSerie;
    }

    public void setCtpsSerie(String ctpsSerie) {
        this.ctpsSerie = ctpsSerie;
    }

    public Date getCtpsDataExpedicao() {
        return this.ctpsDataExpedicao;
    }

    public void setCtpsDataExpedicao(Date ctpsDataExpedicao) {
        this.ctpsDataExpedicao = ctpsDataExpedicao;
    }

    public String getCtpsUf() {
        return this.ctpsUf;
    }

    public void setCtpsUf(String ctpsUf) {
        this.ctpsUf = ctpsUf;
    }

    public String getObservacao() {
        return this.observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public CadPessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(CadPessoa pessoa) {
        this.pessoa = pessoa;
    }
/*
    public ViewPessoaColaborador getViewPessoaColaborador() {
        return this.viewPessoaColaborador;
    }

    public void setViewPessoaColaborador(ViewPessoaColaborador viewPessoaColaborador) {
        this.viewPessoaColaborador = viewPessoaColaborador;
    }



    public Cargo getCargo() {
        return this.cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }

    public Setor getSetor() {
        return this.setor;
    }

    public void setSetor(Setor setor) {
        this.setor = setor;
    }

    public ColaboradorSituacao getColaboradorSituacao() {
        return this.colaboradorSituacao;
    }

    public void setColaboradorSituacao(ColaboradorSituacao colaboradorSituacao) {
        this.colaboradorSituacao = colaboradorSituacao;
    }
*/
/*
    public TipoAdmissao getTipoAdmissao() {
        return this.tipoAdmissao;
    }

    public void setTipoAdmissao(TipoAdmissao tipoAdmissao) {
        this.tipoAdmissao = tipoAdmissao;
    }

    public ColaboradorTipo getColaboradorTipo() {
        return this.colaboradorTipo;
    }

    public void setColaboradorTipo(ColaboradorTipo colaboradorTipo) {
        this.colaboradorTipo = colaboradorTipo;
    }

    public Sindicato getSindicato() {
        return this.sindicato;
    }

    public void setSindicato(Sindicato sindicato) {
        this.sindicato = sindicato;
    }
*/

}
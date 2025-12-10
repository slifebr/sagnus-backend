package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;

import jakarta.persistence.*;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Set;

@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "CAD_PESSOA")
@NamedQuery(name = "Pessoa.findAll", query = "SELECT t FROM CadPessoa t")
public class CadPessoa implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "TIPO")
    private String tipo;

    @Column(name = "SITE")
    private String site;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "EH_CLIENTE")
    private String ehCliente;

    @Column(name = "EH_FORNECEDOR")
    private String ehFornecedor;

    @Column(name = "EH_TRANSPORTADORA")
    private String ehTransportadora;

    @Column(name = "EH_COLABORADOR")
    private String ehColaborador;

    @Column(name = "EH_CONTADOR")
    private String ehContador;


    @Column(name = "EH_ATIVO")
    private String ehAtivo;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadCliente cliente;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadColaborador colaborador;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadContador contador;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadFornecedor fornecedor;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadPessoaFisica pessoaFisica;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadPessoaJuridica pessoaJuridica;

    @OneToOne(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private CadTransportadora transportadora;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CadPessoaContato> listaPessoaContato;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CadPessoaEndereco> listaPessoaEndereco;

    @OneToMany(mappedBy = "pessoa", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<CadPessoaTelefone> listaPessoaTelefone;

    public CadPessoa() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return this.tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSite() {
        return this.site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEhCliente() {
        return this.ehCliente;
    }

    public void setEhCliente(String ehCliente) {
        this.ehCliente = ehCliente;
    }

    public String getEhFornecedor() {
        return this.ehFornecedor;
    }

    public void setEhFornecedor(String ehFornecedor) {
        this.ehFornecedor = ehFornecedor;
    }

    public String getEhTransportadora() {
        return this.ehTransportadora;
    }

    public void setEhTransportadora(String ehTransportadora) {
        this.ehTransportadora = ehTransportadora;
    }

    public String getEhColaborador() {
        return this.ehColaborador;
    }

    public void setEhColaborador(String ehColaborador) {
        this.ehColaborador = ehColaborador;
    }

    public String getEhContador() {
        return this.ehContador;
    }

    public void setEhContador(String ehContador) {
        this.ehContador = ehContador;
    }

    public CadCliente getCliente() {
        return this.cliente;
    }

    public void setCliente(CadCliente cliente) {
        this.cliente = cliente;
        if (cliente != null) {
            cliente.setPessoa(this);
        }
    }

    public CadColaborador getColaborador() {
        return this.colaborador;
    }

    public void setColaborador(CadColaborador colaborador) {
        this.colaborador = colaborador;
        if (colaborador != null) {
            colaborador.setPessoa(this);
        }
    }

    public CadContador getContador() {
        return this.contador;
    }

    public void setContador(CadContador contador) {
        this.contador = contador;
        if (contador != null) {
            contador.setPessoa(this);
        }
    }

    public CadFornecedor getFornecedor() {
        return this.fornecedor;
    }

    public void setFornecedor(CadFornecedor fornecedor) {
        this.fornecedor = fornecedor;
        if (fornecedor != null) {
            fornecedor.setPessoa(this);
        }
    }

    public CadPessoaFisica getPessoaFisica() {
        return this.pessoaFisica;
    }

    public void setPessoaFisica(CadPessoaFisica pessoaFisica) {
        this.pessoaFisica = pessoaFisica;
        if (pessoaFisica != null) {
            pessoaFisica.setPessoa(this);
        }
    }

    /*
        public CadPessoaJuridica getPessoaJuridica() {
            return this.pessoaJuridica;
        }

        public void setPessoaJuridica(CadPessoaJuridica pessoaJuridica) {
            this.pessoaJuridica = pessoaJuridica;
            if (pessoaJuridica != null) {
                pessoaJuridica.setPessoa(this);
            }
        }
    */
    public CadTransportadora getTransportadora() {
        return this.transportadora;
    }

    public void setTransportadora(CadTransportadora transportadora) {
        this.transportadora = transportadora;
        if (transportadora != null) {
            transportadora.setPessoa(this);
        }
    }

    public Set<CadPessoaContato> getListaPessoaContato() {
        return this.listaPessoaContato;
    }

    public void setListaPessoaContato(Set<CadPessoaContato> listaPessoaContato) {
        this.listaPessoaContato = listaPessoaContato;
        for (CadPessoaContato pessoaContato : listaPessoaContato) {
            pessoaContato.setPessoa(this);
        }
    }

    public Set<CadPessoaEndereco> getListaPessoaEndereco() {
        return this.listaPessoaEndereco;
    }

    public void setListaPessoaEndereco(Set<CadPessoaEndereco> listaPessoaEndereco) {
        this.listaPessoaEndereco = listaPessoaEndereco;
        for (CadPessoaEndereco pessoaEndereco : listaPessoaEndereco) {
            pessoaEndereco.setPessoa(this);
        }
    }

    public Set<CadPessoaTelefone> getListaPessoaTelefone() {
        return this.listaPessoaTelefone;
    }

    public void setListaPessoaTelefone(Set<CadPessoaTelefone> listaPessoaTelefone) {
        this.listaPessoaTelefone = listaPessoaTelefone;
        for (CadPessoaTelefone pessoaTelefone : listaPessoaTelefone) {
            pessoaTelefone.setPessoa(this);
        }
    }


    public String getEhAtivo() {
        String ativo = String.valueOf(this.ehAtivo);
        return ativo;
    }

    public void setEhAtivo(String ativo) {
        this.ehAtivo = ativo;
    }
}
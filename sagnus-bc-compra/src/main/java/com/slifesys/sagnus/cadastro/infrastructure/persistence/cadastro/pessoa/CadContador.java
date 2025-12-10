package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.io.Serializable;

@Entity
@Table(name = "CAD_CONTADOR")
@NamedQuery(name = "Contador.findAll", query = "SELECT t FROM CadContador t")
public class CadContador implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "CRC_INSCRICAO")
    private String crcInscricao;

    @Column(name = "CRC_UF")
    private String crcUf;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "ID_PESSOA")
    private CadPessoa pessoa;

//    @OneToOne
//    @NotFound(action = NotFoundAction.IGNORE)
//	  @JoinColumn(name="ID_PESSOA", nullable=true, insertable=false, updatable=false)
//    private ViewPessoaContador viewPessoaContador;

    public CadContador() {
        //construtor padrão
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCrcInscricao() {
        return this.crcInscricao;
    }

    public void setCrcInscricao(String crcInscricao) {
        this.crcInscricao = crcInscricao;
    }

    public String getCrcUf() {
        return this.crcUf;
    }

    public void setCrcUf(String crcUf) {
        this.crcUf = crcUf;
    }

//   public ViewPessoaContador getViewPessoaContador() {
//		return this.viewPessoaContador;
//	}

//	public void setViewPessoaContador(ViewPessoaContador viewPessoaContador) {
//		this.viewPessoaContador = viewPessoaContador;
//	}

    public CadPessoa getPessoa() {
        return this.pessoa;
    }

    public void setPessoa(CadPessoa pessoa) {
        this.pessoa = pessoa;
    }


}
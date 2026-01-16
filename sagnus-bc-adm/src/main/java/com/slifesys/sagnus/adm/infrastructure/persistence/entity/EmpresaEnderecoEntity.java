package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.ManyToOne;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.JoinColumn;
import lombok.Getter;
import lombok.Setter;
import lombok.EqualsAndHashCode;

@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name="adm_empresa_endereco")
public class EmpresaEnderecoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public EmpresaEnderecoEntity() {
		//standard constructor
	}

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;

	@Column(name="logradouro")
	private String logradouro;

	@Column(name="numero")
	private String numero;

	@Column(name="bairro")
	private String bairro;

	@Column(name="cidade")
	private String cidade;

	@Column(name="uf")
	private String uf;

	@Column(name="cep")
	private String cep;

	@Column(name="municipio_ibge")
	private Integer municipioIbge;

	@Column(name="complemento")
	private String complemento;

	@Column(name="principal")
	private String principal;

	@Column(name="entrega")
	private String entrega;

	@Column(name="cobranca")
	private String cobranca;

	@Column(name="correspondencia")
	private String correspondencia;

	@ManyToOne 
	@JsonIgnore 
	@JoinColumn(name="id_empresa")
	private EmpresaEntity empresa; 
}

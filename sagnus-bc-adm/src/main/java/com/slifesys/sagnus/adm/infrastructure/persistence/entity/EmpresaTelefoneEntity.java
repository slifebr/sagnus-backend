package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
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
@Table(name="adm_empresa_telefone")

public class EmpresaTelefoneEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public EmpresaTelefoneEntity() {
		//standard constructor
	}

	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Integer id;

	@Column(name="tipo")
	private String tipo;

	@Column(name="numero")
	private String numero;

	@ManyToOne 
	@JsonIgnore 
	@JoinColumn(name="id_empresa")
	private EmpresaEntity empresa; 


		
}
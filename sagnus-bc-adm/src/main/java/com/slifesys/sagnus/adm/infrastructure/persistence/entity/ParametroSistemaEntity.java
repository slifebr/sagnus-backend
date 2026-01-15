package com.slifesys.sagnus.adm.infrastructure.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "adm_parametro_sistema")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ParametroSistemaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @EqualsAndHashCode.Include
    private Long id;

    @Column(nullable = false, unique = true)
    private String chave;

    @Column(nullable = false)
    private String valor;

    @Column(nullable = false)
    private String escopo;

    @Column(nullable = false)
    private Boolean ativo = true;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getChave() { return chave; }
    public void setChave(String chave) { this.chave = chave; }

    public String getValor() { return valor; }
    public void setValor(String valor) { this.valor = valor; }

    public String getEscopo() { return escopo; }
    public void setEscopo(String escopo) { this.escopo = escopo; }

    public Boolean getAtivo() { return ativo; }
    public void setAtivo(Boolean ativo) { this.ativo = ativo; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ParametroSistemaEntity that = (ParametroSistemaEntity) o;
        return id != null && id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}

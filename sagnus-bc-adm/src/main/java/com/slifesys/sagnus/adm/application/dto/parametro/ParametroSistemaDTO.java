package com.slifesys.sagnus.adm.application.dto.parametro;

import lombok.Data;

@Data
public class ParametroSistemaDTO {
    private Long id;
    private String nome;
    private String valor;
    private String descricao;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getValor() { return valor; }
    public void setValor(String valor) { this.valor = valor; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
}

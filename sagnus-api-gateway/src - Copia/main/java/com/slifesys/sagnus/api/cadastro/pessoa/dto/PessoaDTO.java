package com.slifesys.sagnus.api.cadastro.pessoa.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

/**
 * DTO de Pessoa exposto na API.
 *
 * - Usa Boolean para os flags (ao contrário da entidade JPA, que usa "S"/"N").
 * - Tipo é "F" ou "J".
 * - Validações focadas em entrada de dados.
 */
public class PessoaDTO {

    private Integer id;

    @NotBlank(message = "Nome é obrigatório.")
    @Size(max = 100, message = "Nome não pode ultrapassar 100 caracteres.")
    private String nome;

    @NotBlank(message = "Tipo é obrigatório.")
    @Pattern(regexp = "F|J", message = "Tipo deve ser F ou J.")
    private String tipo;

    @Size(max = 200, message = "Site não pode ultrapassar 200 caracteres.")
    private String site;

    @Email(message = "E-mail inválido.")
    @Size(max = 150, message = "E-mail não pode ultrapassar 150 caracteres.")
    private String email;

    // Flags de uso (cliente/fornecedor/etc.) como Boolean
    private Boolean ehCliente;
    private Boolean ehFornecedor;
    private Boolean ehTransportadora;
    private Boolean ehColaborador;
    private Boolean ehContador;

    // Status ativo/inativo
    private Boolean ehAtivo;

    // =========================
    // Getters e Setters
    // =========================

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getEhCliente() {
        return ehCliente;
    }

    public void setEhCliente(Boolean ehCliente) {
        this.ehCliente = ehCliente;
    }

    public Boolean getEhFornecedor() {
        return ehFornecedor;
    }

    public void setEhFornecedor(Boolean ehFornecedor) {
        this.ehFornecedor = ehFornecedor;
    }

    public Boolean getEhTransportadora() {
        return ehTransportadora;
    }

    public void setEhTransportadora(Boolean ehTransportadora) {
        this.ehTransportadora = ehTransportadora;
    }

    public Boolean getEhColaborador() {
        return ehColaborador;
    }

    public void setEhColaborador(Boolean ehColaborador) {
        this.ehColaborador = ehColaborador;
    }

    public Boolean getEhContador() {
        return ehContador;
    }

    public void setEhContador(Boolean ehContador) {
        this.ehContador = ehContador;
    }

    public Boolean getEhAtivo() {
        return ehAtivo;
    }

    public void setEhAtivo(Boolean ehAtivo) {
        this.ehAtivo = ehAtivo;
    }
}

package com.slifesys.sagnus.domain.cadastro.pessoa;

import java.util.Objects;

/**
 * Agregado de domínio para Pessoa.
 *
 * Não conhece JPA, não sabe de "S/N", nem de colunas/tabelas.
 * Trabalha em cima de:
 *  - TipoPessoa (FISICA/JURIDICA)
 *  - flags booleanas de uso (cliente, fornecedor, etc.)
 *  - regras de negócio básicas (ativação, perfis, etc.)
 */
public class Pessoa {

    private final Integer id;          // identificador técnico do agregado
    private String nome;
    private TipoPessoa tipo;
    private String site;
    private String email;

    private boolean cliente;
    private boolean fornecedor;
    private boolean transportadora;
    private boolean colaborador;
    private boolean contador;
    private boolean ativo;

    // =========================
    // Construtores de fábrica
    // =========================

    /**
     * Criação de uma nova pessoa (sem ID ainda).
     * ID será atribuído pela camada de persistência.
     */
    public static Pessoa novaPessoa(String nome,
                                    TipoPessoa tipo,
                                    String email,
                                    String site,
                                    boolean cliente,
                                    boolean fornecedor,
                                    boolean transportadora,
                                    boolean colaborador,
                                    boolean contador) {
        return new Pessoa(
                null,
                nome,
                tipo,
                site,
                email,
                cliente,
                fornecedor,
                transportadora,
                colaborador,
                contador,
                true // nova pessoa nasce ativa por padrão
        );
    }

    /**
     * Reconstrução de uma pessoa já existente (ex. vinda da base).
     * Usado pelo mapper de infraestrutura.
     */
    public static Pessoa reconstruir(Integer id,
                                     String nome,
                                     TipoPessoa tipo,
                                     String site,
                                     String email,
                                     boolean cliente,
                                     boolean fornecedor,
                                     boolean transportadora,
                                     boolean colaborador,
                                     boolean contador,
                                     boolean ativo) {
        return new Pessoa(
                id,
                nome,
                tipo,
                site,
                email,
                cliente,
                fornecedor,
                transportadora,
                colaborador,
                contador,
                ativo
        );
    }

    private Pessoa(Integer id,
                   String nome,
                   TipoPessoa tipo,
                   String site,
                   String email,
                   boolean cliente,
                   boolean fornecedor,
                   boolean transportadora,
                   boolean colaborador,
                   boolean contador,
                   boolean ativo) {

        if (nome == null || nome.isBlank()) {
            throw new IllegalArgumentException("Nome da pessoa é obrigatório.");
        }
        if (tipo == null) {
            throw new IllegalArgumentException("Tipo da pessoa é obrigatório (FISICA/JURIDICA).");
        }

        this.id = id;
        this.nome = nome;
        this.tipo = tipo;
        this.site = site;
        this.email = email;
        this.cliente = cliente;
        this.fornecedor = fornecedor;
        this.transportadora = transportadora;
        this.colaborador = colaborador;
        this.contador = contador;
        this.ativo = ativo;
    }

    // =========================
    // Comportamentos de negócio
    // =========================

    public void ativar() {
        if (!this.ativo) {
            this.ativo = true;
        }
    }

    public void desativar() {
        if (this.ativo) {
            this.ativo = false;
            // se quiser, pode limpar perfis ao desativar:
            // this.cliente = false;
            // this.fornecedor = false;
            // ...
        }
    }

    public void marcarComoCliente() {
        this.cliente = true;
    }

    public void desmarcarComoCliente() {
        this.cliente = false;
    }

    public void marcarComoFornecedor() {
        this.fornecedor = true;
    }

    public void desmarcarComoFornecedor() {
        this.fornecedor = false;
    }

    public void marcarComoTransportadora() {
        this.transportadora = true;
    }

    public void desmarcarComoTransportadora() {
        this.transportadora = false;
    }

    public void marcarComoColaborador() {
        this.colaborador = true;
    }

    public void desmarcarComoColaborador() {
        this.colaborador = false;
    }

    public void marcarComoContador() {
        this.contador = true;
    }

    public void desmarcarComoContador() {
        this.contador = false;
    }

    public boolean isPessoaFisica() {
        return this.tipo == TipoPessoa.FISICA;
    }

    public boolean isPessoaJuridica() {
        return this.tipo == TipoPessoa.JURIDICA;
    }

    public void alterarDadosBasicos(String novoNome,
                                    String novoEmail,
                                    String novoSite) {

        if (novoNome == null || novoNome.isBlank()) {
            throw new IllegalArgumentException("Nome da pessoa é obrigatório.");
        }
        this.nome = novoNome;
        this.email = novoEmail;
        this.site = novoSite;
    }

    // =========================
    // Getters (sem setters públicos
    // para manter invariantes)
    // =========================

    public Integer getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public TipoPessoa getTipo() {
        return tipo;
    }

    public String getSite() {
        return site;
    }

    public String getEmail() {
        return email;
    }

    public boolean isCliente() {
        return cliente;
    }

    public boolean isFornecedor() {
        return fornecedor;
    }

    public boolean isTransportadora() {
        return transportadora;
    }

    public boolean isColaborador() {
        return colaborador;
    }

    public boolean isContador() {
        return contador;
    }

    public boolean isAtivo() {
        return ativo;
    }

    // =========================
    // equals/hashCode por ID
    // =========================

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Pessoa pessoa)) return false;
        // Se ainda não tem ID (nova), usa igualdade por instância
        if (this.id == null || pessoa.id == null) {
            return false;
        }
        return Objects.equals(id, pessoa.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}

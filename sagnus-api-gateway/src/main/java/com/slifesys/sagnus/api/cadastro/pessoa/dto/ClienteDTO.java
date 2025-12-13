package com.slifesys.sagnus.api.cadastro.pessoa.dto;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.util.Date;

public class ClienteDTO {

    private Integer id;

    @NotNull(message = "Pessoa é obrigatória.")
    private Integer pessoaId;
    // só leitura, preenchido no retorno
    private String pessoaNome;
    private Date desde;
    private Date dataCadastro;

    @DecimalMin(value = "0.0", inclusive = true, message = "Taxa de desconto não pode ser negativa.")
    @DecimalMax(value = "100.0", inclusive = true, message = "Taxa de desconto não pode ser maior que 100%.")
    private BigDecimal taxaDesconto;

    @DecimalMin(value = "0.0", inclusive = true, message = "Limite de crédito não pode ser negativo.")
    private BigDecimal limiteCredito;

    @Size(max = 500, message = "Observação não pode ultrapassar 500 caracteres.")
    private String observacao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPessoaId() {
        return pessoaId;
    }

    public void setPessoaId(Integer pessoaId) {
        this.pessoaId = pessoaId;
    }

    public String getPessoaNome() {
        return pessoaNome;
    }

    public void setPessoaNome(String pessoaNome) {
        this.pessoaNome = pessoaNome;
    }

    public Date getDesde() {
        return desde;
    }

    public void setDesde(Date desde) {
        this.desde = desde;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public BigDecimal getTaxaDesconto() {
        return taxaDesconto;
    }

    public void setTaxaDesconto(BigDecimal taxaDesconto) {
        this.taxaDesconto = taxaDesconto;
    }

    public BigDecimal getLimiteCredito() {
        return limiteCredito;
    }

    public void setLimiteCredito(BigDecimal limiteCredito) {
        this.limiteCredito = limiteCredito;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }
}

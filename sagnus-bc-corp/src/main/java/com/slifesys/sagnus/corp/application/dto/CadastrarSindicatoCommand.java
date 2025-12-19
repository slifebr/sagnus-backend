package com.slifesys.sagnus.corp.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class CadastrarSindicatoCommand {
    private String nome;
    private Long codigoBanco;
    private Long codigoAgencia;
    private String contaBanco;
    private String codigoCedente;
    private String logradouro;
    private String numero;
    private String bairro;
    private Long municipioIbge;
    private String uf;
    private String fone1;
    private String fone2;
    private String email;
    private String tipoSindicato;
    private LocalDate dataBase;
    private BigDecimal pisoSalarial;
    private String cnpj;
    private String classificacaoContabilConta;
    private String usuCriacao;
}

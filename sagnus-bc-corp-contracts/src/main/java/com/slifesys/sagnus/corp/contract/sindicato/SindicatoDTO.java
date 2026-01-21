package com.slifesys.sagnus.corp.contract.sindicato;

import lombok.Builder;
import lombok.Value;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Instant;

@Value
@Builder
public class SindicatoDTO {
    Long id;
    String nome;
    Long codigoBanco;
    Long codigoAgencia;
    String contaBanco;
    String codigoCedente;
    String logradouro;
    String numero;
    String bairro;
    Long municipioIbge;
    String uf;
    String fone1;
    String fone2;
    String email;
    String tipoSindicato;
    LocalDate dataBase;
    BigDecimal pisoSalarial;
    String cnpj;
    String classificacaoContabilConta;
    Instant criadoEm;
    String usuCriacao;
    Instant atualizadoEm;
    String usuAlteracao;
}

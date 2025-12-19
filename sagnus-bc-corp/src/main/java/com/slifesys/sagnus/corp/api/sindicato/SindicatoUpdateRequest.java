package com.slifesys.sagnus.corp.api.sindicato;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Email;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.br.CNPJ;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@Setter
public class SindicatoUpdateRequest {
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

    @Email(message = "Email inválido")
    private String email;

    private String tipoSindicato;
    private LocalDate dataBase;

    @DecimalMin(value = "0.0", message = "O piso salarial deve ser maior ou igual a zero")
    private BigDecimal pisoSalarial;

    @CNPJ(message = "CNPJ inválido")
    private String cnpj;

    private String classificacaoContabilConta;
}

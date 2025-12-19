package com.slifesys.sagnus.corp.application.dto;

import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Getter
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class SindicatoResult {
    private Long id;
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

    public static SindicatoResult from(Sindicato sindicato) {
        return new SindicatoResult(
                sindicato.getId(),
                sindicato.getNome(),
                sindicato.getCodigoBanco(),
                sindicato.getCodigoAgencia(),
                sindicato.getContaBanco(),
                sindicato.getCodigoCedente(),
                sindicato.getLogradouro(),
                sindicato.getNumero(),
                sindicato.getBairro(),
                sindicato.getMunicipioIbge(),
                sindicato.getUf(),
                sindicato.getFone1(),
                sindicato.getFone2(),
                sindicato.getEmail(),
                sindicato.getTipoSindicato(),
                sindicato.getDataBase(),
                sindicato.getPisoSalarial(),
                sindicato.getCnpj(),
                sindicato.getClassificacaoContabilConta());
    }
}

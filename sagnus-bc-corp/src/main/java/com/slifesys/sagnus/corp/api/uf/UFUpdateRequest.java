package com.slifesys.sagnus.corp.api.uf;

import com.slifesys.sagnus.corp.application.dto.AlterarUFCommand;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class UFUpdateRequest {

    private String sigla;
    private String nome;
    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;
    private String usuario;

    public AlterarUFCommand toCommand(Long id) {
        return AlterarUFCommand.builder()
                .id(id)
                .sigla(sigla)
                .nome(nome)
                .icmsInterno(icmsInterno)
                .icmsInterestadual(icmsInterestadual)
                .usuAlteracao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

package com.slifesys.sagnus.corp.api.uf;

import com.slifesys.sagnus.corp.application.dto.CadastrarUFCommand;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class UFCreateRequest {

    @NotBlank(message = "Sigla é obrigatória")
    private String sigla;

    @NotBlank(message = "Nome é obrigatório")
    private String nome;

    private BigDecimal icmsInterno;
    private BigDecimal icmsInterestadual;

    private String usuario;

    public CadastrarUFCommand toCommand() {
        return CadastrarUFCommand.builder()
                .sigla(sigla)
                .nome(nome)
                .icmsInterno(icmsInterno)
                .icmsInterestadual(icmsInterestadual)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }
}

package com.slifesys.sagnus.adm.application.command;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpsertParametrosCommand(
        Long finParcelaAberto,
        Long finParcelaQuitado,
        Long finParcelaQuitadoParcial,
        Long finTipoRecebimentoEdi,
        Long compraFinDocOrigem,
        Long compraContaCaixa,
        @NotBlank @Size(max=30) String usu
) {
}

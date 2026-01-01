package com.slifesys.sagnus.adm.api.parametro;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record UpsertParametrosRequest(
        Long finParcelaAberto,
        Long finParcelaQuitado,
        Long finParcelaQuitadoParcial,
        Long finTipoRecebimentoEdi,
        Long compraFinDocOrigem,
        Long compraContaCaixa,
        @NotBlank @Size(max=30) String usu
) {
}

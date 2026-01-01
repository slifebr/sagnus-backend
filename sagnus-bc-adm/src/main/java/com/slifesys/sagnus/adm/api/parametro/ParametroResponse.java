package com.slifesys.sagnus.adm.api.parametro;

public record ParametroResponse(
        Long id,
        Long finParcelaAberto,
        Long finParcelaQuitado,
        Long finParcelaQuitadoParcial,
        Long finTipoRecebimentoEdi,
        Long compraFinDocOrigem,
        Long compraContaCaixa
) {
}

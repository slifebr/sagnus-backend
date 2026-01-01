package com.slifesys.sagnus.adm.domain.model;

import java.util.Objects;

public record Parametro(
        ParametroId id,
        Long finParcelaAberto,
        Long finParcelaQuitado,
        Long finParcelaQuitadoParcial,
        Long finTipoRecebimentoEdi,
        Long compraFinDocOrigem,
        Long compraContaCaixa,
        Audit audit
) {
    public Parametro {
        Objects.requireNonNull(audit, "audit");
    }
}

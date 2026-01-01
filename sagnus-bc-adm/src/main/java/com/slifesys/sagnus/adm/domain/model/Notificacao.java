package com.slifesys.sagnus.adm.domain.model;

import java.time.LocalDate;
import java.util.Objects;

public record Notificacao(
        LocalDate data,
        String hora,
        Long tipo
) {
    public Notificacao {
        Objects.requireNonNull(tipo, "tipo");
    }
}

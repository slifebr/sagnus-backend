package com.slifesys.sagnus.adm.api.agenda;

import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record CreateNotificacaoRequest(
        LocalDate data,
        String hora,
        @NotNull Long tipo
) {
}

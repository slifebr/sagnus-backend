package com.slifesys.sagnus.adm.application.command;

import jakarta.validation.constraints.NotNull;

import java.time.LocalDate;

public record CreateNotificacaoCommand(
        LocalDate data,
        String hora,
        @NotNull Long tipo
) {
}

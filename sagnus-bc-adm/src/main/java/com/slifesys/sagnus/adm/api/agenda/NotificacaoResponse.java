package com.slifesys.sagnus.adm.api.agenda;

import java.time.LocalDate;

public record NotificacaoResponse(
        LocalDate data,
        String hora,
        Long tipo
) {
}

package com.slifesys.sagnus.adm.api.agenda;

import java.time.LocalDate;
import java.util.List;

public record CompromissoResponse(
        Long id,
        Long categoriaId,
        Long colaboradorId,
        LocalDate dataCompromisso,
        String hora,
        Long duracao,
        String onde,
        String descricao,
        String tipo,
        List<Long> convidadosColaboradorIds,
        List<NotificacaoResponse> notificacoes
) {
}

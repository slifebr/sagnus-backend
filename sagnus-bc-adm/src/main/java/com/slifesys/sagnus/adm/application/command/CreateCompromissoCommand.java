package com.slifesys.sagnus.adm.application.command;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
import java.util.List;

public record CreateCompromissoCommand(
        @NotNull Long categoriaId,
        @NotNull Long colaboradorId,
        LocalDate dataCompromisso,
        @Size(max=8) String hora,
        Long duracao,
        @Size(max=100) String onde,
        @Size(max=100) String descricao,
        @Size(max=1) String tipo,
        List<Long> convidadosColaboradorIds,
        List<CreateNotificacaoCommand> notificacoes,
        @NotBlank @Size(max=30) String usuCriacao
) {
}

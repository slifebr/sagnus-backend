package com.slifesys.sagnus.adm.api.agenda;

import com.slifesys.sagnus.adm.application.command.CreateCategoriaCommand;
import com.slifesys.sagnus.adm.application.command.CreateCompromissoCommand;
import com.slifesys.sagnus.adm.application.command.CreateNotificacaoCommand;
import com.slifesys.sagnus.adm.application.result.CreateCategoriaResult;
import com.slifesys.sagnus.adm.application.result.CreateCompromissoResult;
import com.slifesys.sagnus.adm.domain.model.agenda.CategoriaCompromisso;
import com.slifesys.sagnus.adm.domain.model.agenda.Compromisso;
import com.slifesys.sagnus.adm.domain.model.agenda.Convite;
import com.slifesys.sagnus.adm.domain.model.agenda.Notificacao;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class AgendaApiMapper {

    public CreateCategoriaCommand toCommand(CreateCategoriaRequest request) {
        return new CreateCategoriaCommand(request.nome(), request.cor(), request.usuCriacao());
    }

    public CreateCategoriaResponse toResponse(CreateCategoriaResult result) {
        return new CreateCategoriaResponse(result.id());
    }

    public CreateCompromissoCommand toCommand(CreateCompromissoRequest request) {
        var notificacoes = request.notificacoes() == null ? Collections.<CreateNotificacaoCommand>emptyList()
                : request.notificacoes().stream().map(this::toCommand).collect(Collectors.toList());

        return new CreateCompromissoCommand(
                request.categoriaId(),
                request.colaboradorId(),
                request.dataCompromisso(),
                request.hora(),
                request.duracao(),
                request.onde(),
                request.descricao(),
                request.tipo(),
                request.convidadosColaboradorIds(),
                notificacoes,
                request.usuCriacao()
        );
    }
    
    public CreateNotificacaoCommand toCommand(CreateNotificacaoRequest request) {
        return new CreateNotificacaoCommand(request.data(), request.hora(), request.tipo());
    }

    public CreateCompromissoResponse toResponse(CreateCompromissoResult result) {
        return new CreateCompromissoResponse(result.id());
    }

    public CategoriaResponse toCategoriaResponse(CategoriaCompromisso categoria) {
        return new CategoriaResponse(categoria.getId(), categoria.getNome(), categoria.getCor());
    }

    public List<CategoriaResponse> toCategoriaResponseList(List<CategoriaCompromisso> categorias) {
        return categorias.stream().map(this::toCategoriaResponse).collect(Collectors.toList());
    }

    public CompromissoResponse toCompromissoResponse(Compromisso compromisso) {
        return new CompromissoResponse(
                compromisso.getId(),
                compromisso.getCategoriaId(),
                compromisso.getColaboradorId(),
                compromisso.getDataCompromisso(),
                compromisso.getHora() != null ? compromisso.getHora().toString() : null,
                compromisso.getDuracao().longValue(),
                compromisso.getOnde(),
                compromisso.getDescricao(),
                compromisso.getTipo(),
                compromisso.getConvidados().stream().map(Convite::getColaboradorId).collect(Collectors.toList()),
                compromisso.getNotificacoes().stream().map(this::toResponse).collect(Collectors.toList())
        );
    }

    public List<CompromissoResponse> toCompromissoResponseList(List<Compromisso> compromissos) {
        return compromissos.stream().map(this::toCompromissoResponse).collect(Collectors.toList());
    }
    
    public NotificacaoResponse toResponse(Notificacao notificacao) {
        // Assuming tipo is Long in Response but String in Domain? Or vice versa?
        // Error log: NotificacaoResponse expects Long/String?
        // Let's check NotificacaoResponse.java viewed earlier:
        // public record NotificacaoResponse(LocalDate data, String hora, Long tipo)
        // Domain Notificacao.tipo is String.
        // I will attempt parsing or use 0L/null if fallback.
        Long tipoLong = null;
        try {
             if (notificacao.getTipo() != null) tipoLong = Long.parseLong(notificacao.getTipo());
        } catch (NumberFormatException e) {}

        return new NotificacaoResponse(
            notificacao.getData(), 
            notificacao.getHora() != null ? notificacao.getHora().toString() : null, 
            tipoLong
        );
    }
}

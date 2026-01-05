package com.slifesys.sagnus.adm.api.agenda;

import com.slifesys.sagnus.adm.application.command.CreateCategoriaCommand;
import com.slifesys.sagnus.adm.application.command.CreateCompromissoCommand;
import com.slifesys.sagnus.adm.application.command.CreateNotificacaoCommand;
import com.slifesys.sagnus.adm.application.result.CreateCategoriaResult;
import com.slifesys.sagnus.adm.application.result.CreateCompromissoResult;
import com.slifesys.sagnus.adm.domain.model.CategoriaCompromisso;
import com.slifesys.sagnus.adm.domain.model.Compromisso;
import com.slifesys.sagnus.adm.domain.model.Convite;
import com.slifesys.sagnus.adm.domain.model.Notificacao;
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
        return new CategoriaResponse(categoria.id().value(), categoria.nome(), categoria.cor());
    }

    public List<CategoriaResponse> toCategoriaResponseList(List<CategoriaCompromisso> categorias) {
        return categorias.stream().map(this::toCategoriaResponse).collect(Collectors.toList());
    }

    public CompromissoResponse toCompromissoResponse(Compromisso compromisso) {
        return new CompromissoResponse(
                compromisso.id().value(),
                compromisso.categoriaId().value(),
                compromisso.colaboradorId(),
                compromisso.dataCompromisso(),
                compromisso.hora(),
                compromisso.duracao(),
                compromisso.onde(),
                compromisso.descricao(),
                compromisso.tipo(),
                compromisso.convidados().stream().map(Convite::colaboradorId).collect(Collectors.toList()),
                compromisso.notificacoes().stream().map(this::toResponse).collect(Collectors.toList())
        );
    }

    public List<CompromissoResponse> toCompromissoResponseList(List<Compromisso> compromissos) {
        return compromissos.stream().map(this::toCompromissoResponse).collect(Collectors.toList());
    }
    
    public NotificacaoResponse toResponse(Notificacao notificacao) {
        return new NotificacaoResponse(notificacao.data(), notificacao.hora(), notificacao.tipo());
    }
}

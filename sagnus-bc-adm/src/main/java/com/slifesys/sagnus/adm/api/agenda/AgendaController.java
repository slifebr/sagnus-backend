package com.slifesys.sagnus.adm.api.agenda;

import com.slifesys.sagnus.adm.application.command.*;
import com.slifesys.sagnus.adm.application.usecase.*;
import com.slifesys.sagnus.adm.domain.model.Convite;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/adm/agenda")
public class AgendaController {

    private final CreateCategoriaUseCase createCategoriaUseCase;
    private final ListCategoriasUseCase listCategoriasUseCase;
    private final CreateCompromissoUseCase createCompromissoUseCase;
    private final ListCompromissosUseCase listCompromissosUseCase;

    public AgendaController(CreateCategoriaUseCase createCategoriaUseCase,
                            ListCategoriasUseCase listCategoriasUseCase,
                            CreateCompromissoUseCase createCompromissoUseCase,
                            ListCompromissosUseCase listCompromissosUseCase) {
        this.createCategoriaUseCase = createCategoriaUseCase;
        this.listCategoriasUseCase = listCategoriasUseCase;
        this.createCompromissoUseCase = createCompromissoUseCase;
        this.listCompromissosUseCase = listCompromissosUseCase;
    }

    @GetMapping("/categorias")
    public List<CategoriaResponse> listarCategorias() {
        return listCategoriasUseCase.execute().stream()
                .map(c -> new CategoriaResponse(c.id().value(), c.nome(), c.cor()))
                .toList();
    }

    @PostMapping("/categorias")
    public CreateCategoriaResponse criarCategoria(@Valid @RequestBody CreateCategoriaRequest request) {
        var result = createCategoriaUseCase.execute(new CreateCategoriaCommand(
                request.nome(), request.cor(), request.usuCriacao()
        ));
        return new CreateCategoriaResponse(result.id());
    }

    @GetMapping("/compromissos")
    public List<CompromissoResponse> listarCompromissos(@RequestParam("colaboradorId") Long colaboradorId) {
        return listCompromissosUseCase.execute(colaboradorId).stream()
                .map(c -> new CompromissoResponse(
                        c.id().value(),
                        c.categoriaId().value(),
                        c.colaboradorId(),
                        c.dataCompromisso(),
                        c.hora(),
                        c.duracao(),
                        c.onde(),
                        c.descricao(),
                        c.tipo(),
                        c.convidados().stream().map(Convite::colaboradorId).toList(),
                        c.notificacoes().stream().map(n -> new NotificacaoResponse(n.data(), n.hora(), n.tipo())).toList()
                ))
                .toList();
    }

    @PostMapping("/compromissos")
    public CreateCompromissoResponse criarCompromisso(@Valid @RequestBody CreateCompromissoRequest request) {
        var notificacoes = request.notificacoes() == null ? null
                : request.notificacoes().stream().map(n -> new CreateNotificacaoCommand(n.data(), n.hora(), n.tipo())).toList();

        var cmd = new CreateCompromissoCommand(
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

        var result = createCompromissoUseCase.execute(cmd);
        return new CreateCompromissoResponse(result.id());
    }
}

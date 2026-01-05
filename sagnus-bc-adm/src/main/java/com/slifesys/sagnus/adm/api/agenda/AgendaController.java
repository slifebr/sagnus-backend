package com.slifesys.sagnus.adm.api.agenda;

import com.slifesys.sagnus.adm.application.usecase.CreateCategoriaUseCase;
import com.slifesys.sagnus.adm.application.usecase.CreateCompromissoUseCase;
import com.slifesys.sagnus.adm.application.usecase.ListCategoriasUseCase;
import com.slifesys.sagnus.adm.application.usecase.ListCompromissosUseCase;
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
    private final AgendaApiMapper agendaApiMapper;

    public AgendaController(CreateCategoriaUseCase createCategoriaUseCase,
                            ListCategoriasUseCase listCategoriasUseCase,
                            CreateCompromissoUseCase createCompromissoUseCase,
                            ListCompromissosUseCase listCompromissosUseCase,
                            AgendaApiMapper agendaApiMapper) {
        this.createCategoriaUseCase = createCategoriaUseCase;
        this.listCategoriasUseCase = listCategoriasUseCase;
        this.createCompromissoUseCase = createCompromissoUseCase;
        this.listCompromissosUseCase = listCompromissosUseCase;
        this.agendaApiMapper = agendaApiMapper;
    }

    @GetMapping("/categorias")
    public List<CategoriaResponse> listarCategorias() {
        var results = listCategoriasUseCase.execute();
        return agendaApiMapper.toCategoriaResponseList(results);
    }

    @PostMapping("/categorias")
    public CreateCategoriaResponse criarCategoria(@Valid @RequestBody CreateCategoriaRequest request) {
        var command = agendaApiMapper.toCommand(request);
        var result = createCategoriaUseCase.execute(command);
        return agendaApiMapper.toResponse(result);
    }

    @GetMapping("/compromissos")
    public List<CompromissoResponse> listarCompromissos(@RequestParam("colaboradorId") Long colaboradorId) {
        var results = listCompromissosUseCase.execute(colaboradorId);
        return agendaApiMapper.toCompromissoResponseList(results);
    }

    @PostMapping("/compromissos")
    public CreateCompromissoResponse criarCompromisso(@Valid @RequestBody CreateCompromissoRequest request) {
        var command = agendaApiMapper.toCommand(request);
        var result = createCompromissoUseCase.execute(command);
        return agendaApiMapper.toResponse(result);
    }
}

package com.slifesys.sagnus.api.rest;

import com.slifesys.sagnus.adm.api.parametro.ParametroResponse;
import com.slifesys.sagnus.adm.api.parametro.ParametroApiMapper;
import com.slifesys.sagnus.adm.api.parametro.UpsertParametrosRequest;
import com.slifesys.sagnus.adm.api.modulo.ModuloResponse;
import com.slifesys.sagnus.adm.api.modulo.ModuloApiMapper;
import com.slifesys.sagnus.adm.api.modulo.CreateModuloRequest;
import com.slifesys.sagnus.adm.api.modulo.CreateModuloResponse;
import com.slifesys.sagnus.adm.api.agenda.AgendaApiMapper;
import com.slifesys.sagnus.adm.api.agenda.CategoriaResponse;
import com.slifesys.sagnus.adm.api.agenda.CreateCategoriaRequest;
import com.slifesys.sagnus.adm.api.agenda.CreateCategoriaResponse;
import com.slifesys.sagnus.adm.api.agenda.CompromissoResponse;
import com.slifesys.sagnus.adm.api.agenda.CreateCompromissoRequest;
import com.slifesys.sagnus.adm.api.agenda.CreateCompromissoResponse;
import com.slifesys.sagnus.adm.application.usecase.*;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

/**
 * Gateway REST Controller para ADM.
 * 
 * Padrão Edge/BFF: delega para UseCases do BC-ADM sem lógica própria.
 * Conforme ADR-0011: Gateway apenas roteia/delega, sem domínio/persistência.
 */
@RestController
@RequestMapping("/api/v1/adm")
@RequiredArgsConstructor
public class AdmGatewayController {

    // Parametros
    private final GetParametrosUseCase getParametrosUseCase;
    private final UpsertParametrosUseCase upsertParametrosUseCase;
    private final ParametroApiMapper parametroMapper;

    // Modulos
    private final CreateModuloUseCase createModuloUseCase;
    private final ListModulosUseCase listModulosUseCase;
    private final ModuloApiMapper moduloMapper;

    // Agenda
    private final CreateCategoriaUseCase createCategoriaUseCase;
    private final ListCategoriasUseCase listCategoriasUseCase;
    private final CreateCompromissoUseCase createCompromissoUseCase;
    private final ListCompromissosUseCase listCompromissosUseCase;
    private final AgendaApiMapper agendaApiMapper;

    // === PARAMETROS ===
    
    @GetMapping("/parametros")
    public Optional<ParametroResponse> getParametros() {
        return getParametrosUseCase.execute().map(parametroMapper::toResponse);
    }

    @PutMapping("/parametros")
    public Long upsertParametros(@Valid @RequestBody UpsertParametrosRequest request) {
        var command = parametroMapper.toCommand(request);
        var result = upsertParametrosUseCase.execute(command);
        return result.id();
    }

    // === MODULOS ===
    
    @GetMapping("/modulos")
    public List<ModuloResponse> listarModulos() {
        return moduloMapper.toResponseList(listModulosUseCase.execute());
    }

    @PostMapping("/modulos")
    public CreateModuloResponse criarModulo(@Valid @RequestBody CreateModuloRequest request) {
        var command = moduloMapper.toCommand(request);
        var result = createModuloUseCase.execute(command);
        return moduloMapper.toResponse(result);
    }

    // === AGENDA ===
    
    @GetMapping("/agenda/categorias")
    public List<CategoriaResponse> listarCategorias() {
        var results = listCategoriasUseCase.execute();
        return agendaApiMapper.toCategoriaResponseList(results);
    }

    @PostMapping("/agenda/categorias")
    public CreateCategoriaResponse criarCategoria(@Valid @RequestBody CreateCategoriaRequest request) {
        var command = agendaApiMapper.toCommand(request);
        var result = createCategoriaUseCase.execute(command);
        return agendaApiMapper.toResponse(result);
    }

    @GetMapping("/agenda/compromissos")
    public List<CompromissoResponse> listarCompromissos(@RequestParam("colaboradorId") Long colaboradorId) {
        var results = listCompromissosUseCase.execute(colaboradorId);
        return agendaApiMapper.toCompromissoResponseList(results);
    }

    @PostMapping("/agenda/compromissos")
    public CreateCompromissoResponse criarCompromisso(@Valid @RequestBody CreateCompromissoRequest request) {
        var command = agendaApiMapper.toCommand(request);
        var result = createCompromissoUseCase.execute(command);
        return agendaApiMapper.toResponse(result);
    }
}

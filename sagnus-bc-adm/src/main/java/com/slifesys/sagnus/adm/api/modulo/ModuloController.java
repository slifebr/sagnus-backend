package com.slifesys.sagnus.adm.api.modulo;

import com.slifesys.sagnus.adm.application.command.CreateModuloCommand;
import com.slifesys.sagnus.adm.application.usecase.CreateModuloUseCase;
import com.slifesys.sagnus.adm.application.usecase.ListModulosUseCase;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/adm/modulos")
public class ModuloController {

    private final CreateModuloUseCase createModuloUseCase;
    private final ListModulosUseCase listModulosUseCase;

    public ModuloController(CreateModuloUseCase createModuloUseCase, ListModulosUseCase listModulosUseCase) {
        this.createModuloUseCase = createModuloUseCase;
        this.listModulosUseCase = listModulosUseCase;
    }

    @GetMapping
    public List<ModuloResponse> listar() {
        return listModulosUseCase.execute().stream()
                .map(m -> new ModuloResponse(m.getId().getValue(), m.getCodigo(), m.getNome(), m.getDescricao()))
                .toList();
    }

    @PostMapping
    public CreateModuloResponse criar(@Valid @RequestBody CreateModuloRequest request) {
        var result = createModuloUseCase.execute(new CreateModuloCommand(
                request.codigo(), request.nome(), request.descricao(), request.usuCriacao()
        ));
        return new CreateModuloResponse(result.id());
    }
}

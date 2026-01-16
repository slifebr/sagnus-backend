package com.slifesys.sagnus.adm.api.modulo;


import com.slifesys.sagnus.adm.application.usecase.CreateModuloUseCase;
import com.slifesys.sagnus.adm.application.usecase.ListModulosUseCase;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/adm/modulos")
public class ModuloController {

    private final CreateModuloUseCase createModuloUseCase;
    private final ListModulosUseCase listModulosUseCase;
    private final ModuloApiMapper mapper;

    public ModuloController(CreateModuloUseCase createModuloUseCase, ListModulosUseCase listModulosUseCase, ModuloApiMapper mapper) {
        this.createModuloUseCase = createModuloUseCase;
        this.listModulosUseCase = listModulosUseCase;
        this.mapper = mapper;
    }

    @GetMapping
    public List<ModuloResponse> listar() {
        return mapper.toResponseList(listModulosUseCase.execute());
    }

    @PostMapping
    public CreateModuloResponse criar(@Valid @RequestBody CreateModuloRequest request) {
        var command = mapper.toCommand(request);
        var result = createModuloUseCase.execute(command);
        return mapper.toResponse(result);
    }
}

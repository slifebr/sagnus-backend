package com.slifesys.sagnus.adm.api.parametro;


import com.slifesys.sagnus.adm.application.usecase.GetParametrosUseCase;
import com.slifesys.sagnus.adm.application.usecase.UpsertParametrosUseCase;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/v1/adm/parametros")
public class ParametroController {

    private final GetParametrosUseCase getParametrosUseCase;
    private final UpsertParametrosUseCase upsertParametrosUseCase;
    private final ParametroApiMapper mapper;

    public ParametroController(GetParametrosUseCase getParametrosUseCase, UpsertParametrosUseCase upsertParametrosUseCase, ParametroApiMapper mapper) {
        this.getParametrosUseCase = getParametrosUseCase;
        this.upsertParametrosUseCase = upsertParametrosUseCase;
        this.mapper = mapper;
    }

    @GetMapping
    public Optional<ParametroResponse> get() {
        return getParametrosUseCase.execute().map(mapper::toResponse);
    }

    @PutMapping
    public Long upsert(@Valid @RequestBody UpsertParametrosRequest request) {
        var command = mapper.toCommand(request);
        var result = upsertParametrosUseCase.execute(command);
        return result.id();
    }
}

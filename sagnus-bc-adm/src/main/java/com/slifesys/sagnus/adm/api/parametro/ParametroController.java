package com.slifesys.sagnus.adm.api.parametro;

import com.slifesys.sagnus.adm.application.command.UpsertParametrosCommand;
import com.slifesys.sagnus.adm.application.usecase.GetParametrosUseCase;
import com.slifesys.sagnus.adm.application.usecase.UpsertParametrosUseCase;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/v1/adm/parametros")
public class ParametroController {

    private final GetParametrosUseCase getParametrosUseCase;
    private final UpsertParametrosUseCase upsertParametrosUseCase;

    public ParametroController(GetParametrosUseCase getParametrosUseCase, UpsertParametrosUseCase upsertParametrosUseCase) {
        this.getParametrosUseCase = getParametrosUseCase;
        this.upsertParametrosUseCase = upsertParametrosUseCase;
    }

    @GetMapping
    public Optional<ParametroResponse> get() {
        return getParametrosUseCase.execute().map(p -> new ParametroResponse(
                p.id().value(),
                p.finParcelaAberto(),
                p.finParcelaQuitado(),
                p.finParcelaQuitadoParcial(),
                p.finTipoRecebimentoEdi(),
                p.compraFinDocOrigem(),
                p.compraContaCaixa()
        ));
    }

    @PutMapping
    public Long upsert(@Valid @RequestBody UpsertParametrosRequest request) {
        var result = upsertParametrosUseCase.execute(new UpsertParametrosCommand(
                request.finParcelaAberto(),
                request.finParcelaQuitado(),
                request.finParcelaQuitadoParcial(),
                request.finTipoRecebimentoEdi(),
                request.compraFinDocOrigem(),
                request.compraContaCaixa(),
                request.usu()
        ));
        return result.id();
    }
}

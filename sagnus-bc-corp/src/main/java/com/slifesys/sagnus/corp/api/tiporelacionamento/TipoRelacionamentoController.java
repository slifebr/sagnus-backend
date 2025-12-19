package com.slifesys.sagnus.corp.api.tiporelacionamento;

import com.slifesys.sagnus.corp.application.dto.TipoRelacionamentoResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarTipoRelacionamentoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarTipoRelacionamentoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTipoRelacionamentoUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/corp/tipos-relacionamento")
@RequiredArgsConstructor
public class TipoRelacionamentoController {

    private final ObterTipoRelacionamentoUseCase obterTipoRelacionamento;
    private final CadastrarTipoRelacionamentoUseCase cadastrarTipoRelacionamento;
    private final AlterarTipoRelacionamentoUseCase alterarTipoRelacionamento;

    @GetMapping("/{id}")
    public ResponseEntity<TipoRelacionamentoResponse> get(@PathVariable Long id) {
        TipoRelacionamentoResult result = obterTipoRelacionamento.execute(id);
        return ResponseEntity.ok(TipoRelacionamentoResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<TipoRelacionamentoResponse> create(@RequestBody TipoRelacionamentoCreateRequest req) {
        TipoRelacionamentoResult saved = cadastrarTipoRelacionamento.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/corp/tipos-relacionamento/" + saved.getId()))
                .body(TipoRelacionamentoResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TipoRelacionamentoResponse> update(@PathVariable Long id,
            @RequestBody TipoRelacionamentoUpdateRequest req) {
        TipoRelacionamentoResult saved = alterarTipoRelacionamento.execute(req.toCommand(id));
        return ResponseEntity.ok(TipoRelacionamentoResponse.from(saved));
    }
}

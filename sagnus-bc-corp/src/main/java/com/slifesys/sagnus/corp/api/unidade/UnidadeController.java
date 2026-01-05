package com.slifesys.sagnus.corp.api.unidade;

import com.slifesys.sagnus.corp.application.dto.UnidadeResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarUnidadeUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarUnidadeUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterUnidadeUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/unidades")
@RequiredArgsConstructor
public class UnidadeController {

    private final ObterUnidadeUseCase obterUnidade;
    private final CadastrarUnidadeUseCase cadastrarUnidade;
    private final AlterarUnidadeUseCase alterarUnidade;

    @GetMapping("/{id}")
    public ResponseEntity<UnidadeResponse> get(@PathVariable Long id) {
        UnidadeResult result = obterUnidade.execute(id);
        return ResponseEntity.ok(UnidadeResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<UnidadeResponse> create(@RequestBody UnidadeCreateRequest req) {
        req.setUsuario(null);
        UnidadeResult saved = cadastrarUnidade.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/unidades/" + saved.getId()))
                .body(UnidadeResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UnidadeResponse> update(@PathVariable Long id, @RequestBody UnidadeUpdateRequest req) {
        UnidadeResult saved = alterarUnidade.execute(req.toCommand(id));
        return ResponseEntity.ok(UnidadeResponse.from(saved));
    }
}

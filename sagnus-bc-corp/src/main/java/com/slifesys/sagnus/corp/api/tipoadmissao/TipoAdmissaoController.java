package com.slifesys.sagnus.corp.api.tipoadmissao;

import com.slifesys.sagnus.corp.application.dto.TipoAdmissaoResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarTipoAdmissaoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarTipoAdmissaoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTipoAdmissaoUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/tipos-admissao")
@RequiredArgsConstructor
public class TipoAdmissaoController {

    private final ObterTipoAdmissaoUseCase obterTipoAdmissao;
    private final CadastrarTipoAdmissaoUseCase cadastrarTipoAdmissao;
    private final AlterarTipoAdmissaoUseCase alterarTipoAdmissao;

    @GetMapping("/{id}")
    public ResponseEntity<TipoAdmissaoResponse> get(@PathVariable Long id) {
        TipoAdmissaoResult result = obterTipoAdmissao.execute(id);
        return ResponseEntity.ok(TipoAdmissaoResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<TipoAdmissaoResponse> create(@RequestBody TipoAdmissaoCreateRequest req) {
        req.setUsuario(null);
        TipoAdmissaoResult saved = cadastrarTipoAdmissao.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/tipos-admissao/" + saved.getId()))
                .body(TipoAdmissaoResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TipoAdmissaoResponse> update(@PathVariable Long id,
            @RequestBody TipoAdmissaoUpdateRequest req) {
        TipoAdmissaoResult saved = alterarTipoAdmissao.execute(req.toCommand(id));
        return ResponseEntity.ok(TipoAdmissaoResponse.from(saved));
    }
}

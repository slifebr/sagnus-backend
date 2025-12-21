package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterPessoaUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.slifesys.sagnus.corp.infrastructure.security.CorpSecurityUtils;

import java.net.URI;

@RestController
@RequestMapping("/corp/pessoas")
@RequiredArgsConstructor
public class PessoaController {

    private final ObterPessoaUseCase obterPessoa;
    private final CadastrarPessoaUseCase cadastrarPessoa;
    private final AlterarPessoaUseCase alterarPessoa;

    @GetMapping("/{id}")
    public ResponseEntity<PessoaResponse> get(@PathVariable Long id) {
        PessoaResult result = obterPessoa.execute(id);
        return ResponseEntity.ok(PessoaResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<PessoaResponse> create(@RequestBody PessoaCreateRequest req) {
        req.setUsuario(CorpSecurityUtils.getCurrentUser());
        PessoaResult saved = cadastrarPessoa.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/corp/pessoas/" + saved.getId()))
                .body(PessoaResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PessoaResponse> update(@PathVariable Long id, @RequestBody PessoaUpdateRequest req) {
        PessoaResult saved = alterarPessoa.execute(req.toCommand(id));
        return ResponseEntity.ok(PessoaResponse.from(saved));
    }
}

package com.slifesys.sagnus.corp.api.uf;

import com.slifesys.sagnus.corp.application.dto.UFResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarUFUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarUFUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterUFUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/ufs")
@RequiredArgsConstructor
public class UFController {

    private final ObterUFUseCase obterUF;
    private final CadastrarUFUseCase cadastrarUF;
    private final AlterarUFUseCase alterarUF;

    @GetMapping("/{id}")
    public ResponseEntity<UFResponse> get(@PathVariable Long id) {
        UFResult result = obterUF.execute(id);
        return ResponseEntity.ok(UFResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<UFResponse> create(@RequestBody UFCreateRequest req) {
        req.setUsuario(null);
        UFResult saved = cadastrarUF.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/ufs/" + saved.getId()))
                .body(UFResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<UFResponse> update(@PathVariable Long id, @RequestBody UFUpdateRequest req) {
        UFResult saved = alterarUF.execute(req.toCommand(id));
        return ResponseEntity.ok(UFResponse.from(saved));
    }
}

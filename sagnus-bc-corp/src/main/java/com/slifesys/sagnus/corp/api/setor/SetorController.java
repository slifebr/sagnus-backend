package com.slifesys.sagnus.corp.api.setor;

import com.slifesys.sagnus.corp.application.dto.SetorResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarSetorUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarSetorUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterSetorUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/setores")
@RequiredArgsConstructor
public class SetorController {

    private final ObterSetorUseCase obterSetor;
    private final CadastrarSetorUseCase cadastrarSetor;
    private final AlterarSetorUseCase alterarSetor;

    @GetMapping("/{id}")
    public ResponseEntity<SetorResponse> get(@PathVariable Long id) {
        SetorResult result = obterSetor.execute(id);
        return ResponseEntity.ok(SetorResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<SetorResponse> create(@RequestBody SetorCreateRequest req) {
        req.setUsuario(null);
        SetorResult saved = cadastrarSetor.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/setores/" + saved.getId()))
                .body(SetorResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<SetorResponse> update(@PathVariable Long id, @RequestBody SetorUpdateRequest req) {
        SetorResult saved = alterarSetor.execute(req.toCommand(id));
        return ResponseEntity.ok(SetorResponse.from(saved));
    }
}

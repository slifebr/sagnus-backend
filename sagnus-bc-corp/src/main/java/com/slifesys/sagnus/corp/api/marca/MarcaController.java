package com.slifesys.sagnus.corp.api.marca;

import com.slifesys.sagnus.corp.application.dto.MarcaResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarMarcaUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarMarcaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterMarcaUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/marcas")
@RequiredArgsConstructor
public class MarcaController {

    private final ObterMarcaUseCase obterMarca;
    private final CadastrarMarcaUseCase cadastrarMarca;
    private final AlterarMarcaUseCase alterarMarca;

    @GetMapping("/{id}")
    public ResponseEntity<MarcaResponse> get(@PathVariable Long id) {
        MarcaResult result = obterMarca.execute(id);
        return ResponseEntity.ok(MarcaResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<MarcaResponse> create(@RequestBody MarcaCreateRequest req) {
        req.setUsuario(null);
        MarcaResult saved = cadastrarMarca.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/marcas/" + saved.getId()))
                .body(MarcaResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<MarcaResponse> update(@PathVariable Long id, @RequestBody MarcaUpdateRequest req) {
        MarcaResult saved = alterarMarca.execute(req.toCommand(id));
        return ResponseEntity.ok(MarcaResponse.from(saved));
    }
}

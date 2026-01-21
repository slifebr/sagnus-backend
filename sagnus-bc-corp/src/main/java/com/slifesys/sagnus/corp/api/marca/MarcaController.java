package com.slifesys.sagnus.corp.api.marca;

import com.slifesys.sagnus.corp.contract.marca.MarcaDTO;
import com.slifesys.sagnus.corp.application.usecase.AlterarMarcaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterMarcaUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarMarcaUseCase;
import com.slifesys.sagnus.corp.contract.marca.MarcaCreateRequest;
import com.slifesys.sagnus.corp.contract.marca.MarcaUpdateRequest;
import jakarta.validation.Valid;
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
    public ResponseEntity<MarcaDTO> get(@PathVariable Long id) {
        return ResponseEntity.ok(obterMarca.execute(id));
    }

    @PostMapping
    public ResponseEntity<MarcaDTO> create(@RequestBody @Valid MarcaCreateRequest req) {
        // Simulating user injection for now - usually comes from SecurityContext
        MarcaCreateRequest cmd = req.toBuilder().usuCriacao("system").build();
        MarcaDTO saved = cadastrarMarca.execute(cmd);
        return ResponseEntity.created(URI.create("/api/v1/corp/marcas/" + saved.getId()))
                .body(saved);
    }

    @PutMapping("/{id}")
    public ResponseEntity<MarcaDTO> update(@PathVariable Long id, @RequestBody @Valid MarcaUpdateRequest req) {
        // Simulating user injection
        MarcaUpdateRequest cmd = req.toBuilder().usuAlteracao("system").build();
        MarcaDTO saved = alterarMarca.execute(id, cmd);
        return ResponseEntity.ok(saved);
    }
}

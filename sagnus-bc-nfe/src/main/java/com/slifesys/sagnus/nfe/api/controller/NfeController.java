package com.slifesys.sagnus.nfe.api.controller;

import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeRequest;
import com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/nfe")
@RequiredArgsConstructor
public class NfeController {

    private final EmitirNfeUseCase emitirNfeUseCase;

    /**
     * Endpoint mínimo para rodar end-to-end.
     * - Cria NFe com itens
     * - Valida e muda estado: RASCUNHO -> VALIDADA -> EMITIDA
     * - Persiste via NfeRepository (InMemory por padrão, até entrar JPA)
     */
    @PostMapping("/notas-fiscais:emitir")
    public ResponseEntity<EmitirNfeResponse> emitir(@Valid @RequestBody EmitirNfeRequest req) {
        
        EmitirNfeResponse resp = emitirNfeUseCase.execute(req);

        return ResponseEntity.created(URI.create("/api/v1/nfe/notas-fiscais/" + resp.getNfeId())).body(resp);
    }
}

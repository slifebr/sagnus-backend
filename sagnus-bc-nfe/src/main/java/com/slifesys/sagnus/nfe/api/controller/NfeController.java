package com.slifesys.sagnus.nfe.api.controller;

import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import com.slifesys.sagnus.nfe.application.mapper.NfeCommandMapper;
import com.slifesys.sagnus.nfe.api.dto.EmitirNfeRequest;
import com.slifesys.sagnus.nfe.api.dto.EmitirNfeResponse;
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
    private final NfeCommandMapper nfeCommandMapper;

    /**
     * Endpoint mínimo para rodar end-to-end.
     * - Cria NFe com itens
     * - Valida e muda estado: RASCUNHO -> VALIDADA -> EMITIDA
     * - Persiste via NfeRepository (InMemory por padrão, até entrar JPA)
     */
    @PostMapping("/notas-fiscais:emitir")
    public ResponseEntity<EmitirNfeResponse> emitir(@Valid @RequestBody EmitirNfeRequest req) {
        EmitirNfeCommand cmd = nfeCommandMapper.toCommand(req);

        EmitirNfeResult result = emitirNfeUseCase.execute(cmd);

        EmitirNfeResponse resp = EmitirNfeResponse.builder()
                .nfeId(result.getNfeId())
                .status(result.getStatus())
                .mensagem(result.getMensagem())
                .build();

        return ResponseEntity.created(URI.create("/api/v1/nfe/notas-fiscais/" + resp.getNfeId())).body(resp);
    }
}

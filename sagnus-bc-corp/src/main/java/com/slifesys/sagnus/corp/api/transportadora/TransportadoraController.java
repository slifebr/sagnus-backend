package com.slifesys.sagnus.corp.api.transportadora;

import com.slifesys.sagnus.corp.application.dto.AlterarTransportadoraCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarTransportadoraCommand;
import com.slifesys.sagnus.corp.application.dto.TransportadoraResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarTransportadoraUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarTransportadoraUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTransportadoraUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/transportadoras")
@RequiredArgsConstructor
public class TransportadoraController {

    private final CadastrarTransportadoraUseCase cadastrarTransportadoraUseCase;
    private final AlterarTransportadoraUseCase alterarTransportadoraUseCase;
    private final ObterTransportadoraUseCase obterTransportadoraUseCase;

    @PostMapping
    public ResponseEntity<TransportadoraResponse> cadastrar(@RequestBody @Valid TransportadoraCreateRequest request) {
        TransportadoraResult result = cadastrarTransportadoraUseCase.execute(new CadastrarTransportadoraCommand(
                request.getIdPessoa(),
                request.getPlacaVeiculo(),
                request.getRntc(),
                "SYSTEM" // TODO: obter do contexto de segurança
        ));
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TransportadoraResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid TransportadoraUpdateRequest request) {
        TransportadoraResult result = alterarTransportadoraUseCase.execute(new AlterarTransportadoraCommand(
                id,
                request.getIdPessoa(),
                request.getPlacaVeiculo(),
                request.getRntc(),
                "SYSTEM" // TODO: obter do contexto de segurança
        ));
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TransportadoraResponse> obterPorId(@PathVariable Long id) {
        TransportadoraResult result = obterTransportadoraUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private TransportadoraResponse toResponse(TransportadoraResult result) {
        return TransportadoraResponse.builder()
                .id(result.getId())
                .idPessoa(result.getIdPessoa())
                .placaVeiculo(result.getPlacaVeiculo())
                .rntc(result.getRntc())
                .build();
    }
}

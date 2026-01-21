package com.slifesys.sagnus.corp.api.transportadora;

import com.slifesys.sagnus.corp.application.command.AlterarTransportadoraCommand;
import com.slifesys.sagnus.corp.application.command.CadastrarTransportadoraCommand;
import com.slifesys.sagnus.corp.contract.transportadora.TransportadoraDTO;
import com.slifesys.sagnus.corp.application.usecase.AlterarTransportadoraUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarTransportadoraUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTransportadoraUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/corp/transportadoras")
@RequiredArgsConstructor
public class TransportadoraController {

    private final CadastrarTransportadoraUseCase cadastrarTransportadoraUseCase;
    private final AlterarTransportadoraUseCase alterarTransportadoraUseCase;
    private final ObterTransportadoraUseCase obterTransportadoraUseCase;

    @PostMapping
    public ResponseEntity<TransportadoraDTO> cadastrar(@RequestBody @Valid TransportadoraCreateRequest request) {
        TransportadoraDTO result = cadastrarTransportadoraUseCase.execute(new CadastrarTransportadoraCommand(
                request.getIdPessoa(),
                request.getPlacaVeiculo(),
                request.getRntc(),
                null));
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TransportadoraDTO> alterar(@PathVariable Long id,
            @RequestBody @Valid TransportadoraUpdateRequest request) {
        TransportadoraDTO result = alterarTransportadoraUseCase.execute(new AlterarTransportadoraCommand(
                id,
                request.getIdPessoa(),
                request.getPlacaVeiculo(),
                request.getRntc(),
                null));
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TransportadoraDTO> obterPorId(@PathVariable Long id) {
        TransportadoraDTO result = obterTransportadoraUseCase.execute(id);
        return ResponseEntity.ok(result);
    }
}

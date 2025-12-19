package com.slifesys.sagnus.corp.api.tabelapreco;

import com.slifesys.sagnus.corp.application.dto.AlterarTabelaPrecoCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarTabelaPrecoCommand;
import com.slifesys.sagnus.corp.application.dto.TabelaPrecoResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarTabelaPrecoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarTabelaPrecoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterTabelaPrecoUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/tabelas-precos")
@RequiredArgsConstructor
public class TabelaPrecoController {

    private final CadastrarTabelaPrecoUseCase cadastrarTabelaPrecoUseCase;
    private final AlterarTabelaPrecoUseCase alterarTabelaPrecoUseCase;
    private final ObterTabelaPrecoUseCase obterTabelaPrecoUseCase;

    @PostMapping
    public ResponseEntity<TabelaPrecoResponse> cadastrar(@RequestBody @Valid TabelaPrecoCreateRequest request) {
        TabelaPrecoResult result = cadastrarTabelaPrecoUseCase.execute(new CadastrarTabelaPrecoCommand(
                request.getNome(),
                request.getDataInicio(),
                request.getDataFim(),
                request.getCoeficiente(),
                "SYSTEM" // TODO: obter do contexto de segurança
        ));
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TabelaPrecoResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid TabelaPrecoUpdateRequest request) {
        TabelaPrecoResult result = alterarTabelaPrecoUseCase.execute(new AlterarTabelaPrecoCommand(
                id,
                request.getNome(),
                request.getDataInicio(),
                request.getDataFim(),
                request.getCoeficiente(),
                "SYSTEM" // TODO: obter do contexto de segurança
        ));
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TabelaPrecoResponse> obterPorId(@PathVariable Long id) {
        TabelaPrecoResult result = obterTabelaPrecoUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private TabelaPrecoResponse toResponse(TabelaPrecoResult result) {
        return TabelaPrecoResponse.builder()
                .id(result.getId())
                .nome(result.getNome())
                .dataInicio(result.getDataInicio())
                .dataFim(result.getDataFim())
                .coeficiente(result.getCoeficiente())
                .build();
    }
}

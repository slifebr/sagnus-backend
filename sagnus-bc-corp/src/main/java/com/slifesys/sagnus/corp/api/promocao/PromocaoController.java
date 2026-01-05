package com.slifesys.sagnus.corp.api.promocao;

import com.slifesys.sagnus.corp.application.dto.AlterarPromocaoCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarPromocaoCommand;
import com.slifesys.sagnus.corp.application.dto.PromocaoResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarPromocaoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarPromocaoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterPromocaoUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/corp/promocoes")
@RequiredArgsConstructor
public class PromocaoController {

    private final CadastrarPromocaoUseCase cadastrarPromocaoUseCase;
    private final AlterarPromocaoUseCase alterarPromocaoUseCase;
    private final ObterPromocaoUseCase obterPromocaoUseCase;

    @PostMapping
    public ResponseEntity<PromocaoResponse> cadastrar(@RequestBody @Valid PromocaoCreateRequest request) {
        PromocaoResult result = cadastrarPromocaoUseCase.execute(new CadastrarPromocaoCommand(
                request.getIdProduto(),
                request.getDataInicio(),
                request.getDataFim(),
                request.getPrecoPromocional(),
                null));
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PromocaoResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid PromocaoUpdateRequest request) {
        PromocaoResult result = alterarPromocaoUseCase.execute(new AlterarPromocaoCommand(
                id,
                request.getIdProduto(),
                request.getDataInicio(),
                request.getDataFim(),
                request.getPrecoPromocional(),
                null));
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<PromocaoResponse> obterPorId(@PathVariable Long id) {
        PromocaoResult result = obterPromocaoUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private PromocaoResponse toResponse(PromocaoResult result) {
        return PromocaoResponse.builder()
                .id(result.getId())
                .idProduto(result.getIdProduto())
                .dataInicio(result.getDataInicio())
                .dataFim(result.getDataFim())
                .precoPromocional(result.getPrecoPromocional())
                .build();
    }
}

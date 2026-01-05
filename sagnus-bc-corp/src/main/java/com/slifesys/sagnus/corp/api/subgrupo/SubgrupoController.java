package com.slifesys.sagnus.corp.api.subgrupo;

import com.slifesys.sagnus.corp.application.dto.AlterarSubgrupoCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarSubgrupoCommand;
import com.slifesys.sagnus.corp.application.dto.SubgrupoResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarSubgrupoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarSubgrupoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterSubgrupoUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/corp/subgrupos")
@RequiredArgsConstructor
public class SubgrupoController {

    private final CadastrarSubgrupoUseCase cadastrarSubgrupoUseCase;
    private final AlterarSubgrupoUseCase alterarSubgrupoUseCase;
    private final ObterSubgrupoUseCase obterSubgrupoUseCase;

    @PostMapping
    public ResponseEntity<SubgrupoResponse> cadastrar(@RequestBody @Valid SubgrupoCreateRequest request) {
        SubgrupoResult result = cadastrarSubgrupoUseCase.execute(new CadastrarSubgrupoCommand(
                request.getIdGrupo(),
                request.getNome(),
                request.getDescricao(),
                null));
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<SubgrupoResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid SubgrupoUpdateRequest request) {
        SubgrupoResult result = alterarSubgrupoUseCase.execute(new AlterarSubgrupoCommand(
                id,
                request.getIdGrupo(),
                request.getNome(),
                request.getDescricao(),
                null));
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<SubgrupoResponse> obterPorId(@PathVariable Long id) {
        SubgrupoResult result = obterSubgrupoUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private SubgrupoResponse toResponse(SubgrupoResult result) {
        return SubgrupoResponse.builder()
                .id(result.getId())
                .idGrupo(result.getIdGrupo())
                .nome(result.getNome())
                .descricao(result.getDescricao())
                .build();
    }
}

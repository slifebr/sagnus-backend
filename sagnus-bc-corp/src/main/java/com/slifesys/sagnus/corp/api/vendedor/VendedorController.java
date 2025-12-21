package com.slifesys.sagnus.corp.api.vendedor;

import com.slifesys.sagnus.corp.application.dto.AlterarVendedorCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarVendedorCommand;
import com.slifesys.sagnus.corp.application.dto.VendedorResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarVendedorUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarVendedorUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterVendedorUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.slifesys.sagnus.corp.infrastructure.security.CorpSecurityUtils;

@RestController
@RequestMapping("/api/v1/vendedores")
@RequiredArgsConstructor
public class VendedorController {

    private final CadastrarVendedorUseCase cadastrarVendedorUseCase;
    private final AlterarVendedorUseCase alterarVendedorUseCase;
    private final ObterVendedorUseCase obterVendedorUseCase;

    @PostMapping
    public ResponseEntity<VendedorResponse> cadastrar(@RequestBody @Valid VendedorCreateRequest request) {
        VendedorResult result = cadastrarVendedorUseCase.execute(new CadastrarVendedorCommand(
                request.getIdPessoa(),
                request.getComissao(),
                request.getMeta(),
                CorpSecurityUtils.getCurrentUser()));
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<VendedorResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid VendedorUpdateRequest request) {
        VendedorResult result = alterarVendedorUseCase.execute(new AlterarVendedorCommand(
                id,
                request.getIdPessoa(),
                request.getComissao(),
                request.getMeta(),
                CorpSecurityUtils.getCurrentUser()));
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<VendedorResponse> obterPorId(@PathVariable Long id) {
        VendedorResult result = obterVendedorUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private VendedorResponse toResponse(VendedorResult result) {
        return VendedorResponse.builder()
                .id(result.getId())
                .idPessoa(result.getIdPessoa())
                .comissao(result.getComissao())
                .meta(result.getMeta())
                .build();
    }
}

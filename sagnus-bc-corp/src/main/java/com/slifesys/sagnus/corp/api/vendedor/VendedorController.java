package com.slifesys.sagnus.corp.api.vendedor;

import com.slifesys.sagnus.corp.application.command.AlterarVendedorCommand;
import com.slifesys.sagnus.corp.application.command.CadastrarVendedorCommand;
import com.slifesys.sagnus.corp.contract.vendedor.VendedorDTO;
import com.slifesys.sagnus.corp.application.usecase.AlterarVendedorUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarVendedorUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterVendedorUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/corp/vendedores")
@RequiredArgsConstructor
public class VendedorController {

    private final CadastrarVendedorUseCase cadastrarVendedorUseCase;
    private final AlterarVendedorUseCase alterarVendedorUseCase;
    private final ObterVendedorUseCase obterVendedorUseCase;

    @PostMapping
    public ResponseEntity<VendedorDTO> cadastrar(@RequestBody @Valid VendedorCreateRequest request) {
        VendedorDTO result = cadastrarVendedorUseCase.execute(new CadastrarVendedorCommand(
                request.getIdPessoa(),
                request.getComissao(),
                request.getMeta(),
                null));
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @PutMapping("/{id}")
    public ResponseEntity<VendedorDTO> alterar(@PathVariable Long id,
            @RequestBody @Valid VendedorUpdateRequest request) {
        VendedorDTO result = alterarVendedorUseCase.execute(new AlterarVendedorCommand(
                id,
                request.getIdPessoa(),
                request.getComissao(),
                request.getMeta(),
                null));
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<VendedorDTO> obterPorId(@PathVariable Long id) {
        VendedorDTO result = obterVendedorUseCase.execute(id);
        return ResponseEntity.ok(result);
    }
}

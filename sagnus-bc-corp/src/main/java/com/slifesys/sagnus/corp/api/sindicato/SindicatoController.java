package com.slifesys.sagnus.corp.api.sindicato;

import com.slifesys.sagnus.corp.application.command.AlterarSindicatoCommand;
import com.slifesys.sagnus.corp.application.command.CadastrarSindicatoCommand;
import com.slifesys.sagnus.corp.contract.sindicato.SindicatoDTO;
import com.slifesys.sagnus.corp.application.usecase.AlterarSindicatoUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarSindicatoUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterSindicatoUseCase;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/corp/sindicatos")
@RequiredArgsConstructor
public class SindicatoController {

    private final CadastrarSindicatoUseCase cadastrarSindicatoUseCase;
    private final AlterarSindicatoUseCase alterarSindicatoUseCase;
    private final ObterSindicatoUseCase obterSindicatoUseCase;

    @PostMapping
    public ResponseEntity<SindicatoDTO> cadastrar(@RequestBody @Valid SindicatoCreateRequest request) {
        SindicatoDTO result = cadastrarSindicatoUseCase.execute(new CadastrarSindicatoCommand(
                request.getNome(),
                request.getCodigoBanco(),
                request.getCodigoAgencia(),
                request.getContaBanco(),
                request.getCodigoCedente(),
                request.getLogradouro(),
                request.getNumero(),
                request.getBairro(),
                request.getMunicipioIbge(),
                request.getUf(),
                request.getFone1(),
                request.getFone2(),
                request.getEmail(),
                request.getTipoSindicato(),
                request.getDataBase(),
                request.getPisoSalarial(),
                request.getCnpj(),
                request.getClassificacaoContabilConta(),
                null));
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @PutMapping("/{id}")
    public ResponseEntity<SindicatoDTO> alterar(@PathVariable Long id,
            @RequestBody @Valid SindicatoUpdateRequest request) {
        SindicatoDTO result = alterarSindicatoUseCase.execute(new AlterarSindicatoCommand(
                id,
                request.getNome(),
                request.getCodigoBanco(),
                request.getCodigoAgencia(),
                request.getContaBanco(),
                request.getCodigoCedente(),
                request.getLogradouro(),
                request.getNumero(),
                request.getBairro(),
                request.getMunicipioIbge(),
                request.getUf(),
                request.getFone1(),
                request.getFone2(),
                request.getEmail(),
                request.getTipoSindicato(),
                request.getDataBase(),
                request.getPisoSalarial(),
                request.getCnpj(),
                request.getClassificacaoContabilConta(),
                null));
        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<SindicatoDTO> obterPorId(@PathVariable Long id) {
        SindicatoDTO result = obterSindicatoUseCase.execute(id);
        return ResponseEntity.ok(result);
    }
}

package com.slifesys.sagnus.corp.api.sindicato;

import com.slifesys.sagnus.corp.application.dto.AlterarSindicatoCommand;
import com.slifesys.sagnus.corp.application.dto.CadastrarSindicatoCommand;
import com.slifesys.sagnus.corp.application.dto.SindicatoResult;
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
    public ResponseEntity<SindicatoResponse> cadastrar(@RequestBody @Valid SindicatoCreateRequest request) {
        SindicatoResult result = cadastrarSindicatoUseCase.execute(new CadastrarSindicatoCommand(
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
        return ResponseEntity.status(HttpStatus.CREATED).body(toResponse(result));
    }

    @PutMapping("/{id}")
    public ResponseEntity<SindicatoResponse> alterar(@PathVariable Long id,
            @RequestBody @Valid SindicatoUpdateRequest request) {
        SindicatoResult result = alterarSindicatoUseCase.execute(new AlterarSindicatoCommand(
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
        return ResponseEntity.ok(toResponse(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<SindicatoResponse> obterPorId(@PathVariable Long id) {
        SindicatoResult result = obterSindicatoUseCase.execute(id);
        return ResponseEntity.ok(toResponse(result));
    }

    private SindicatoResponse toResponse(SindicatoResult result) {
        return SindicatoResponse.builder()
                .id(result.getId())
                .nome(result.getNome())
                .codigoBanco(result.getCodigoBanco())
                .codigoAgencia(result.getCodigoAgencia())
                .contaBanco(result.getContaBanco())
                .codigoCedente(result.getCodigoCedente())
                .logradouro(result.getLogradouro())
                .numero(result.getNumero())
                .bairro(result.getBairro())
                .municipioIbge(result.getMunicipioIbge())
                .uf(result.getUf())
                .fone1(result.getFone1())
                .fone2(result.getFone2())
                .email(result.getEmail())
                .tipoSindicato(result.getTipoSindicato())
                .dataBase(result.getDataBase())
                .pisoSalarial(result.getPisoSalarial())
                .cnpj(result.getCnpj())
                .classificacaoContabilConta(result.getClassificacaoContabilConta())
                .build();
    }
}

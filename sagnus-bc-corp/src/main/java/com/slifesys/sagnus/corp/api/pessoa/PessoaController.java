package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.application.usecase.AlterarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.CadastrarPessoaUseCase;
import com.slifesys.sagnus.corp.application.usecase.ListarPessoasUseCase;
import com.slifesys.sagnus.corp.application.usecase.ObterPessoaUseCase;
import com.slifesys.sagnus.shared.paging.PageDirection;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/api/v1/corp/pessoas")
@RequiredArgsConstructor
public class PessoaController {

    private final ObterPessoaUseCase obterPessoa;
    private final ListarPessoasUseCase listarPessoas;
    private final CadastrarPessoaUseCase cadastrarPessoa;
    private final AlterarPessoaUseCase alterarPessoa;

    /**
     * Lista/pesquisa para telas (GraphQL-ready). Mantém filtros simples e paginação.
     */
    @GetMapping
    public ResponseEntity<PessoaPageResponse> list(@RequestParam(required = false) String nome,
                                                  @RequestParam(required = false) String documento,
                                                  @RequestParam(defaultValue = "0") int page,
                                                  @RequestParam(defaultValue = "20") int size,
                                                  @RequestParam(required = false) String sortBy,
                                                  @RequestParam(defaultValue = "ASC") String sortDir) {
        PageDirection dir = "DESC".equalsIgnoreCase(sortDir) ? PageDirection.DESC : PageDirection.ASC;
        PageRequest req = PageRequest.of(page, size, sortBy, dir);
        PageResult<PessoaResult> result = listarPessoas.execute(nome, documento, req);
        return ResponseEntity.ok(PessoaPageResponse.from(result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<PessoaResponse> get(@PathVariable Long id) {
        PessoaResult result = obterPessoa.execute(id);
        return ResponseEntity.ok(PessoaResponse.from(result));
    }

    @PostMapping
    public ResponseEntity<PessoaResponse> create(@RequestBody PessoaCreateRequest req) {
        req.setUsuario(null);
        PessoaResult saved = cadastrarPessoa.execute(req.toCommand());
        return ResponseEntity.created(URI.create("/api/v1/corp/pessoas/" + saved.getId()))
                .body(PessoaResponse.from(saved));
    }

    @PutMapping("/{id}")
    public ResponseEntity<PessoaResponse> update(@PathVariable Long id, @RequestBody PessoaUpdateRequest req) {
        PessoaResult saved = alterarPessoa.execute(req.toCommand(id));
        return ResponseEntity.ok(PessoaResponse.from(saved));
    }
}

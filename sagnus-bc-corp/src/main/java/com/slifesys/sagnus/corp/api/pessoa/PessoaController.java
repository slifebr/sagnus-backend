package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.pessoa.PessoaAppService;
import com.slifesys.sagnus.corp.domain.pessoa.Pessoa;
import com.slifesys.sagnus.corp.domain.pessoa.PessoaTipo;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;

@RestController
@RequestMapping("/corp/pessoas")
@RequiredArgsConstructor
public class PessoaController {

    private final PessoaAppService app;

    @GetMapping("/{id}")
    public ResponseEntity<PessoaResponse> get(@PathVariable Long id) {
        return app.buscarPorId(id)
                .map(this::toResponse)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public ResponseEntity<PessoaResponse> create(@RequestBody PessoaCreateRequest req) {
        Pessoa p = Pessoa.builder()
                .nome(req.getNome())
                .tipo(req.getTipo() != null ? PessoaTipo.fromDb(req.getTipo()) : null)
                .site(req.getSite())
                .email(req.getEmail())
                .build();

        Pessoa saved = app.salvar(p);
        return ResponseEntity.created(URI.create("/corp/pessoas/" + saved.getId()))
                .body(toResponse(saved));
    }

    private PessoaResponse toResponse(Pessoa p) {
        return PessoaResponse.builder()
                .id(p.getId())
                .nome(p.getNome())
                .tipo(p.getTipo() != null ? p.getTipo().toDb() : null)
                .site(p.getSite())
                .email(p.getEmail())
                .build();
    }
}

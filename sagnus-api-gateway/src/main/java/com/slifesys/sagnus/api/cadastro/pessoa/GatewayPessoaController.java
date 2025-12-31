package com.slifesys.sagnus.api.cadastro.pessoa;

import com.slifesys.sagnus.api.cadastro.pessoa.dto.PessoaDTO;
import com.slifesys.sagnus.application.cadastro.pessoa.PessoaService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/pessoas")
public class GatewayPessoaController {

    private final PessoaService service;

    public GatewayPessoaController(PessoaService service) {
        this.service = service;
    }

    // LISTAGEM PAGINADA + FILTRO
    @PreAuthorize("hasAuthority('CAD_PESSOA_CONSULTAR')")
    @GetMapping
    public Page<PessoaDTO> listar(
            @RequestParam(required = false) String nome,
            @RequestParam(required = false) String tipo,
            @RequestParam(required = false) Boolean ativo,
            Pageable pageable) {

        return service.listar(nome, tipo, ativo, pageable);
    }

    @PreAuthorize("hasAuthority('CAD_PESSOA_CONSULTAR')")
    @GetMapping("/{id}")
    public PessoaDTO buscarPorId(@PathVariable Integer id) {
        return service.buscarPorId(id);
    }

    @PreAuthorize("hasAuthority('CAD_PESSOA_EDITAR')")
    @PostMapping
    public ResponseEntity<PessoaDTO> criar(@Valid @RequestBody PessoaDTO dto) {
        PessoaDTO criado = service.criar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(criado);
    }

    @PreAuthorize("hasAuthority('CAD_PESSOA_EDITAR')")
    @PutMapping("/{id}")
    public PessoaDTO atualizar(@PathVariable Integer id,
            @Valid @RequestBody PessoaDTO dto) {
        return service.atualizar(id, dto);
    }

    @PreAuthorize("hasAuthority('CAD_PESSOA_EXCLUIR')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluir(@PathVariable Integer id) {
        service.excluir(id);
        return ResponseEntity.noContent().build();
    }
}

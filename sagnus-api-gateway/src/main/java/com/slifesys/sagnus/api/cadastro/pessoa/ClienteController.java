package com.slifesys.sagnus.api.cadastro.pessoa;

import com.slifesys.sagnus.api.cadastro.pessoa.dto.ClienteDTO;
import com.slifesys.sagnus.application.cadastro.pessoa.ClienteService;
import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/clientes")
public class ClienteController {

    private final ClienteService service;

    public ClienteController(ClienteService service) {
        this.service = service;
    }

    /*
        // @PreAuthorize("hasAuthority('CAD_CLIENTE_CONSULTAR')")
        @GetMapping
        public List<ClienteDTO> listar() {
            return service.listarTodos();
        }
    */
    @GetMapping
    public Page<ClienteDTO> listar(
            @RequestParam(required = false) Integer pessoaId,
            @RequestParam(required = false) String pessoaNome,
            Pageable pageable) {

        return service.listar(pessoaId, pessoaNome, pageable);
    }

    @GetMapping("/{id}")
    public ClienteDTO buscarPorId(@PathVariable Integer id) {
        return service.buscarPorId(id);
    }

    // @PreAuthorize("hasAuthority('CAD_CLIENTE_CRIAR')")
    @PostMapping
    public ResponseEntity<ClienteDTO> criar(@Valid @RequestBody ClienteDTO dto) {
        ClienteDTO criado = service.criar(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(criado);
    }

    // @PreAuthorize("hasAuthority('CAD_CLIENTE_ALTERAR')")
    @PutMapping("/{id}")
    public ClienteDTO atualizar(@PathVariable Integer id,
                                @Valid @RequestBody ClienteDTO dto) {
        return service.atualizar(id, dto);
    }

    // @PreAuthorize("hasAuthority('CAD_CLIENTE_EXCLUIR')")
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> excluir(@PathVariable Integer id) {
        service.excluir(id);
        return ResponseEntity.noContent().build();
    }
}

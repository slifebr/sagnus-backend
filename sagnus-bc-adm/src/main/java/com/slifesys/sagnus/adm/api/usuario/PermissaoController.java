package com.slifesys.sagnus.adm.api.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PermissaoDTO;
import com.slifesys.sagnus.adm.application.service.usuario.PermissaoService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/permissoes")
@AllArgsConstructor
public class PermissaoController {

    private final PermissaoService permissaoService;

    @GetMapping
    public ResponseEntity<List<PermissaoDTO>> findAll() {
        return ResponseEntity.ok(permissaoService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<PermissaoDTO> findById(@PathVariable Long id) {
        PermissaoDTO permissaoDTO = permissaoService.findById(id);
        return permissaoDTO != null ? ResponseEntity.ok(permissaoDTO) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<PermissaoDTO> save(@RequestBody PermissaoDTO permissaoDTO) {
        return ResponseEntity.ok(permissaoService.save(permissaoDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        permissaoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

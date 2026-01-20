package com.slifesys.sagnus.adm.api.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PerfilDTO;
import com.slifesys.sagnus.adm.application.service.usuario.PerfilService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/perfis")
@AllArgsConstructor
public class PerfilController {

    private final PerfilService perfilService;

    @GetMapping
    public ResponseEntity<List<PerfilDTO>> findAll() {
        return ResponseEntity.ok(perfilService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<PerfilDTO> findById(@PathVariable Long id) {
        PerfilDTO perfilDTO = perfilService.findById(id);
        return perfilDTO != null ? ResponseEntity.ok(perfilDTO) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<PerfilDTO> save(@RequestBody PerfilDTO perfilDTO) {
        return ResponseEntity.ok(perfilService.save(perfilDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        perfilService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

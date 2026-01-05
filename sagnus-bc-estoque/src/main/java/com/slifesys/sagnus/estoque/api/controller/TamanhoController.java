package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Tamanho;
import com.slifesys.sagnus.estoque.domain.service.TamanhoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/tamanhos")
public class TamanhoController {

    @Autowired
    private TamanhoService tamanhoService;

    @GetMapping
    public List<Tamanho> listar() {
        return tamanhoService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Tamanho> buscar(@PathVariable Long id) {
        Optional<Tamanho> tamanho = tamanhoService.findById(id);
        return tamanho.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Tamanho adicionar(@RequestBody Tamanho tamanho) {
        return tamanhoService.save(tamanho);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Tamanho> atualizar(@PathVariable Long id, @RequestBody Tamanho tamanho) {
        if (!tamanhoService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        tamanho.setId(id);
        tamanho = tamanhoService.save(tamanho);
        return ResponseEntity.ok(tamanho);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!tamanhoService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        tamanhoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

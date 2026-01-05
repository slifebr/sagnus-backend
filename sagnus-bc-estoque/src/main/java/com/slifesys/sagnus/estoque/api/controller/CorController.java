package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Cor;
import com.slifesys.sagnus.estoque.domain.service.CorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cores")
public class CorController {

    @Autowired
    private CorService corService;

    @GetMapping
    public List<Cor> listar() {
        return corService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cor> buscar(@PathVariable Long id) {
        Optional<Cor> cor = corService.findById(id);
        return cor.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cor adicionar(@RequestBody Cor cor) {
        return corService.save(cor);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cor> atualizar(@PathVariable Long id, @RequestBody Cor cor) {
        if (!corService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        cor.setId(id);
        cor = corService.save(cor);
        return ResponseEntity.ok(cor);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!corService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        corService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

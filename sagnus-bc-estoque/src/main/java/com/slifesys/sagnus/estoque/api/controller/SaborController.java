package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Sabor;
import com.slifesys.sagnus.estoque.domain.service.SaborService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/sabores")
public class SaborController {

    @Autowired
    private SaborService saborService;

    @GetMapping
    public List<Sabor> listar() {
        return saborService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Sabor> buscar(@PathVariable Long id) {
        Optional<Sabor> sabor = saborService.findById(id);
        return sabor.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Sabor adicionar(@RequestBody Sabor sabor) {
        return saborService.save(sabor);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Sabor> atualizar(@PathVariable Long id, @RequestBody Sabor sabor) {
        if (!saborService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        sabor.setId(id);
        sabor = saborService.save(sabor);
        return ResponseEntity.ok(sabor);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!saborService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        saborService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

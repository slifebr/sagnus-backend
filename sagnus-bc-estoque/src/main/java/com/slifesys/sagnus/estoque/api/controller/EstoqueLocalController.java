package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.service.EstoqueLocalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/estoque-locais")
public class EstoqueLocalController {

    @Autowired
    private EstoqueLocalService estoqueLocalService;

    @GetMapping
    public List<EstoqueLocal> listar() {
        return estoqueLocalService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<EstoqueLocal> buscar(@PathVariable Long id) {
        Optional<EstoqueLocal> estoqueLocal = estoqueLocalService.findById(id);
        return estoqueLocal.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public EstoqueLocal adicionar(@RequestBody EstoqueLocal estoqueLocal) {
        return estoqueLocalService.save(estoqueLocal);
    }

    @PutMapping("/{id}")
    public ResponseEntity<EstoqueLocal> atualizar(@PathVariable Long id, @RequestBody EstoqueLocal estoqueLocal) {
        if (!estoqueLocalService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        estoqueLocal.setId(id);
        estoqueLocal = estoqueLocalService.save(estoqueLocal);
        return ResponseEntity.ok(estoqueLocal);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!estoqueLocalService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        estoqueLocalService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Marca;
import com.slifesys.sagnus.estoque.domain.service.MarcaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/marcas")
public class MarcaController {

    @Autowired
    private MarcaService marcaService;

    @GetMapping
    public List<Marca> listar() {
        return marcaService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Marca> buscar(@PathVariable Long id) {
        Optional<Marca> marca = marcaService.findById(id);
        return marca.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Marca adicionar(@RequestBody Marca marca) {
        return marcaService.save(marca);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Marca> atualizar(@PathVariable Long id, @RequestBody Marca marca) {
        if (!marcaService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        marca.setId(id);
        marca = marcaService.save(marca);
        return ResponseEntity.ok(marca);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!marcaService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        marcaService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

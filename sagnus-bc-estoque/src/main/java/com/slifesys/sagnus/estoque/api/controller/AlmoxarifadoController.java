package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Almoxarifado;
import com.slifesys.sagnus.estoque.domain.service.AlmoxarifadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/almoxarifados")
public class AlmoxarifadoController {

    @Autowired
    private AlmoxarifadoService almoxarifadoService;

    @GetMapping
    public List<Almoxarifado> listar() {
        return almoxarifadoService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Almoxarifado> buscar(@PathVariable Long id) {
        Optional<Almoxarifado> almoxarifado = almoxarifadoService.findById(id);
        return almoxarifado.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Almoxarifado adicionar(@RequestBody Almoxarifado almoxarifado) {
        return almoxarifadoService.save(almoxarifado);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Almoxarifado> atualizar(@PathVariable Long id, @RequestBody Almoxarifado almoxarifado) {
        if (!almoxarifadoService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        almoxarifado.setId(id);
        almoxarifado = almoxarifadoService.save(almoxarifado);
        return ResponseEntity.ok(almoxarifado);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!almoxarifadoService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        almoxarifadoService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

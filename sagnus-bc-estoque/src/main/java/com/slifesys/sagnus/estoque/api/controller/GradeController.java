package com.slifesys.sagnus.estoque.api.controller;

import com.slifesys.sagnus.estoque.domain.model.Grade;
import com.slifesys.sagnus.estoque.domain.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/grades")
public class GradeController {

    @Autowired
    private GradeService gradeService;

    @GetMapping
    public List<Grade> listar() {
        return gradeService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Grade> buscar(@PathVariable Long id) {
        Optional<Grade> grade = gradeService.findById(id);
        return grade.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Grade adicionar(@RequestBody Grade grade) {
        return gradeService.save(grade);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Grade> atualizar(@PathVariable Long id, @RequestBody Grade grade) {
        if (!gradeService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        grade.setId(id);
        grade = gradeService.save(grade);
        return ResponseEntity.ok(grade);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> remover(@PathVariable Long id) {
        if (!gradeService.findById(id).isPresent()) {
            return ResponseEntity.notFound().build();
        }
        gradeService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

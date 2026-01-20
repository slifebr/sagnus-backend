package com.slifesys.sagnus.adm.api.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.EmpresaDTO;
import com.slifesys.sagnus.adm.application.service.empresa.EmpresaService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/empresas")
@AllArgsConstructor
public class EmpresaController {

    private final EmpresaService empresaService;

    @GetMapping
    public ResponseEntity<List<EmpresaDTO>> findAll() {
        return ResponseEntity.ok(empresaService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<EmpresaDTO> findById(@PathVariable Long id) {
        EmpresaDTO empresaDTO = empresaService.findById(id);
        return empresaDTO != null ? ResponseEntity.ok(empresaDTO) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<EmpresaDTO> save(@RequestBody EmpresaDTO empresaDTO) {
        return ResponseEntity.ok(empresaService.save(empresaDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        empresaService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

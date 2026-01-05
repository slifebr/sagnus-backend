package com.slifesys.sagnus.adm.interfaces.web.parametro;

import com.slifesys.sagnus.adm.application.dto.parametro.ParametroSistemaDTO;
import com.slifesys.sagnus.adm.application.service.parametro.ParametroSistemaService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/parametros-sistema")
@AllArgsConstructor
public class ParametroSistemaController {

    private final ParametroSistemaService parametroSistemaService;

    @GetMapping
    public ResponseEntity<List<ParametroSistemaDTO>> findAll() {
        return ResponseEntity.ok(parametroSistemaService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ParametroSistemaDTO> findById(@PathVariable Long id) {
        ParametroSistemaDTO parametroSistemaDTO = parametroSistemaService.findById(id);
        return parametroSistemaDTO != null ? ResponseEntity.ok(parametroSistemaDTO) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<ParametroSistemaDTO> save(@RequestBody ParametroSistemaDTO parametroSistemaDTO) {
        return ResponseEntity.ok(parametroSistemaService.save(parametroSistemaDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        parametroSistemaService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

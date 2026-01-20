package com.slifesys.sagnus.adm.api.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.FilialDTO;
import com.slifesys.sagnus.adm.application.service.empresa.FilialService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/filiais")
@AllArgsConstructor
public class FilialController {

    private final FilialService filialService;

    @GetMapping
    public ResponseEntity<List<FilialDTO>> findAll() {
        return ResponseEntity.ok(filialService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<FilialDTO> findById(@PathVariable Long id) {
        FilialDTO filialDTO = filialService.findById(id);
        return filialDTO != null ? ResponseEntity.ok(filialDTO) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<FilialDTO> save(@RequestBody FilialDTO filialDTO) {
        return ResponseEntity.ok(filialService.save(filialDTO));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        filialService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}

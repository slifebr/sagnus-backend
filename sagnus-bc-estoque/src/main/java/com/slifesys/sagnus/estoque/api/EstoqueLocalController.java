package com.slifesys.sagnus.estoque.api;

import com.slifesys.sagnus.estoque.api.mappers.EstoqueLocalApiMapper;
import com.slifesys.sagnus.estoque.application.dto.EstoqueLocalDTO;
import com.slifesys.sagnus.estoque.application.usecase.BuscarEstoqueLocalUseCase;
import com.slifesys.sagnus.estoque.application.usecase.CriarEstoqueLocalUseCase;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/estoque-locais")
@AllArgsConstructor
public class EstoqueLocalController {

    private final CriarEstoqueLocalUseCase criarEstoqueLocalUseCase;
    private final BuscarEstoqueLocalUseCase buscarEstoqueLocalUseCase;
    private final EstoqueLocalApiMapper mapper = EstoqueLocalApiMapper.INSTANCE;

    @PostMapping
    public EstoqueLocalDTO create(@RequestBody EstoqueLocalDTO estoqueLocalDTO) {
        var domain = mapper.toDomain(estoqueLocalDTO);
        var savedDomain = criarEstoqueLocalUseCase.execute(domain);
        return mapper.toDto(savedDomain);
    }

    @GetMapping
    public List<EstoqueLocalDTO> findAll() {
        return buscarEstoqueLocalUseCase.execute().stream()
                .map(mapper::toDto)
                .collect(Collectors.toList());
    }
}

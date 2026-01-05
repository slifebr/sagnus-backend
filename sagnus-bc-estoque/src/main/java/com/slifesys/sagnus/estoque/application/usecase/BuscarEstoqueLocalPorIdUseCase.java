package com.slifesys.sagnus.estoque.application.usecase;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class BuscarEstoqueLocalPorIdUseCase {

    private final EstoqueLocalRepository estoqueLocalRepository;

    public Optional<EstoqueLocal> execute(Long id) {
        return estoqueLocalRepository.findById(id);
    }
}

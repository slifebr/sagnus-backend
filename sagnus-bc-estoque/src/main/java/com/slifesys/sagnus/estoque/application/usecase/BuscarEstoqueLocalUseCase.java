package com.slifesys.sagnus.estoque.application.usecase;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BuscarEstoqueLocalUseCase {

    private final EstoqueLocalRepository estoqueLocalRepository;

    public List<EstoqueLocal> execute() {
        return estoqueLocalRepository.findAll();
    }
}

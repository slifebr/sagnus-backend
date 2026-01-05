package com.slifesys.sagnus.estoque.application.usecase;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CriarEstoqueLocalUseCase {

    private final EstoqueLocalRepository estoqueLocalRepository;

    public EstoqueLocal execute(EstoqueLocal estoqueLocal) {
        return estoqueLocalRepository.save(estoqueLocal);
    }
}

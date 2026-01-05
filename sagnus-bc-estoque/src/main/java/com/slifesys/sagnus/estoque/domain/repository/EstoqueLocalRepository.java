package com.slifesys.sagnus.estoque.domain.repository;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import java.util.List;
import java.util.Optional;

public interface EstoqueLocalRepository {
    EstoqueLocal save(EstoqueLocal estoqueLocal);
    Optional<EstoqueLocal> findById(Long id);
    List<EstoqueLocal> findAll();
}

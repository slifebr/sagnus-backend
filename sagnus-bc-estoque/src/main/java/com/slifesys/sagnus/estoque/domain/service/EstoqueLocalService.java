package com.slifesys.sagnus.estoque.domain.service;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.domain.repository.EstoqueLocalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EstoqueLocalService {

    @Autowired
    private EstoqueLocalRepository estoqueLocalRepository;

    public List<EstoqueLocal> findAll() {
        return estoqueLocalRepository.findAll();
    }

    public Optional<EstoqueLocal> findById(Long id) {
        return estoqueLocalRepository.findById(id);
    }

    public EstoqueLocal save(EstoqueLocal estoqueLocal) {
        return estoqueLocalRepository.save(estoqueLocal);
    }

    public void deleteById(Long id) {
        estoqueLocalRepository.deleteById(id);
    }
}

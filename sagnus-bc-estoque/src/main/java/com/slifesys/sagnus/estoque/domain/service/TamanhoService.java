package com.slifesys.sagnus.estoque.domain.service;

import com.slifesys.sagnus.estoque.domain.model.Tamanho;
import com.slifesys.sagnus.estoque.domain.repository.TamanhoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TamanhoService {

    @Autowired
    private TamanhoRepository tamanhoRepository;

    public List<Tamanho> findAll() {
        return tamanhoRepository.findAll();
    }

    public Optional<Tamanho> findById(Long id) {
        return tamanhoRepository.findById(id);
    }

    public Tamanho save(Tamanho tamanho) {
        return tamanhoRepository.save(tamanho);
    }

    public void deleteById(Long id) {
        tamanhoRepository.deleteById(id);
    }
}

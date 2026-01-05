package com.slifesys.sagnus.estoque.domain.service;

import com.slifesys.sagnus.estoque.domain.model.Cor;
import com.slifesys.sagnus.estoque.domain.repository.CorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CorService {

    @Autowired
    private CorRepository corRepository;

    public List<Cor> findAll() {
        return corRepository.findAll();
    }

    public Optional<Cor> findById(Long id) {
        return corRepository.findById(id);
    }

    public Cor save(Cor cor) {
        return corRepository.save(cor);
    }

    public void deleteById(Long id) {
        corRepository.deleteById(id);
    }
}

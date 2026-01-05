package com.slifesys.sagnus.estoque.domain.service;

import com.slifesys.sagnus.estoque.domain.model.Almoxarifado;
import com.slifesys.sagnus.estoque.domain.repository.AlmoxarifadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AlmoxarifadoService {

    @Autowired
    private AlmoxarifadoRepository almoxarifadoRepository;

    public List<Almoxarifado> findAll() {
        return almoxarifadoRepository.findAll();
    }

    public Optional<Almoxarifado> findById(Long id) {
        return almoxarifadoRepository.findById(id);
    }

    public Almoxarifado save(Almoxarifado almoxarifado) {
        return almoxarifadoRepository.save(almoxarifado);
    }

    public void deleteById(Long id) {
        almoxarifadoRepository.deleteById(id);
    }
}

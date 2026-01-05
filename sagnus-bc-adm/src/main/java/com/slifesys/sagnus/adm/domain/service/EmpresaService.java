
package com.slifesys.sagnus.adm.domain.service;

import org.springframework.stereotype.Service;
import com.slifesys.sagnus.adm.domain.model.Empresa;
import com.slifesys.sagnus.adm.infrastructure.repository.EmpresaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class EmpresaService {

    @Autowired
    private EmpresaRepository empresaRepository;

    public List<Empresa> findAll() {
        return empresaRepository.findAll();
    }
}

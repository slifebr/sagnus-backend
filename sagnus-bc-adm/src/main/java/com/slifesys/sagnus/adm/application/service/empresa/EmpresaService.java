package com.slifesys.sagnus.adm.application.service.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.EmpresaDTO;

import java.util.List;

public interface EmpresaService {

    List<EmpresaDTO> findAll();

    EmpresaDTO findById(Long id);

    EmpresaDTO save(EmpresaDTO empresaDTO);

    void deleteById(Long id);
}

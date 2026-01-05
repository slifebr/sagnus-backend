package com.slifesys.sagnus.adm.application.service.parametro;

import com.slifesys.sagnus.adm.application.dto.parametro.ParametroSistemaDTO;

import java.util.List;

public interface ParametroSistemaService {

    List<ParametroSistemaDTO> findAll();

    ParametroSistemaDTO findById(Long id);

    ParametroSistemaDTO save(ParametroSistemaDTO parametroSistemaDTO);

    void deleteById(Long id);
}

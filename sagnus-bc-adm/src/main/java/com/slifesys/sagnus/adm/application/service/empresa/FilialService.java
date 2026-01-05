package com.slifesys.sagnus.adm.application.service.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.FilialDTO;

import java.util.List;

public interface FilialService {

    List<FilialDTO> findAll();

    FilialDTO findById(Long id);

    FilialDTO save(FilialDTO filialDTO);

    void deleteById(Long id);
}

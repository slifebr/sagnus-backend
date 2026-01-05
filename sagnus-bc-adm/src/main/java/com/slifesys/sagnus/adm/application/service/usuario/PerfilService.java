package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PerfilDTO;

import java.util.List;

public interface PerfilService {

    List<PerfilDTO> findAll();

    PerfilDTO findById(Long id);

    PerfilDTO save(PerfilDTO perfilDTO);

    void deleteById(Long id);
}

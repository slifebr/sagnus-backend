package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PermissaoDTO;

import java.util.List;

public interface PermissaoService {

    List<PermissaoDTO> findAll();

    PermissaoDTO findById(Long id);

    PermissaoDTO save(PermissaoDTO permissaoDTO);

    void deleteById(Long id);
}

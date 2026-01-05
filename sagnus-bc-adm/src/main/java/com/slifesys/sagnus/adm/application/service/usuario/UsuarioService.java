package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.UsuarioDTO;

import java.util.List;

public interface UsuarioService {

    List<UsuarioDTO> findAll();

    UsuarioDTO findById(Long id);

    UsuarioDTO save(UsuarioDTO usuarioDTO);

    void deleteById(Long id);
}

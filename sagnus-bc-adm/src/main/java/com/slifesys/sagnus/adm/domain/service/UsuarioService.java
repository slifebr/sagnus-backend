
package com.slifesys.sagnus.adm.domain.service;

import org.springframework.stereotype.Service;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import com.slifesys.sagnus.adm.infrastructure.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> findAll() {
        return usuarioRepository.findAll();
    }
}

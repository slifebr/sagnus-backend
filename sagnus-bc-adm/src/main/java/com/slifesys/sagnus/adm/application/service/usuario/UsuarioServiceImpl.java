package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.UsuarioDTO;
import com.slifesys.sagnus.adm.application.mapper.usuario.UsuarioMapper;
import com.slifesys.sagnus.adm.application.port.UsuarioRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepository;

    private final UsuarioMapper usuarioMapper = UsuarioMapper.INSTANCE;

    @Override
    public List<UsuarioDTO> findAll() {
        return usuarioRepository.findAll().stream().map(usuarioMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public UsuarioDTO findById(Long id) {
        return usuarioRepository.findById(id).map(usuarioMapper::toDto).orElse(null);
    }

    @Override
    public UsuarioDTO save(UsuarioDTO usuarioDTO) {
        Usuario usuario = usuarioMapper.toEntity(usuarioDTO);
        return usuarioMapper.toDto(usuarioRepository.save(usuario));
    }

    @Override
    public void deleteById(Long id) {
        usuarioRepository.deleteById(id);
    }
}

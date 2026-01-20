package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PerfilDTO;
import com.slifesys.sagnus.adm.application.mapper.usuario.PerfilMapper;
import com.slifesys.sagnus.adm.application.port.PerfilRepository;
import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PerfilServiceImpl implements PerfilService {

    private final PerfilRepository perfilRepository;

    private final PerfilMapper perfilMapper = PerfilMapper.INSTANCE;

    @Override
    public List<PerfilDTO> findAll() {
        return perfilRepository.findAll().stream().map(perfilMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public PerfilDTO findById(Long id) {
        return perfilRepository.findById(id).map(perfilMapper::toDto).orElse(null);
    }

    @Override
    public PerfilDTO save(PerfilDTO perfilDTO) {
        Perfil perfil = perfilMapper.toEntity(perfilDTO);
        return perfilMapper.toDto(perfilRepository.save(perfil));
    }

    @Override
    public void deleteById(Long id) {
        perfilRepository.deleteById(id);
    }
}

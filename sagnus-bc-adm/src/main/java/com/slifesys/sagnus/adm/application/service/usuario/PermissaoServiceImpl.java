package com.slifesys.sagnus.adm.application.service.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PermissaoDTO;
import com.slifesys.sagnus.adm.application.mapper.usuario.PermissaoMapper;
import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import com.slifesys.sagnus.adm.infrastructure.repository.PermissaoRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class PermissaoServiceImpl implements PermissaoService {

    private final PermissaoRepository permissaoRepository;

    private final PermissaoMapper permissaoMapper = PermissaoMapper.INSTANCE;

    @Override
    public List<PermissaoDTO> findAll() {
        return permissaoRepository.findAll().stream().map(permissaoMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public PermissaoDTO findById(Long id) {
        return permissaoRepository.findById(id).map(permissaoMapper::toDto).orElse(null);
    }

    @Override
    public PermissaoDTO save(PermissaoDTO permissaoDTO) {
        Permissao permissao = permissaoMapper.toEntity(permissaoDTO);
        return permissaoMapper.toDto(permissaoRepository.save(permissao));
    }

    @Override
    public void deleteById(Long id) {
        permissaoRepository.deleteById(id);
    }
}

package com.slifesys.sagnus.adm.application.service.parametro;

import com.slifesys.sagnus.adm.application.dto.parametro.ParametroSistemaDTO;
import com.slifesys.sagnus.adm.application.mapper.parametro.ParametroSistemaMapper;
import com.slifesys.sagnus.adm.application.port.ParametroRepositoryPort;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
// This import is redundant if in same package, but they are in same package?
// ParametroSistemaServiceImpl is in application.service.parametro
// ParametroSistemaService is in application.service.parametro
// So I can just remove the incorrect import.
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ParametroSistemaServiceImpl implements ParametroSistemaService {

    private final ParametroRepositoryPort parametroSistemaRepository;

    private final ParametroSistemaMapper parametroSistemaMapper = ParametroSistemaMapper.INSTANCE;

    @Override
    public List<ParametroSistemaDTO> findAll() {
        return parametroSistemaRepository.findAll().stream().map(parametroSistemaMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public ParametroSistemaDTO findById(Long id) {
        return parametroSistemaRepository.findById(id).map(parametroSistemaMapper::toDto).orElse(null);
    }

    @Override
    public ParametroSistemaDTO save(ParametroSistemaDTO parametroSistemaDTO) {
        ParametroSistema parametroSistema = parametroSistemaMapper.toEntity(parametroSistemaDTO);
        return parametroSistemaMapper.toDto(parametroSistemaRepository.save(parametroSistema));
    }

    @Override
    public void deleteById(Long id) {
        parametroSistemaRepository.deleteById(id);
    }
}

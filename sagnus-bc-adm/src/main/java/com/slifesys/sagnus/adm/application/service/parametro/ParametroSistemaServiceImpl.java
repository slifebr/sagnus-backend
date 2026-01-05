package com.slifesys.sagnus.adm.application.service.parametro;

import com.slifesys.sagnus.adm.application.dto.parametro.ParametroSistemaDTO;
import com.slifesys.sagnus.adm.application.mapper.parametro.ParametroSistemaMapper;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import com.slifesys.sagnus.adm.infrastructure.repository.ParametroSistemaRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ParametroSistemaServiceImpl implements ParametroSistemaService {

    private final ParametroSistemaRepository parametroSistemaRepository;

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

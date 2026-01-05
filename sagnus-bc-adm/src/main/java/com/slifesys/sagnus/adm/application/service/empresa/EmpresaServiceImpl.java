package com.slifesys.sagnus.adm.application.service.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.EmpresaDTO;
import com.slifesys.sagnus.adm.application.mapper.empresa.EmpresaMapper;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import com.slifesys.sagnus.adm.infrastructure.repository.EmpresaRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class EmpresaServiceImpl implements EmpresaService {

    private final EmpresaRepository empresaRepository;

    private final EmpresaMapper empresaMapper = EmpresaMapper.INSTANCE;

    @Override
    public List<EmpresaDTO> findAll() {
        return empresaRepository.findAll().stream().map(empresaMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public EmpresaDTO findById(Long id) {
        return empresaRepository.findById(id).map(empresaMapper::toDto).orElse(null);
    }

    @Override
    public EmpresaDTO save(EmpresaDTO empresaDTO) {
        Empresa empresa = empresaMapper.toEntity(empresaDTO);
        return empresaMapper.toDto(empresaRepository.save(empresa));
    }

    @Override
    public void deleteById(Long id) {
        empresaRepository.deleteById(id);
    }
}

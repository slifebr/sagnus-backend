package com.slifesys.sagnus.adm.application.service.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.FilialDTO;
import com.slifesys.sagnus.adm.application.mapper.empresa.FilialMapper;
import com.slifesys.sagnus.adm.application.port.FilialRepository;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class FilialServiceImpl implements FilialService {

    private final FilialRepository filialRepository;

    private final FilialMapper filialMapper = FilialMapper.INSTANCE;

    @Override
    public List<FilialDTO> findAll() {
        return filialRepository.findAll().stream().map(filialMapper::toDto).collect(Collectors.toList());
    }

    @Override
    public FilialDTO findById(Long id) {
        return filialRepository.findById(id).map(filialMapper::toDto).orElse(null);
    }

    @Override
    public FilialDTO save(FilialDTO filialDTO) {
        Filial filial = filialMapper.toEntity(filialDTO);
        return filialMapper.toDto(filialRepository.save(filial));
    }

    @Override
    public void deleteById(Long id) {
        filialRepository.deleteById(id);
    }
}

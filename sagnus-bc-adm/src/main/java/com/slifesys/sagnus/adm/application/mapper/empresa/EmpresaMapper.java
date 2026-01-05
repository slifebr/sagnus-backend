package com.slifesys.sagnus.adm.application.mapper.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.EmpresaDTO;
import com.slifesys.sagnus.adm.domain.model.empresa.Empresa;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface EmpresaMapper {

    EmpresaMapper INSTANCE = Mappers.getMapper(EmpresaMapper.class);

    EmpresaDTO toDto(Empresa empresa);

    Empresa toEntity(EmpresaDTO empresaDTO);
}

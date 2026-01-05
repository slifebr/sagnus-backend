package com.slifesys.sagnus.adm.application.mapper.empresa;

import com.slifesys.sagnus.adm.application.dto.empresa.FilialDTO;
import com.slifesys.sagnus.adm.domain.model.empresa.Filial;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface FilialMapper {

    FilialMapper INSTANCE = Mappers.getMapper(FilialMapper.class);

    @Mapping(source = "empresa.id", target = "empresaId")
    FilialDTO toDto(Filial filial);

    @Mapping(source = "empresaId", target = "empresa.id")
    Filial toEntity(FilialDTO filialDTO);
}

package com.slifesys.sagnus.adm.application.mapper.parametro;

import com.slifesys.sagnus.adm.application.dto.parametro.ParametroSistemaDTO;
import com.slifesys.sagnus.adm.domain.model.parametro.ParametroSistema;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface ParametroSistemaMapper {

    ParametroSistemaMapper INSTANCE = Mappers.getMapper(ParametroSistemaMapper.class);

    ParametroSistemaDTO toDto(ParametroSistema parametroSistema);

    ParametroSistema toEntity(ParametroSistemaDTO parametroSistemaDTO);
}

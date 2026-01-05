package com.slifesys.sagnus.adm.application.mapper.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PerfilDTO;
import com.slifesys.sagnus.adm.domain.model.usuario.Perfil;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface PerfilMapper {

    PerfilMapper INSTANCE = Mappers.getMapper(PerfilMapper.class);

    PerfilDTO toDto(Perfil perfil);

    Perfil toEntity(PerfilDTO perfilDTO);
}

package com.slifesys.sagnus.adm.application.mapper.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.UsuarioDTO;
import com.slifesys.sagnus.adm.domain.model.usuario.Usuario;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UsuarioMapper {

    UsuarioMapper INSTANCE = Mappers.getMapper(UsuarioMapper.class);

    UsuarioDTO toDto(Usuario usuario);

    Usuario toEntity(UsuarioDTO usuarioDTO);
}

package com.slifesys.sagnus.adm.application.mapper.usuario;

import com.slifesys.sagnus.adm.application.dto.usuario.PermissaoDTO;
import com.slifesys.sagnus.adm.domain.model.usuario.Permissao;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface PermissaoMapper {

    PermissaoMapper INSTANCE = Mappers.getMapper(PermissaoMapper.class);

    PermissaoDTO toDto(Permissao permissao);

    Permissao toEntity(PermissaoDTO permissaoDTO);
}

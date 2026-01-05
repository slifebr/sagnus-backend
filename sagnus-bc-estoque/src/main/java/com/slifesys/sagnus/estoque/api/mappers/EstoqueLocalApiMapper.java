package com.slifesys.sagnus.estoque.api.mappers;

import com.slifesys.sagnus.estoque.application.dto.EstoqueLocalDTO;
import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface EstoqueLocalApiMapper {

    EstoqueLocalApiMapper INSTANCE = Mappers.getMapper(EstoqueLocalApiMapper.class);

    EstoqueLocalDTO toDto(EstoqueLocal domain);

    EstoqueLocal toDomain(EstoqueLocalDTO dto);
}

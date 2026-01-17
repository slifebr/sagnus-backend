package com.slifesys.sagnus.estoque.infrastructure.persistence.mapper;

import com.slifesys.sagnus.estoque.domain.model.EstoqueLocal;
import com.slifesys.sagnus.estoque.infrastructure.persistence.entity.EstoqueLocalEntity;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface EstoqueLocalMapper {

    EstoqueLocalMapper INSTANCE = Mappers.getMapper(EstoqueLocalMapper.class);

    EstoqueLocal toDomain(EstoqueLocalEntity entity);

    EstoqueLocalEntity toEntity(EstoqueLocal domain);
}

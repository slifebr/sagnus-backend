package com.slifesys.sagnus.api.cadastro.pessoa.mapper;

import com.slifesys.sagnus.api.cadastro.pessoa.dto.ClienteDTO;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadCliente;
import org.mapstruct.*;

@Mapper(
        componentModel = "spring",
        unmappedTargetPolicy = ReportingPolicy.IGNORE,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE
)
public interface ClienteMapper {

    // -------- ENTITY -> DTO --------
    @Mapping(target = "pessoaId", source = "pessoa.id")
    @Mapping(target = "pessoaNome", source = "pessoa.nome")
    ClienteDTO toDTO(CadCliente entity);

    // -------- DTO -> ENTITY (CREATE) --------
    // 'pessoa' será setado no service depois de buscar CadPessoa pelo pessoaId.
    @BeanMapping(ignoreByDefault = false)
    @Mapping(target = "pessoa", ignore = true)
    CadCliente toEntity(ClienteDTO dto);

    // -------- DTO -> ENTITY (UPDATE) --------
    @BeanMapping(ignoreByDefault = false)
    @Mapping(target = "pessoa", ignore = true)
    void updateEntityFromDTO(ClienteDTO dto, @MappingTarget CadCliente entity);

    // -------- CONVERSORES S/N <-> boolean (PRONTOS PRO FUTURO) --------
    default boolean snToBoolean(String valor) {
        return "S".equalsIgnoreCase(valor);
    }

    default String booleanToSn(Boolean valor) {
        return (valor != null && valor) ? "S" : "N";
    }
}

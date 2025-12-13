package com.slifesys.sagnus.api.cadastro.pessoa.mapper;


import com.slifesys.sagnus.api.cadastro.pessoa.dto.PessoaDTO;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;
import org.mapstruct.*;

@Mapper(
        componentModel = "spring",
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE,
        unmappedTargetPolicy = ReportingPolicy.IGNORE
)
public interface PessoaMapper {

    // ------------------------
    // ENTITY → DTO (S/N → boolean)
    // ------------------------
    @Mapping(target = "ehCliente", expression = "java(snToBoolean(entity.getEhCliente()))")
    @Mapping(target = "ehFornecedor", expression = "java(snToBoolean(entity.getEhFornecedor()))")
    @Mapping(target = "ehTransportadora", expression = "java(snToBoolean(entity.getEhTransportadora()))")
    @Mapping(target = "ehColaborador", expression = "java(snToBoolean(entity.getEhColaborador()))")
    @Mapping(target = "ehContador", expression = "java(snToBoolean(entity.getEhContador()))")
    @Mapping(target = "ehAtivo", expression = "java(snToBoolean(entity.getEhAtivo()))")
    PessoaDTO toDTO(CadPessoa entity);


    // ------------------------
    // DTO → ENTITY (boolean → S/N)
    // ------------------------
    @Mapping(target = "ehCliente", expression = "java(booleanToSn(dto.getEhCliente()))")
    @Mapping(target = "ehFornecedor", expression = "java(booleanToSn(dto.getEhFornecedor()))")
    @Mapping(target = "ehTransportadora", expression = "java(booleanToSn(dto.getEhTransportadora()))")
    @Mapping(target = "ehColaborador", expression = "java(booleanToSn(dto.getEhColaborador()))")
    @Mapping(target = "ehContador", expression = "java(booleanToSn(dto.getEhContador()))")
    @Mapping(target = "ehAtivo", expression = "java(booleanToSn(dto.getEhAtivo()))")
    CadPessoa toEntity(PessoaDTO dto);


    // ------------------------
    // UPDATE → copia somente campos não nulos
    // ------------------------
    @Mapping(target = "ehCliente", expression = "java(booleanToSn(dto.getEhCliente()))")
    @Mapping(target = "ehFornecedor", expression = "java(booleanToSn(dto.getEhFornecedor()))")
    @Mapping(target = "ehTransportadora", expression = "java(booleanToSn(dto.getEhTransportadora()))")
    @Mapping(target = "ehColaborador", expression = "java(booleanToSn(dto.getEhColaborador()))")
    @Mapping(target = "ehContador", expression = "java(booleanToSn(dto.getEhContador()))")
    @Mapping(target = "ehAtivo", expression = "java(booleanToSn(dto.getEhAtivo()))")
    void updateEntityFromDTO(PessoaDTO dto, @MappingTarget CadPessoa entity);

    // ------------------------
    // MÉTODOS DEFAULT (MapStruct usa automaticamente)
    // ------------------------
    default boolean snToBoolean(String valor) {
        return "S".equalsIgnoreCase(valor);
    }

    default String booleanToSn(Boolean valor) {
        return (valor != null && valor) ? "S" : "N";
    }

}

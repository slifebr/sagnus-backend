package com.slifesys.sagnus.nfe.application.mapper;

import com.slifesys.sagnus.nfe.api.dto.EmitirNfeRequest;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

/**
 * Mapper de entrada (API -> Application) para reduzir mapeamento manual.
 *
 * Obs: Mantido em application.mapper conforme a diretriz do projeto.
 */
@Mapper(componentModel = "spring")
public interface NfeCommandMapper {

    @Mapping(target = "itens", source = "itens")
    EmitirNfeCommand toCommand(EmitirNfeRequest request);

    EmitirNfeItemCommand toItemCommand(EmitirNfeRequest.Item item);

    List<EmitirNfeItemCommand> toItemCommands(List<EmitirNfeRequest.Item> itens);
}

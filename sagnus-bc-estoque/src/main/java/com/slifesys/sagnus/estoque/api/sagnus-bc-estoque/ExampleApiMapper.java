package com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque;

import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.CreateExampleRequest;
import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.CreateExampleResponse;
import com.slifesys.sagnus.sagnus-bc-estoque.application.command.CreateExampleCommand;
import com.slifesys.sagnus.sagnus-bc-estoque.application.result.CreateExampleResult;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ExampleApiMapper {

    CreateExampleCommand toCommand(CreateExampleRequest request);

    @Mapping(target = "correlationId", source = "correlationId")
    CreateExampleResponse toResponse(CreateExampleResult result, String correlationId);
}

package com.slifesys.sagnus.fina.base.api.example;

import com.slifesys.sagnus.fina.base.api.example.CreateExampleRequest;
import com.slifesys.sagnus.fina.base.api.example.CreateExampleResponse;
import com.slifesys.sagnus.fina.base.application.command.CreateExampleCommand;
import com.slifesys.sagnus.fina.base.application.result.CreateExampleResult;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ExampleApiMapper {

    CreateExampleCommand toCommand(CreateExampleRequest request);

    @Mapping(target = "correlationId", source = "correlationId")
    CreateExampleResponse toResponse(CreateExampleResult result, String correlationId);
}

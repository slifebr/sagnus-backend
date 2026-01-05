package com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque;

import com.slifesys.sagnus.shared.observability.CorrelationId;
import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.CreateExampleRequest;
import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.CreateExampleResponse;
import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.PingResponse;
import com.slifesys.sagnus.sagnus-bc-estoque.api.sagnus-bc-estoque.ExampleApiMapper;
import com.slifesys.sagnus.sagnus-bc-estoque.application.result.CreateExampleResult;
import com.slifesys.sagnus.sagnus-bc-estoque.application.usecase.CreateExampleUseCase;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;

@RestController
@RequestMapping("/v1/sagnus-bc-estoque")
@RequiredArgsConstructor
public class SagnusBcEstoqueController {

    private final CreateExampleUseCase createExampleUseCase;
    private final ExampleApiMapper mapper;

    @GetMapping("/ping")
    public PingResponse ping(HttpServletRequest request) {
        String cid = (String) request.getAttribute(CorrelationId.ATTRIBUTE);
        return new PingResponse("ok", Instant.now(), cid);
    }

    @PostMapping("/examples")
    @ResponseStatus(HttpStatus.CREATED)
    public CreateExampleResponse create(@Valid @RequestBody CreateExampleRequest req, HttpServletRequest request) {
        String cid = (String) request.getAttribute(CorrelationId.ATTRIBUTE);

        CreateExampleResult result = createExampleUseCase.execute(mapper.toCommand(req));
        return mapper.toResponse(result, cid);
    }
}

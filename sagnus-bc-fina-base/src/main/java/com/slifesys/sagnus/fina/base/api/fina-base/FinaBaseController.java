package com.slifesys.sagnus.fina.base.api.example;

import com.slifesys.sagnus.shared.observability.CorrelationId;
import com.slifesys.sagnus.fina.base.api.example.CreateExampleRequest;
import com.slifesys.sagnus.fina.base.api.example.CreateExampleResponse;
import com.slifesys.sagnus.fina.base.api.example.PingResponse;
import com.slifesys.sagnus.fina.base.api.example.ExampleApiMapper;
import com.slifesys.sagnus.fina.base.application.result.CreateExampleResult;
import com.slifesys.sagnus.fina.base.application.usecase.CreateExampleUseCase;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;

@RestController
@RequestMapping("/v1/template")
@RequiredArgsConstructor
public class FinaBaseController {

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

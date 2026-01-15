package com.slifesys.sagnus.graphql;

import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirInput;
import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirItemInput;
import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirPayload;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeCommand;
import com.slifesys.sagnus.nfe.application.result.EmitirNfeResult;
import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import lombok.RequiredArgsConstructor;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class NfeGraphqlController {

    private final EmitirNfeUseCase emitirNfeUseCase;

    // --------------------
    // Mutations (NFE)
    // --------------------

    @MutationMapping
    public NfeEmitirPayload nfeEmitir(@Argument NfeEmitirInput input) {
        EmitirNfeCommand cmd = EmitirNfeCommand.builder()
                .emitentePessoaId(input.emitentePessoaId())
                .destinatarioPessoaId(input.destinatarioPessoaId())
                .itens(input.itens().stream().map(NfeEmitirItemInput::toItemCmd).toList())
                .build();

        EmitirNfeResult r = emitirNfeUseCase.execute(cmd);
        return new NfeEmitirPayload(r.getNfeId(), r.getStatus(), r.getMensagem());
    }
}

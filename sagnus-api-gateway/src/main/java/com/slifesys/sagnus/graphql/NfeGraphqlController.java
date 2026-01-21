package com.slifesys.sagnus.graphql;

import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirInput;
import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirItemInput;
import com.slifesys.sagnus.graphql.dto.NfeTypes.NfeEmitirPayload;
import com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeRequest;
import com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeItemRequest;
import com.slifesys.sagnus.nfe.contract.emitir.EmitirNfeResponse;
import com.slifesys.sagnus.nfe.application.usecase.EmitirNfeUseCase;
import com.slifesys.sagnus.graphql.util.GraphqlUtils;
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
        EmitirNfeRequest req = EmitirNfeRequest.builder()
                .emitentePessoaId(input.emitentePessoaId())
                .destinatarioPessoaId(input.destinatarioPessoaId())
                .itens(input.itens().stream()
                        .map(it -> EmitirNfeItemRequest.builder()
                                .nItem(it.nItem())
                                .produtoId(it.produtoId())
                                .descricao(it.descricao())
                                .ncm(it.ncm())
                                .cfop(it.cfop())
                                .uCom(it.uCom())
                                .quantidade(GraphqlUtils.parseDecimal(it.quantidade()))
                                .valorUnitario(GraphqlUtils.parseDecimal(it.valorUnitario()))
                                .desconto(GraphqlUtils.parseDecimal(it.desconto()))
                                .frete(GraphqlUtils.parseDecimal(it.frete()))
                                .seguro(GraphqlUtils.parseDecimal(it.seguro()))
                                .outras(GraphqlUtils.parseDecimal(it.outras()))
                                .cstIbsCbs(it.cstIbsCbs())
                                .cClassTrib(it.cClassTrib())
                                .ibsBase(GraphqlUtils.parseDecimal(it.ibsBase()))
                                .ibsAliquota(GraphqlUtils.parseDecimal(it.ibsAliquota()))
                                .ibsValor(GraphqlUtils.parseDecimal(it.ibsValor()))
                                .cbsBase(GraphqlUtils.parseDecimal(it.cbsBase()))
                                .cbsAliquota(GraphqlUtils.parseDecimal(it.cbsAliquota()))
                                .cbsValor(GraphqlUtils.parseDecimal(it.cbsValor()))
                                .regimeIbsCbs(it.regimeIbsCbs())
                                .build())
                        .toList())
                .build();

        EmitirNfeResponse r = emitirNfeUseCase.execute(req);
        return new NfeEmitirPayload(r.getNfeId(), r.getStatus(), r.getMensagem());
    }
}
package com.slifesys.sagnus.graphql.dto;

import com.slifesys.sagnus.graphql.util.GraphqlUtils;
import com.slifesys.sagnus.nfe.application.command.EmitirNfeItemCommand;

import java.util.List;

public class NfeTypes {

    public record NfeEmitirInput(Long emitentePessoaId, Long destinatarioPessoaId, List<NfeEmitirItemInput> itens) {}

    public record NfeEmitirItemInput(
            Integer nItem,
            Long produtoId,
            String descricao,
            String ncm,
            String cfop,
            String uCom,
            String quantidade,
            String valorUnitario,
            String desconto,
            String frete,
            String seguro,
            String outras,
            String cstIbsCbs,
            String cClassTrib,
            String ibsBase,
            String ibsAliquota,
            String ibsValor,
            String cbsBase,
            String cbsAliquota,
            String cbsValor,
            String regimeIbsCbs
    ) {
        public EmitirNfeItemCommand toItemCmd() {
            return EmitirNfeItemCommand.builder()
                    .nItem(nItem)
                    .produtoId(produtoId)
                    .descricao(descricao)
                    .ncm(ncm)
                    .cfop(cfop)
                    .uCom(uCom)
                    .quantidade(GraphqlUtils.parseDecimal(quantidade))
                    .valorUnitario(GraphqlUtils.parseDecimal(valorUnitario))
                    .desconto(GraphqlUtils.parseDecimal(desconto))
                    .frete(GraphqlUtils.parseDecimal(frete))
                    .seguro(GraphqlUtils.parseDecimal(seguro))
                    .outras(GraphqlUtils.parseDecimal(outras))
                    .cstIbsCbs(cstIbsCbs)
                    .cClassTrib(cClassTrib)
                    .ibsBase(GraphqlUtils.parseDecimal(ibsBase))
                    .ibsAliquota(GraphqlUtils.parseDecimal(ibsAliquota))
                    .ibsValor(GraphqlUtils.parseDecimal(ibsValor))
                    .cbsBase(GraphqlUtils.parseDecimal(cbsBase))
                    .cbsAliquota(GraphqlUtils.parseDecimal(cbsAliquota))
                    .cbsValor(GraphqlUtils.parseDecimal(cbsValor))
                    .regimeIbsCbs(regimeIbsCbs)
                    .build();
        }
    }

    public record NfeEmitirPayload(String nfeId, String status, String mensagem) {}
}

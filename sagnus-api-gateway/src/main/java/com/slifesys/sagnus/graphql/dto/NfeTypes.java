package com.slifesys.sagnus.graphql.dto;



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
    ) {}

    public record NfeEmitirPayload(String nfeId, String status, String mensagem) {}
}

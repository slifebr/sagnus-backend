package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.mapper;

import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.ProdutoFiscal;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Quantidade;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.nfe.*;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeEntity;
import com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity.NfeItemEntity;

import java.math.BigDecimal;
import java.time.Instant;

public final class NfeJpaMapper {

    private NfeJpaMapper() {}

    public static NfeEntity toEntity(Nfe nfe) {
        Instant now = Instant.now();

        NfeEntity e = NfeEntity.builder()
                .id(nfe.getId().getValue())
                .emitentePessoaId(nfe.getEmitente().getPessoaId())
                .emitenteNome(nfe.getEmitente().getNome())
                .emitenteDocumento(nfe.getEmitente().getDocumento().getValor())
                .destinatarioPessoaId(nfe.getDestinatario().getPessoaId())
                .destinatarioNome(nfe.getDestinatario().getNome())
                .destinatarioDocumento(nfe.getDestinatario().getDocumento().getValor())
                .status(nfe.getStatus().name())
                .createdAt(nfe.getCreatedAt() != null ? nfe.getCreatedAt() : now)
                .updatedAt(now)
                .build();

        // itens
        e.clearItems();
        for (NfeItem it : nfe.getItens()) {
            e.addItem(toItemEntity(it));
        }
        return e;
    }

    private static NfeItemEntity toItemEntity(NfeItem it) {
        return NfeItemEntity.builder()
                .nItem(it.getNItem())
                .produtoId(it.getProduto().getProdutoId())
                .descricao(it.getProduto().getDescricao())
                .ncm(it.getProduto().getNcm())
                .cfop(it.getProduto().getCfop())
                .uCom(it.getProduto().getUCom())
                .quantidade(it.getQuantidade().getValor())
                .valorUnitario(it.getValorUnitario().getValor())
                .desconto(it.getDesconto().getValor())
                .frete(it.getFrete().getValor())
                .seguro(it.getSeguro().getValor())
                .outras(it.getOutras().getValor())
                .build();
    }


    public static Nfe toDomain(NfeEntity e) {
        Emitente emitente = new Emitente(
                e.getEmitentePessoaId(),
                e.getEmitenteNome(),
                DocumentoFiscal.of(e.getEmitenteDocumento())
        );

        Destinatario dest = new Destinatario(
                e.getDestinatarioPessoaId(),
                e.getDestinatarioNome(),
                DocumentoFiscal.of(e.getDestinatarioDocumento())
        );

        Nfe nfe = new Nfe(emitente, dest);

        // reatribui id/status/datas (assumindo setters ou construtor adequado)
        nfe.rehydrate(
                NfeId.of(e.getId()),
                NfeStatus.valueOf(e.getStatus()),
                e.getCreatedAt(),
                e.getUpdatedAt()
        );

        for (NfeItemEntity it : e.getItens()) {
            ProdutoFiscal produto = new ProdutoFiscal(
                    it.getProdutoId(),
                    it.getDescricao(),
                    it.getNcm(),
                    it.getCfop(),
                    it.getUCom()
            );

            NfeItem domainItem = new NfeItem(
                    it.getNItem(),
                    produto,
                    Quantidade.of(it.getQuantidade()),
                    Dinheiro.of(it.getValorUnitario()),
                    Dinheiro.of(nvl(it.getDesconto())),
                    Dinheiro.of(nvl(it.getFrete())),
                    Dinheiro.of(nvl(it.getSeguro())),
                    Dinheiro.of(nvl(it.getOutras())),
                    new TributosItem(null, null, null, null)
            );
            nfe.adicionarItem(domainItem);
        }

        return nfe;
    }

    private static BigDecimal nvl(BigDecimal v) {
        return v != null ? v : BigDecimal.ZERO;
    }
}

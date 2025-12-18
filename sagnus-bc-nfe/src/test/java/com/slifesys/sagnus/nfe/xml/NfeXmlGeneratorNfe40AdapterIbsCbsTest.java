package com.slifesys.sagnus.nfe.xml;

import com.slifesys.sagnus.nfe.domain.model.fiscal.Dinheiro;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Percentual;
import com.slifesys.sagnus.nfe.domain.model.fiscal.ProdutoFiscal;
import com.slifesys.sagnus.nfe.domain.model.fiscal.Quantidade;
import com.slifesys.sagnus.nfe.domain.model.imposto.*;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.*;
import com.slifesys.sagnus.nfe.domain.model.nfe.*;
import com.slifesys.sagnus.nfe.infrastructure.xml.NfeXmlGeneratorNfe40Adapter;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class NfeXmlGeneratorNfe40AdapterIbsCbsTest {

    @Test
    void deveGerarGrupoIBSCBSNoImpostoQuandoExistirIbsOuCbs() {
        var emit = new Emitente(1L, "Emitente Teste", DocumentoFiscal.of("12345678000195"));
        var dest = new Destinatario(2L, "Destinatario Teste", DocumentoFiscal.of("12345678000195"));

        var nfe = new Nfe(emit, dest);
        nfe.rehydrate(NfeId.of("NFeTESTE00000000000000000000000000000000000000"), NfeStatus.RASCUNHO, nfe.getCreatedAt(), nfe.getUpdatedAt());

        var produto = new ProdutoFiscal(10L, "Produto X", "12345678", "5102", "UN");

        var icms = new Icms("00", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var pis = new Pis("01", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var cofins = new Cofins("01", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));
        var ipi = new Ipi("50", Percentual.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO), Dinheiro.of(BigDecimal.ZERO));

        var ibs = new Ibs(
                new BigDecimal("100.00"),
                new BigDecimal("0.1000"),
                new BigDecimal("0.10"),
                RegimeIbsCbs.REGULAR,
                Optional.empty(),
                Optional.empty()
        );
        var cbs = new Cbs(
                new BigDecimal("100.00"),
                new BigDecimal("0.9000"),
                new BigDecimal("0.90"),
                RegimeIbsCbs.REGULAR,
                Optional.empty()
        );

        var trib = new TributosItem(
                icms, pis, cofins, ipi,
                Optional.of(ibs), Optional.of(cbs),
                Optional.of(new CstIbsCbs("000")),
                Optional.of(new CClassTrib("000000"))
        );

        var item = new NfeItem(
                1,
                produto,
                Quantidade.of(new BigDecimal("1.0000")),
                Dinheiro.of(new BigDecimal("100.00")),
                Dinheiro.of(BigDecimal.ZERO),
                Dinheiro.of(BigDecimal.ZERO),
                Dinheiro.of(BigDecimal.ZERO),
                Dinheiro.of(BigDecimal.ZERO),
                trib
        );

        nfe.adicionarItem(item);

        var adapter = new NfeXmlGeneratorNfe40Adapter();
        String xml = adapter.generateXml(nfe);

        assertTrue(xml.contains("<imposto>"), "deve conter <imposto>");
        assertTrue(xml.contains("<IBSCBS>"), "deve conter o grupo IBSCBS");
        assertTrue(xml.contains("<CST>000</CST>"), "deve conter CST");
        assertTrue(xml.contains("<cClassTrib>000000</cClassTrib>"), "deve conter cClassTrib");
        assertTrue(xml.contains("<vIBS>0.10</vIBS>"), "deve conter vIBS");
        assertTrue(xml.contains("<vCBS>0.90</vCBS>"), "deve conter vCBS");

        // vTotTrib = IBS + CBS = 1.00
        assertTrue(xml.contains("<vTotTrib>1.00</vTotTrib>"), "deve somar IBS + CBS no vTotTrib");
    }
}

package com.slifesys.sagnus.nfe.application.usecase;

import com.slifesys.sagnus.nfe.application.config.RtcIbsCbsProperties;
import com.slifesys.sagnus.nfe.application.service.RtcIbsCbsNormalizer;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;

import static org.junit.jupiter.api.Assertions.*;

class EmitirNfeUseCaseIbsCbsCalcTest {

    private static RtcIbsCbsNormalizer normalizerLenient() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
        props.setValorTolerance(new BigDecimal("0.01"));
        return new RtcIbsCbsNormalizer(props);
    }

    @Test
    void calculaValorQuandoBaseEAliquotaInformados() {
        var n = normalizerLenient();
        var t = n.normalizeTriplet("IBS", new BigDecimal("100.00"), new BigDecimal("0.1000"), null);
        assertEquals(new BigDecimal("100.00"), t.base());
        assertEquals(new BigDecimal("0.1000"), t.aliquota());
        assertEquals(new BigDecimal("0.10"), t.valor());
    }

    @Test
    void calculaBaseQuandoValorEAliquotaInformados() {
        var n = normalizerLenient();
        var t = n.normalizeTriplet("CBS", null, new BigDecimal("0.9000"), new BigDecimal("0.90"));
        assertEquals(new BigDecimal("100.00"), t.base());
        assertEquals(new BigDecimal("0.9000"), t.aliquota());
        assertEquals(new BigDecimal("0.90"), t.valor());
    }

    @Test
    void calculaAliquotaQuandoBaseEValorInformados() {
        var n = normalizerLenient();
        var t = n.normalizeTriplet("CBS", new BigDecimal("100.00"), null, new BigDecimal("0.90"));
        assertEquals(new BigDecimal("100.00"), t.base());
        assertEquals(new BigDecimal("0.9000"), t.aliquota());
        assertEquals(new BigDecimal("0.90"), t.valor());
    }

    @Test
    void exigeAoMenosDoisCampos() {
        var n = normalizerLenient();
        var ex = assertThrows(RuntimeException.class,
                () -> n.normalizeTriplet("IBS", new BigDecimal("100.00"), null, null));
        assertTrue(ex.getMessage().contains("ao menos 2"));
    }
}

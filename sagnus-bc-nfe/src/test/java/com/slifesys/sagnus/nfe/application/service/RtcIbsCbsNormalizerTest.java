package com.slifesys.sagnus.nfe.application.service;

import com.slifesys.sagnus.nfe.application.config.RtcIbsCbsProperties;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Ibs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.RegimeIbsCbs;
import org.junit.jupiter.api.Test;

import java.math.BigDecimal;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;

class RtcIbsCbsNormalizerTest {

    @Test
    void lenient_defaults_cst_and_cclass_when_missing() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
        props.setDefaultCst("000");
        props.setDefaultCClassTrib("410031");

        RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

        TributosItem trib = new TributosItem(
                null, null, null, null,
                Optional.of(new Ibs(new BigDecimal("100.00"), new BigDecimal("1.0000"), new BigDecimal("1.00"), RegimeIbsCbs.REGULAR, Optional.empty(), Optional.empty())),
                Optional.empty(),
                Optional.empty(),
                Optional.empty()
        );

        TributosItem out = normalizer.normalize(trib);

        assertTrue(out.getCstIbsCbs().isPresent());
        assertEquals("000", out.getCstIbsCbs().get().getValor());
        assertTrue(out.getCClassTrib().isPresent());
        assertEquals("410031", out.getCClassTrib().get().getValor());
    }

    @Test
    void strict_throws_when_missing_cst_or_cclass() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.STRICT);

        RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

        TributosItem trib = new TributosItem(
                null, null, null, null,
                Optional.of(new Ibs(new BigDecimal("100.00"), new BigDecimal("1.0000"), new BigDecimal("1.00"), RegimeIbsCbs.REGULAR, Optional.empty(), Optional.empty())),
                Optional.empty(),
                Optional.empty(),
                Optional.empty()
        );

        assertThrows(NfeDomainException.class, () -> normalizer.normalize(trib));
    }

    @Test
    void lenient_reconciles_when_all_three_inconsistent() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
        props.setValorTolerance(new BigDecimal("0.01"));

        RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

        // base=100, aliquota=1% => valor esperado = 1.00, mas informado 1.20
        var t = normalizer.normalizeTriplet("IBS", new BigDecimal("100.00"), new BigDecimal("1.0000"), new BigDecimal("1.20"));
        assertEquals(new BigDecimal("100.00"), t.base());
        assertEquals(new BigDecimal("1.0000"), t.aliquota());
        assertEquals(new BigDecimal("1.00"), t.valor(), "LENIENT deve ajustar valor para o calculado");
    }

    @Test
    void strict_throws_when_all_three_inconsistent_above_tolerance() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.STRICT);
        props.setValorTolerance(new BigDecimal("0.01"));

        RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

        assertThrows(NfeDomainException.class,
                () -> normalizer.normalizeTriplet("CBS", new BigDecimal("100.00"), new BigDecimal("0.9000"), new BigDecimal("1.50")));
    }

    @Test
    void accepts_when_difference_within_tolerance() {
        RtcIbsCbsProperties props = new RtcIbsCbsProperties();
        props.setValidation(RtcIbsCbsProperties.ValidationMode.STRICT);
        props.setValorTolerance(new BigDecimal("0.01"));

        RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

        // Esperado 1.00, informado 1.01 => dif=0.01, dentro da tolerância
        var t = normalizer.normalizeTriplet("IBS", new BigDecimal("100.00"), new BigDecimal("1.0000"), new BigDecimal("1.01"));
        assertEquals(new BigDecimal("1.01"), t.valor());
    }

@Test
void lenient_reconcile_base_valor_adjusts_aliquota_when_inconsistent() {
    RtcIbsCbsProperties props = new RtcIbsCbsProperties();
    props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
    props.setValorTolerance(new BigDecimal("0.01"));
    props.setReconcileStrategy(RtcIbsCbsProperties.ReconcileStrategy.BASE_VALOR);

    RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

    // base=100, valor=1.00 => aliquota esperada 1.0000
    var t = normalizer.normalizeTriplet("CBS", new BigDecimal("100.00"), new BigDecimal("0.9000"), new BigDecimal("1.00"));
    assertEquals(new BigDecimal("100.00"), t.base());
    assertEquals(new BigDecimal("1.0000"), t.aliquota());
    assertEquals(new BigDecimal("1.00"), t.valor());
}

@Test
void lenient_reconcile_aliquota_valor_adjusts_base_when_inconsistent() {
    RtcIbsCbsProperties props = new RtcIbsCbsProperties();
    props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
    props.setValorTolerance(new BigDecimal("0.01"));
    props.setReconcileStrategy(RtcIbsCbsProperties.ReconcileStrategy.ALIQUOTA_VALOR);

    RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

    // aliquota=1.0000, valor=1.00 => base esperada 100.00
    var t = normalizer.normalizeTriplet("IBS", new BigDecimal("90.00"), new BigDecimal("1.0000"), new BigDecimal("1.00"));
    assertEquals(new BigDecimal("100.00"), t.base());
    assertEquals(new BigDecimal("1.0000"), t.aliquota());
    assertEquals(new BigDecimal("1.00"), t.valor());
}

@Test
void auto_min_adjust_prefers_smallest_relative_change() {
    RtcIbsCbsProperties props = new RtcIbsCbsProperties();
    props.setValidation(RtcIbsCbsProperties.ValidationMode.LENIENT);
    props.setValorTolerance(new BigDecimal("0.01"));
    props.setReconcileStrategy(RtcIbsCbsProperties.ReconcileStrategy.AUTO_MIN_ADJUST);

    RtcIbsCbsNormalizer normalizer = new RtcIbsCbsNormalizer(props);

    // base=100, aliquota=1.0000 => valor esperado 1.00, informado 0.95 (dif 0.05 > tol)
    // Ajustar aliquota (para 0.9500) é o menor ajuste relativo vs ajustar valor/base.
    var t = normalizer.normalizeTriplet("IBS", new BigDecimal("100.00"), new BigDecimal("1.0000"), new BigDecimal("0.95"));
    assertEquals(new BigDecimal("100.00"), t.base());
    assertEquals(new BigDecimal("0.9500"), t.aliquota());
    assertEquals(new BigDecimal("0.95"), t.valor());
}
}

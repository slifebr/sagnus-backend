package com.slifesys.sagnus.nfe.application.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.math.BigDecimal;

/**
 * Configurações do RTC (Reforma Tributária do Consumo) aplicadas ao módulo de NFe.
 *
 * Propriedades:
 * - sagnus.nfe.rtc.validation: LENIENT (default) | STRICT
 * - sagnus.nfe.rtc.defaultCst: CST IBS/CBS default em modo LENIENT
 * - sagnus.nfe.rtc.defaultCClassTrib: cClassTrib default em modo LENIENT
 * - sagnus.nfe.rtc.valorTolerance: tolerância (em R$) para divergência entre (base*aliquota/100) e valor informado
 * - sagnus.nfe.rtc.reconcileStrategy: BASE_ALIQUOTA | BASE_VALOR | ALIQUOTA_VALOR | AUTO_MIN_ADJUST (default)
 */
@ConfigurationProperties(prefix = "sagnus.nfe.rtc")
public class RtcIbsCbsProperties {

    public enum ValidationMode {
        /**
         * Se IBS/CBS existir e CST/cClassTrib não vierem, aplica defaults.
         * Se base/aliquota/valor divergirem acima da tolerância, recalcula (ajusta) valor.
         */
        LENIENT,
        /**
         * Se IBS/CBS existir e CST/cClassTrib não vierem, lança erro.
         * Se base/aliquota/valor divergirem acima da tolerância, lança erro.
         */
        STRICT
    }

    /**
     * Estratégia de reconciliação quando base, alíquota e valor são informados,
     * mas não fecham dentro da tolerância (apenas em LENIENT).
     */
    public enum ReconcileStrategy {
        /** Mantém BASE+ALIQUOTA e ajusta VALOR (padrão clássico). */
        BASE_ALIQUOTA,
        /** Mantém BASE+VALOR e ajusta ALIQUOTA. */
        BASE_VALOR,
        /** Mantém ALIQUOTA+VALOR e ajusta BASE. */
        ALIQUOTA_VALOR,
        /**
         * Escolhe automaticamente qual campo ajustar (base/aliquota/valor) usando o menor ajuste relativo
         * entre as 3 alternativas.
         */
        AUTO_MIN_ADJUST
    }


    private ValidationMode validation = ValidationMode.LENIENT;

    /** Estratégia de reconciliação para inconsistências base/aliquota/valor (apenas em LENIENT). */
    private ReconcileStrategy reconcileStrategy = ReconcileStrategy.AUTO_MIN_ADJUST;

    /** Default CST IBS/CBS quando não informado (apenas em LENIENT). */
    private String defaultCst = "000";

    /** Default cClassTrib quando não informado (apenas em LENIENT). */
    private String defaultCClassTrib = "000000";

    /** Tolerância (em moeda) para divergência do valor calculado. Default: 0.01 (1 centavo). */
    private BigDecimal valorTolerance = new BigDecimal("0.01");

    public ValidationMode getValidation() {
        return validation;
    }

    public void setValidation(ValidationMode validation) {
        this.validation = validation;
    }

    

    public ReconcileStrategy getReconcileStrategy() {
        return reconcileStrategy;
    }

    public void setReconcileStrategy(ReconcileStrategy reconcileStrategy) {
        this.reconcileStrategy = reconcileStrategy;
    }
public String getDefaultCst() {
        return defaultCst;
    }

    public void setDefaultCst(String defaultCst) {
        this.defaultCst = defaultCst;
    }

    public String getDefaultCClassTrib() {
        return defaultCClassTrib;
    }

    public void setDefaultCClassTrib(String defaultCClassTrib) {
        this.defaultCClassTrib = defaultCClassTrib;
    }

    public BigDecimal getValorTolerance() {
        return valorTolerance;
    }

    public void setValorTolerance(BigDecimal valorTolerance) {
        this.valorTolerance = valorTolerance;
    }
}

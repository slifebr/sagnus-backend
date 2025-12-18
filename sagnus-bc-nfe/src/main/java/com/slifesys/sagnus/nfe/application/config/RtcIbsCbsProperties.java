package com.slifesys.sagnus.nfe.application.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * Configurações do RTC (Reforma Tributária do Consumo) aplicadas ao módulo de NFe.
 *
 * Propriedades:
 * - sagnus.nfe.rtc.validation: LENIENT (default) | STRICT
 * - sagnus.nfe.rtc.defaultCst: CST IBS/CBS default em modo LENIENT
 * - sagnus.nfe.rtc.defaultCClassTrib: cClassTrib default em modo LENIENT
 */
@ConfigurationProperties(prefix = "sagnus.nfe.rtc")
public class RtcIbsCbsProperties {

    public enum ValidationMode {
        /**
         * Se IBS/CBS existir e CST/cClassTrib não vierem, aplica defaults.
         */
        LENIENT,
        /**
         * Se IBS/CBS existir e CST/cClassTrib não vierem, lança erro.
         */
        STRICT
    }

    private ValidationMode validation = ValidationMode.LENIENT;

    /** Default CST IBS/CBS quando não informado (apenas em LENIENT). */
    private String defaultCst = "000";

    /** Default cClassTrib quando não informado (apenas em LENIENT). */
    private String defaultCClassTrib = "000000";

    public ValidationMode getValidation() {
        return validation;
    }

    public void setValidation(ValidationMode validation) {
        this.validation = validation;
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
}

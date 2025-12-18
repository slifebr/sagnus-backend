package com.slifesys.sagnus.nfe.domain.event;

import java.math.BigDecimal;
import java.util.Objects;

/**
 * Evento disparado quando o normalizador RTC reconcilia (ajusta) um triplete IBS/CBS
 * (base, alíquota, valor) em modo LENIENT, por divergência acima da tolerância.
 *
 * Útil para auditoria/observabilidade e futura persistência via Outbox.
 */
public class RtcIbsCbsReconciledEvent extends AbstractDomainEvent implements CorrelatedDomainEvent {

    private final String correlationId;

    private final String label;
    private final String configuredStrategy;
    private final String resolvedStrategy;

    private final BigDecimal baseBefore;
    private final BigDecimal aliquotaBefore;
    private final BigDecimal valorBefore;

    private final BigDecimal baseAfter;
    private final BigDecimal aliquotaAfter;
    private final BigDecimal valorAfter;

    private final BigDecimal expectedValorFromBaseAliquota;
    private final BigDecimal diff;
    private final BigDecimal tolerance;

    public RtcIbsCbsReconciledEvent(
            String correlationId,
            String label,
            String configuredStrategy,
            String resolvedStrategy,
            BigDecimal baseBefore,
            BigDecimal aliquotaBefore,
            BigDecimal valorBefore,
            BigDecimal baseAfter,
            BigDecimal aliquotaAfter,
            BigDecimal valorAfter,
            BigDecimal expectedValorFromBaseAliquota,
            BigDecimal diff,
            BigDecimal tolerance
    ) {
        super();
        this.correlationId = correlationId;
        this.label = Objects.requireNonNull(label, "label");
        this.configuredStrategy = Objects.requireNonNull(configuredStrategy, "configuredStrategy");
        this.resolvedStrategy = Objects.requireNonNull(resolvedStrategy, "resolvedStrategy");
        this.baseBefore = baseBefore;
        this.aliquotaBefore = aliquotaBefore;
        this.valorBefore = valorBefore;
        this.baseAfter = baseAfter;
        this.aliquotaAfter = aliquotaAfter;
        this.valorAfter = valorAfter;
        this.expectedValorFromBaseAliquota = expectedValorFromBaseAliquota;
        this.diff = diff;
        this.tolerance = tolerance;
    }

    public String getLabel() {
        return label;
    }

    @Override
    public String getCorrelationId() {
        return correlationId;
    }

    public String getConfiguredStrategy() {
        return configuredStrategy;
    }

    public String getResolvedStrategy() {
        return resolvedStrategy;
    }

    public BigDecimal getBaseBefore() {
        return baseBefore;
    }

    public BigDecimal getAliquotaBefore() {
        return aliquotaBefore;
    }

    public BigDecimal getValorBefore() {
        return valorBefore;
    }

    public BigDecimal getBaseAfter() {
        return baseAfter;
    }

    public BigDecimal getAliquotaAfter() {
        return aliquotaAfter;
    }

    public BigDecimal getValorAfter() {
        return valorAfter;
    }

    public BigDecimal getExpectedValorFromBaseAliquota() {
        return expectedValorFromBaseAliquota;
    }

    public BigDecimal getDiff() {
        return diff;
    }

    public BigDecimal getTolerance() {
        return tolerance;
    }
}

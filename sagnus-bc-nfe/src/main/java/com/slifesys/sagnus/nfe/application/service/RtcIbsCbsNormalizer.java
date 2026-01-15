package com.slifesys.sagnus.nfe.application.service;

import com.slifesys.sagnus.nfe.application.config.RtcIbsCbsProperties;
import com.slifesys.sagnus.shared.observability.CorrelationIdContext;
import com.slifesys.sagnus.nfe.application.port.DomainEventPublisher;
import com.slifesys.sagnus.nfe.domain.exception.NfeDomainException;
import com.slifesys.sagnus.nfe.domain.event.RtcIbsCbsReconciledEvent;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CClassTrib;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CstIbsCbs;
import com.slifesys.sagnus.nfe.domain.service.CalculadoraIvaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Optional;

/**
 * Normaliza/valida os campos RTC (IBS/CBS) de um item.
 *
 * Regras:
 * - Se IBS ou CBS estiver presente:
 * - cstIbsCbs e cClassTrib devem existir (STRICT) ou serão defaultados
 * (LENIENT).
 * - Para IBS/CBS (base, aliquota, valor):
 * - exige ao menos 2 dos 3;
 * - calcula o terceiro automaticamente;
 * - se os 3 forem informados e divergirem acima da tolerância:
 * - STRICT: erro
 * - LENIENT: ajusta valor para o calculado (base+aliquota são a referência).
 */
@Slf4j
@Service
public class RtcIbsCbsNormalizer {

    private final RtcIbsCbsProperties props;
    private final DomainEventPublisher eventPublisher;
    private final CalculadoraIvaService calculadoraIva;

    @Autowired
    public RtcIbsCbsNormalizer(RtcIbsCbsProperties props, DomainEventPublisher eventPublisher) {
        this.props = props;
        this.eventPublisher = eventPublisher != null ? eventPublisher : event -> {
        };
        this.calculadoraIva = new CalculadoraIvaService();
    }

    /** Construtor auxiliar para testes unitários (usa publisher NO-OP). */
    public RtcIbsCbsNormalizer(RtcIbsCbsProperties props) {
        this(props, event -> {
        });
    }

    /** Construtor para testes com CalculadoraIvaService injetado. */
    public RtcIbsCbsNormalizer(RtcIbsCbsProperties props, DomainEventPublisher eventPublisher,
            CalculadoraIvaService calculadoraIva) {
        this.props = props;
        this.eventPublisher = eventPublisher != null ? eventPublisher : event -> {
        };
        this.calculadoraIva = calculadoraIva != null ? calculadoraIva : new CalculadoraIvaService();
    }

    /** Tripla normalizada (base, alíquota, valor). */
    public record TaxTriplet(BigDecimal base, BigDecimal aliquota, BigDecimal valor) {
    }

    public TaxTriplet normalizeTriplet(String label, BigDecimal base, BigDecimal aliquota, BigDecimal valor) {
        int count = (base != null ? 1 : 0) + (aliquota != null ? 1 : 0) + (valor != null ? 1 : 0);
        if (count < 2) {
            throw new NfeDomainException("RTC " + label + ": informe ao menos 2 entre base, aliquota e valor");
        }

        if (base != null && base.signum() < 0)
            throw new NfeDomainException("RTC " + label + ": base não pode ser negativa");
        if (aliquota != null && aliquota.signum() < 0)
            throw new NfeDomainException("RTC " + label + ": aliquota não pode ser negativa");
        if (valor != null && valor.signum() < 0)
            throw new NfeDomainException("RTC " + label + ": valor não pode ser negativo");

        // completa o que faltar usando CalculadoraIvaService
        if (valor == null) {
            if (base == null || aliquota == null) {
                throw new NfeDomainException("RTC " + label + ": para calcular valor, informe base e aliquota");
            }
            valor = calculadoraIva.calcularValor(base, aliquota);
        } else if (base == null) {
            if (aliquota == null)
                throw new NfeDomainException("RTC " + label + ": para calcular base, informe aliquota");
            if (aliquota.signum() == 0) {
                if (valor.signum() != 0)
                    throw new NfeDomainException("RTC " + label + ": aliquota 0 com valor > 0 é inconsistente");
                base = BigDecimal.ZERO;
            } else {
                base = calculadoraIva.calcularBase(valor, aliquota);
            }
        } else if (aliquota == null) {
            if (base.signum() == 0) {
                if (valor.signum() != 0)
                    throw new NfeDomainException("RTC " + label + ": base 0 com valor > 0 é inconsistente");
                aliquota = BigDecimal.ZERO;
            } else {
                aliquota = calculadoraIva.calcularAliquota(valor, base);
            }
        }

        // normaliza escalas usando CalculadoraIvaService
        CalculadoraIvaService.TriplaNormalizada tripla = calculadoraIva.normalizarTripla(base, aliquota, valor);
        base = tripla.base();
        aliquota = tripla.aliquota();
        valor = tripla.valor();

        // reconciliação: se os 3 foram informados, checa divergência
        if (count == 3) {
            // snapshot (já normalizado em escala) dos valores informados
            BigDecimal base0 = base;
            BigDecimal aliquota0 = aliquota;
            BigDecimal valor0 = valor;

            BigDecimal expected = calculadoraIva.calcularValor(base, aliquota);
            BigDecimal diff = expected.subtract(valor).abs();
            BigDecimal tol = props.getValorTolerance() == null ? new BigDecimal("0.01") : props.getValorTolerance();

            if (diff.compareTo(tol) > 0) {
                if (props.getValidation() == RtcIbsCbsProperties.ValidationMode.STRICT) {
                    throw new NfeDomainException(
                            "RTC " + label + ": divergência acima da tolerância. " +
                                    "Informado=" + valor + ", Calculado=" + expected + ", Dif=" + diff + ", Tol="
                                    + tol);
                }

                // LENIENT: reconcilia conforme estratégia configurada
                RtcIbsCbsProperties.ReconcileStrategy configured = props.getReconcileStrategy() == null
                        ? RtcIbsCbsProperties.ReconcileStrategy.AUTO_MIN_ADJUST
                        : props.getReconcileStrategy();

                RtcIbsCbsProperties.ReconcileStrategy resolved = resolveStrategy(configured, base, aliquota, valor,
                        expected);

                switch (resolved) {
                    case BASE_ALIQUOTA -> {
                        // Mantém base+aliquota, ajusta valor
                        valor = expected;
                    }
                    case BASE_VALOR -> {
                        // Mantém base+valor, ajusta aliquota
                        aliquota = calculadoraIva.calcularAliquota(valor, base);
                    }
                    case ALIQUOTA_VALOR -> {
                        // Mantém aliquota+valor, ajusta base
                        base = calculadoraIva.calcularBase(valor, aliquota);
                    }
                    case AUTO_MIN_ADJUST -> {
                        // resolveStrategy retorna sempre uma das 3 acima; aqui é apenas segurança
                        valor = expected;
                    }
                }

                // normaliza escalas após ajuste usando CalculadoraIvaService
                CalculadoraIvaService.TriplaNormalizada triplaAjustada = calculadoraIva.normalizarTripla(base, aliquota,
                        valor);
                base = triplaAjustada.base();
                aliquota = triplaAjustada.aliquota();
                valor = triplaAjustada.valor();

                log.warn(
                        "RTC reconciliação {} configured={} resolved={} base={} aliq={} valor={} expected={} diff={} tol={} -> base={} aliq={} valor={}",
                        label, configured, resolved, base0, aliquota0, valor0, expected, diff, tol, base, aliquota,
                        valor);

                String cid = CorrelationIdContext.get();
                eventPublisher.publish(new RtcIbsCbsReconciledEvent(
                        label,
                        configured.name(),
                        resolved.name(),
                        base0, aliquota0, valor0,
                        base, aliquota, valor,
                        expected, diff, tol));
            }
        }

        return new TaxTriplet(base, aliquota, valor);
    }

    private RtcIbsCbsProperties.ReconcileStrategy resolveStrategy(
            RtcIbsCbsProperties.ReconcileStrategy strategy,
            BigDecimal base,
            BigDecimal aliquota,
            BigDecimal valor,
            BigDecimal expectedValor) {
        if (strategy != RtcIbsCbsProperties.ReconcileStrategy.AUTO_MIN_ADJUST) {
            return strategy;
        }

        // Candidatos: ajustar (valor) OU (aliquota) OU (base)
        BigDecimal expectedAliquota = calculadoraIva.calcularAliquota(valor, base);
        BigDecimal expectedBase = calculadoraIva.calcularBase(valor, aliquota);

        BigDecimal relValor = relDiff(expectedValor, valor, new BigDecimal("0.01"));
        BigDecimal relAliq = relDiff(expectedAliquota, aliquota, new BigDecimal("0.0001"));
        BigDecimal relBase = relDiff(expectedBase, base, new BigDecimal("0.01"));

        // Menor ajuste relativo vence; em empate, preferimos BASE_ALIQUOTA
        BigDecimal min = relValor.min(relAliq).min(relBase);
        if (relValor.compareTo(min) == 0)
            return RtcIbsCbsProperties.ReconcileStrategy.BASE_ALIQUOTA;
        if (relAliq.compareTo(min) == 0)
            return RtcIbsCbsProperties.ReconcileStrategy.BASE_VALOR;
        return RtcIbsCbsProperties.ReconcileStrategy.ALIQUOTA_VALOR;
    }

    private static BigDecimal relDiff(BigDecimal expected, BigDecimal actual, BigDecimal epsilon) {
        BigDecimal denom = actual.abs();
        if (denom.compareTo(epsilon) < 0)
            denom = epsilon;
        return expected.subtract(actual).abs().divide(denom, 6, RoundingMode.HALF_UP);
    }

    public TributosItem normalize(TributosItem tributos) {
        if (tributos == null)
            return null;

        boolean hasIbs = tributos.getIbs() != null && tributos.getIbs().isPresent();
        boolean hasCbs = tributos.getCbs() != null && tributos.getCbs().isPresent();

        if (!hasIbs && !hasCbs) {
            return tributos;
        }

        Optional<CstIbsCbs> cst = tributos.getCstIbsCbs();
        Optional<CClassTrib> cClassTrib = tributos.getCClassTrib();

        if (cst.isPresent() && cClassTrib.isPresent()) {
            return tributos;
        }

        if (props.getValidation() == RtcIbsCbsProperties.ValidationMode.STRICT) {
            throw new NfeDomainException(
                    "RTC IBS/CBS: quando IBS/CBS está presente, CST e cClassTrib são obrigatórios");
        }

        // LENIENT: aplica defaults
        CstIbsCbs cstDefault = cst.orElseGet(() -> new CstIbsCbs(props.getDefaultCst()));
        CClassTrib cClassDefault = cClassTrib.orElseGet(() -> new CClassTrib(props.getDefaultCClassTrib()));

        return new TributosItem(
                tributos.getIcms(),
                tributos.getPis(),
                tributos.getCofins(),
                tributos.getIpi(),
                tributos.getIbs(),
                tributos.getCbs(),
                Optional.of(cstDefault),
                Optional.of(cClassDefault));
    }
}

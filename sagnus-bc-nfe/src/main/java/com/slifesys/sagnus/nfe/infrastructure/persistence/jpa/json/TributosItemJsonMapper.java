package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.json;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.slifesys.sagnus.nfe.domain.model.imposto.TributosItem;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CClassTrib;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Cbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.CstIbsCbs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.Ibs;
import com.slifesys.sagnus.nfe.domain.model.imposto.ibscbs.RegimeIbsCbs;

import java.math.BigDecimal;
import java.util.Optional;

/**
 * Serializa/deserializa os tributos do item para um JSON textual (coluna text/jsonb).
 *
 * MVP: persiste IBS/CBS + CST + cClassTrib.
 * - Mantém compatibilidade para evoluir sem precisar alterar schema.
 */
public final class TributosItemJsonMapper {

    private TributosItemJsonMapper() {}

    private static final ObjectMapper MAPPER = new ObjectMapper()
            .registerModule(new Jdk8Module())
            .registerModule(new JavaTimeModule())
            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false)
            .setSerializationInclusion(JsonInclude.Include.NON_NULL);

    public static String toJson(TributosItem trib) {
        if (trib == null) return null;

        TributacaoJson dto = TributacaoJson.from(trib);
        try {
            return MAPPER.writeValueAsString(dto);
        } catch (JsonProcessingException e) {
            throw new IllegalStateException("Falha ao serializar tributos JSON", e);
        }
    }

    public static TributosItem fromJson(String json) {
        if (json == null || json.isBlank()) {
            return new TributosItem(null, null, null, null);
        }
        try {
            TributacaoJson dto = MAPPER.readValue(json, TributacaoJson.class);
            return dto.toTributosItem();
        } catch (Exception e) {
            // se quebrar, preferimos não travar rehidratação inteira
            return new TributosItem(null, null, null, null);
        }
    }

    /**
     * DTO interno (persistência). Sem Optional para simplificar compatibilidade.
     */
    public record TributacaoJson(
            String schema, // "RTC-IBSCBS-V1"
            String cstIbsCbs,
            String cClassTrib,
            String regimeIbsCbs,

            BigDecimal ibsBase,
            BigDecimal ibsAliquota,
            BigDecimal ibsValor,

            BigDecimal cbsBase,
            BigDecimal cbsAliquota,
            BigDecimal cbsValor
    ) {
        public static TributacaoJson from(TributosItem trib) {
            String cst = trib.getCstIbsCbs().map(CstIbsCbs::getValor).orElse(null);
            String cClass = trib.getCClassTrib().map(CClassTrib::getValor).orElse(null);

            String regime = null;
            BigDecimal ibsBase = null, ibsAliq = null, ibsVal = null;
            BigDecimal cbsBase = null, cbsAliq = null, cbsVal = null;

            if (trib.getIbs() != null && trib.getIbs().isPresent()) {
                Ibs ibs = trib.getIbs().get();
                ibsBase = ibs.base();
                ibsAliq = ibs.aliquota();
                ibsVal  = ibs.valor();
                regime  = ibs.regime().name();
            }

            if (trib.getCbs() != null && trib.getCbs().isPresent()) {
                Cbs cbs = trib.getCbs().get();
                cbsBase = cbs.base();
                cbsAliq = cbs.aliquota();
                cbsVal  = cbs.valor();
                if (regime == null) {
                    regime = cbs.regime().name();
                }
            }

            return new TributacaoJson(
                    "RTC-IBSCBS-V1",
                    cst,
                    cClass,
                    regime,
                    ibsBase,
                    ibsAliq,
                    ibsVal,
                    cbsBase,
                    cbsAliq,
                    cbsVal
            );
        }

        public TributosItem toTributosItem() {
            Optional<CstIbsCbs> cst = (cstIbsCbs != null && !cstIbsCbs.isBlank())
                    ? Optional.of(new CstIbsCbs(cstIbsCbs.trim()))
                    : Optional.empty();

            Optional<CClassTrib> cClass = (cClassTrib != null && !cClassTrib.isBlank())
                    ? Optional.of(new CClassTrib(cClassTrib.trim()))
                    : Optional.empty();

            RegimeIbsCbs regime = RegimeIbsCbs.REGULAR;
            if (regimeIbsCbs != null && !regimeIbsCbs.isBlank()) {
                try {
                    regime = RegimeIbsCbs.valueOf(regimeIbsCbs.trim().toUpperCase());
                } catch (Exception ignored) {
                    regime = RegimeIbsCbs.REGULAR;
                }
            }

            Optional<Ibs> ibs = Optional.empty();
            if (ibsBase != null && ibsAliquota != null && ibsValor != null) {
                ibs = Optional.of(new Ibs(ibsBase, ibsAliquota, ibsValor, regime, Optional.empty(), Optional.empty()));
            }

            Optional<Cbs> cbs = Optional.empty();
            if (cbsBase != null && cbsAliquota != null && cbsValor != null) {
                cbs = Optional.of(new Cbs(cbsBase, cbsAliquota, cbsValor, regime, Optional.empty()));
            }

            return new TributosItem(
                    null, null, null, null,
                    ibs,
                    cbs,
                    cst,
                    cClass
            );
        }
    }
}

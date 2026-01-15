package com.slifesys.sagnus.graphql.util;

import com.slifesys.sagnus.graphql.dto.PageInput;
import com.slifesys.sagnus.shared.paging.PageDirection;
import com.slifesys.sagnus.shared.paging.PageRequest;

import java.math.BigDecimal;

public class GraphqlUtils {

    private GraphqlUtils() {}

    public static PageRequest toPageRequest(PageInput page, String defaultSortBy) {
        PageInput p = page != null ? page : new PageInput(0, 20, defaultSortBy, "ASC");
        PageDirection dir = "DESC".equalsIgnoreCase(p.sortDir()) ? PageDirection.DESC : PageDirection.ASC;
        String sortBy = (p.sortBy() == null || p.sortBy().isBlank()) ? defaultSortBy : p.sortBy();
        return PageRequest.of(p.page(), p.size(), sortBy, dir);
    }

    public static BigDecimal parseDecimal(String value) {
        if (value == null || value.isBlank()) return null;
        String raw = value.trim();

        // Casos comuns:
        // - "1234.56" (ponto decimal)
        // - "1234,56" (vírgula decimal)
        // - "1.234,56" (milhar com ponto e decimal com vírgula)
        // - "1,234.56" (milhar com vírgula e decimal com ponto)

        boolean hasDot = raw.contains(".");
        boolean hasComma = raw.contains(",");

        String normalized;
        if (hasDot && hasComma) {
            // Decide o separador decimal pelo último caractere entre '.' e ','
            int lastDot = raw.lastIndexOf('.');
            int lastComma = raw.lastIndexOf(',');
            if (lastComma > lastDot) {
                // decimal = ',' => remove milhares '.'
                normalized = raw.replace(".", "").replace(",", ".");
            } else {
                // decimal = '.' => remove milhares ','
                normalized = raw.replace(",", "");
            }
        } else if (hasComma) {
            normalized = raw.replace(",", ".");
        } else {
            normalized = raw;
        }

        return new BigDecimal(normalized);
    }
}


package com.slifesys.sagnus.corp.domain.model.produto;


import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Value;

@Value
public class Nome {
    String value;

    public static Nome of(String raw) {
        if (raw == null || raw.isBlank()) {
            throw new BusinessException("CORP-011", "Nome do produto é obrigatório.");
        }
        String v = raw.trim();
        if (v.length() < 2) {
            throw new BusinessException("CORP-012", "Nome de produto muito curto.");
        }
        return new Nome(v);
    }
}

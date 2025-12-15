package com.slifesys.sagnus.corp.domain.model.pessoa;

import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Value;

@Value
public class Nome {
    String value;

    public static Nome of(String raw) {
        if (raw == null || raw.isBlank()) {
            throw new BusinessException("CORP-011", "Nome/Razão Social é obrigatório.");
        }
        String v = raw.trim();
        if (v.length() < 2) {
            throw new BusinessException("CORP-012", "Nome muito curto.");
        }
        return new Nome(v);
    }
}

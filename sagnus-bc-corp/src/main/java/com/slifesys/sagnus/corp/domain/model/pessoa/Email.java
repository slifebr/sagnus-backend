package com.slifesys.sagnus.corp.domain.model.pessoa;

import com.slifesys.sagnus.shared.error.BusinessException;
import lombok.Value;

@Value
public class Email {
    String value;

    public static Email of(String raw) {
        if (raw == null || raw.isBlank()) return null;
        String v = raw.trim().toLowerCase();
        if (!v.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            throw new BusinessException("CORP-010", "E-mail inválido.");
        }
        return new Email(v);
    }
}

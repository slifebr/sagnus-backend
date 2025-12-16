package com.slifesys.sagnus.nfe.domain.model.nfe;

import java.util.UUID;

public final class NfeId {

    private final String value;

    private NfeId(String value) {
        this.value = value;
    }

    public static NfeId novo() {
        return new NfeId(UUID.randomUUID().toString());
    }

    public String getValue() {
        return value;
    }
}

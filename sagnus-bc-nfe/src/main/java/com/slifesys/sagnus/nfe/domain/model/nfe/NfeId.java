package com.slifesys.sagnus.nfe.domain.model.nfe;

import lombok.Value;

import java.util.UUID;
@Value
public final class NfeId {

    private final String value;

    private NfeId(String value) {
        this.value = value;
    }

//    public static NfeId novo() {
//        return new NfeId(UUID.randomUUID().toString());
//    }

//    public String getValue() {        return value;    }


    // Método estático para criar o NfeId
    public static NfeId of(String value) {
        return new NfeId(value);
    }
}

package com.slifesys.sagnus.adm.domain.model.audit;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Audit {
    private String createdBy;

    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    public static Audit novo(String usuario, java.time.Instant data) {
        Audit a = new Audit();
        a.setCreatedBy(usuario);
        // data ignored for now or add field
        return a;
    }
}

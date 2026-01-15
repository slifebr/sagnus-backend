package com.slifesys.sagnus.adm.domain.model.agenda;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Convite {
    private Long id;

    private Long colaboradorId;

    public Convite(Long colaboradorId) {
        this.colaboradorId = colaboradorId;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getColaboradorId() { return colaboradorId; }
    public void setColaboradorId(Long colaboradorId) { this.colaboradorId = colaboradorId; }
}

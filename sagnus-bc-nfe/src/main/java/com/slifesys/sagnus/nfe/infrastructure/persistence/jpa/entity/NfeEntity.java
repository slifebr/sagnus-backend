package com.slifesys.sagnus.nfe.infrastructure.persistence.jpa.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "nfe_nfe")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NfeEntity {

    @Id
    @Column(name = "id", length = 36, nullable = false)
    private String id;

    @Column(name = "emitente_pessoa_id", nullable = false)
    private Long emitentePessoaId;

    @Column(name = "emitente_nome", nullable = false, length = 200)
    private String emitenteNome;

    @Column(name = "emitente_documento", nullable = false, length = 14)
    private String emitenteDocumento;

    @Column(name = "destinatario_pessoa_id", nullable = false)
    private Long destinatarioPessoaId;

    @Column(name = "destinatario_nome", nullable = false, length = 200)
    private String destinatarioNome;

    @Column(name = "destinatario_documento", nullable = false, length = 14)
    private String destinatarioDocumento;

    @Column(name = "status", nullable = false, length = 30)
    private String status;

    @Column(name = "created_at", nullable = false)
    private Instant createdAt;

    @Column(name = "updated_at", nullable = false)
    private Instant updatedAt;

    @OneToMany(mappedBy = "nfe", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<NfeItemEntity> itens = new ArrayList<>();

    public void addItem(NfeItemEntity item) {
        if (item == null) return;
        item.setNfe(this);
        this.itens.add(item);
    }

    public void clearItems() {
        for (NfeItemEntity it : itens) {
            it.setNfe(null);
        }
        itens.clear();
    }
}

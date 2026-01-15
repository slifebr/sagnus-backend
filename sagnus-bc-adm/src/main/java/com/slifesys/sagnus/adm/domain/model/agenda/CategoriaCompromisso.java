package com.slifesys.sagnus.adm.domain.model.agenda;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CategoriaCompromisso {
    private Long id;
    private String nome;

    private String cor;

    private com.slifesys.sagnus.adm.domain.model.audit.Audit audit;

    public CategoriaCompromisso(Long id, String nome, String cor, com.slifesys.sagnus.adm.domain.model.audit.Audit audit) {
        this.id = id;
        this.nome = nome;
        this.cor = cor;
        this.audit = audit;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }
    public String getCor() { return cor; }
    public void setCor(String cor) { this.cor = cor; }
    public com.slifesys.sagnus.adm.domain.model.audit.Audit getAudit() { return audit; }
    public void setAudit(com.slifesys.sagnus.adm.domain.model.audit.Audit audit) { this.audit = audit; }
}

package com.slifesys.sagnus.adm.domain.model.modulo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Modulo {
    private ModuloId id;
    private String nome;
    private String codigo;
    private String descricao;
    private com.slifesys.sagnus.adm.domain.model.audit.Audit audit;

    public Modulo(ModuloId id, String codigo, String nome, String descricao, com.slifesys.sagnus.adm.domain.model.audit.Audit audit) {
        this.id = id;
        this.codigo = codigo;
        this.nome = nome;
        this.descricao = descricao;
        this.audit = audit;
    }

    public ModuloId getId() { return id; }
    public void setId(ModuloId id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public com.slifesys.sagnus.adm.domain.model.audit.Audit getAudit() { return audit; }
    public void setAudit(com.slifesys.sagnus.adm.domain.model.audit.Audit audit) { this.audit = audit; }
}

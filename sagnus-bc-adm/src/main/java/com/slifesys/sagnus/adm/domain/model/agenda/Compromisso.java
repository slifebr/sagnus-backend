package com.slifesys.sagnus.adm.domain.model.agenda;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Compromisso {
    private Long id;
    private String titulo;

    private Long categoriaId;
    private Long colaboradorId;
    private java.time.LocalDate dataCompromisso;
    private java.time.LocalTime hora;
    private Integer duracao;
    private String onde;
    private String descricao;
    private String tipo;
    private java.util.List<Convite> convidados;
    private java.util.List<Notificacao> notificacoes;

    public Compromisso(Long id, Long categoriaId, Long colaboradorId, java.time.LocalDate dataCompromisso, java.time.LocalTime hora, Integer duracao, String onde, String descricao, String tipo, com.slifesys.sagnus.adm.domain.model.audit.Audit audit, java.util.List<Convite> convidados, java.util.List<Notificacao> notificacoes) {
        this.id = id;
        this.categoriaId = categoriaId;
        this.colaboradorId = colaboradorId;
        this.dataCompromisso = dataCompromisso;
        this.hora = hora;
        this.duracao = duracao;
        this.onde = onde;
        this.descricao = descricao;
        this.tipo = tipo;
        // audit field missing in class? I need to check
        this.audit = audit;
        this.convidados = convidados;
        this.notificacoes = notificacoes;
    }
    
    // I need to make sure audit field exists in Compromisso. I checked before and added many fields, but need to verification.
    private com.slifesys.sagnus.adm.domain.model.audit.Audit audit;
    public com.slifesys.sagnus.adm.domain.model.audit.Audit getAudit() { return audit; }
    public void setAudit(com.slifesys.sagnus.adm.domain.model.audit.Audit audit) { this.audit = audit; }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitulo() { return titulo; }
    public void setTitulo(String titulo) { this.titulo = titulo; }
    public Long getCategoriaId() { return categoriaId; }
    public void setCategoriaId(Long categoriaId) { this.categoriaId = categoriaId; }
    public Long getColaboradorId() { return colaboradorId; }
    public void setColaboradorId(Long colaboradorId) { this.colaboradorId = colaboradorId; }
    public java.time.LocalDate getDataCompromisso() { return dataCompromisso; }
    public void setDataCompromisso(java.time.LocalDate dataCompromisso) { this.dataCompromisso = dataCompromisso; }
    public java.time.LocalTime getHora() { return hora; }
    public void setHora(java.time.LocalTime hora) { this.hora = hora; }
    public Integer getDuracao() { return duracao; }
    public void setDuracao(Integer duracao) { this.duracao = duracao; }
    public String getOnde() { return onde; }
    public void setOnde(String onde) { this.onde = onde; }
    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
    public java.util.List<Convite> getConvidados() { return convidados; }
    public void setConvidados(java.util.List<Convite> convidados) { this.convidados = convidados; }
    public java.util.List<Notificacao> getNotificacoes() { return notificacoes; }
    public void setNotificacoes(java.util.List<Notificacao> notificacoes) { this.notificacoes = notificacoes; }
}

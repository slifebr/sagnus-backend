package com.slifesys.sagnus.adm.domain.model.agenda;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Notificacao {
    private Long id;
    private String mensagem;

    private java.time.LocalDate data;
    private java.time.LocalTime hora;
    private String tipo;

    public Notificacao(java.time.LocalDate data, java.time.LocalTime hora, String tipo) {
        this.data = data;
        this.hora = hora;
        this.tipo = tipo;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getMensagem() { return mensagem; }
    public void setMensagem(String mensagem) { this.mensagem = mensagem; }
    public java.time.LocalDate getData() { return data; }
    public void setData(java.time.LocalDate data) { this.data = data; }
    public java.time.LocalTime getHora() { return hora; }
    public void setHora(java.time.LocalTime hora) { this.hora = hora; }
    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }
}

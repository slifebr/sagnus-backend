package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.dto.CadastrarPessoaCommand;
import com.slifesys.sagnus.corp.domain.model.pessoa.TipoPessoa;
import lombok.Data;

@Data
public class PessoaCreateRequest {
    private String nome;
    private String tipo; // "F"/"J" ou "FISICA"/"JURIDICA"
    private String documento;
    private String site;
    private String email;
    private String usuario;

    public CadastrarPessoaCommand toCommand() {
        return CadastrarPessoaCommand.builder()
                .nome(nome)
                .tipo(parseTipo(tipo))
                .documento(documento)
                .site(site)
                .email(email)
                .usuCriacao(usuario != null ? usuario : "SYSTEM")
                .build();
    }

    private TipoPessoa parseTipo(String t) {
        if (t == null || t.isBlank())
            return null;
        String v = t.trim().toUpperCase();
        if (v.equals("F"))
            return TipoPessoa.FISICA;
        if (v.equals("J"))
            return TipoPessoa.JURIDICA;
        return TipoPessoa.valueOf(v);
    }
}

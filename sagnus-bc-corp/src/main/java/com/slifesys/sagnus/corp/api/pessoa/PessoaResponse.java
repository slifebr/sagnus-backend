package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import lombok.Builder;
import lombok.Value;

@Value
@Builder
public class PessoaResponse {
    Long id;
    String nome;
    String tipo;      // "F" / "J"
    String documento; // dígitos
    String site;
    String email;
    boolean ativa;

    public static PessoaResponse from(PessoaResult r) {
        return PessoaResponse.builder()
                .id(r.getId())
                .nome(r.getNome())
                .tipo(r.getTipo() != null ? (r.getTipo().name().equals("FISICA") ? "F" : "J") : null)
                .documento(r.getDocumento())
                .site(r.getSite())
                .email(r.getEmail())
                .ativa(r.isAtiva())
                .build();
    }
}

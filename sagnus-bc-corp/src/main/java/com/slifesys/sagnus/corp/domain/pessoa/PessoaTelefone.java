package com.slifesys.sagnus.corp.domain.pessoa;

import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PessoaTelefone {

    private Long id;
    private Long idPessoa;

    private String tipo;
    private String numero;

    private OffsetDateTime dtCriacao;
    private String usuCriacao;
    private OffsetDateTime dtAlteracao;
    private String usuAlteracao;
}

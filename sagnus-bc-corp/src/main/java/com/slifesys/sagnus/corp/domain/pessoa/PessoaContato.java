package com.slifesys.sagnus.corp.domain.pessoa;

import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PessoaContato {

    private Long id;
    private Long idPessoa;

    private String nome;
    private String email;
    private String observacao;

    private OffsetDateTime dtCriacao;
    private String usuCriacao;
    private OffsetDateTime dtAlteracao;
    private String usuAlteracao;
}

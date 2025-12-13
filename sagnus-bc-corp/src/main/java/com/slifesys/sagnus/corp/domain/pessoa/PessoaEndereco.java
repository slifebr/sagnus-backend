package com.slifesys.sagnus.corp.domain.pessoa;

import com.slifesys.sagnus.corp.domain.common.SimNao;
import lombok.*;

import java.time.OffsetDateTime;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PessoaEndereco {

    private Long id;
    private Long idPessoa;

    private String logradouro;
    private String numero;
    private String bairro;

    private Long municipioIbge;
    private String uf;

    private String cep;
    private String cidade;
    private String complemento;

    private SimNao principal;
    private SimNao entrega;
    private SimNao cobranca;
    private SimNao correspondencia;

    private OffsetDateTime dtCriacao;
    private String usuCriacao;
    private OffsetDateTime dtAlteracao;
    private String usuAlteracao;
}

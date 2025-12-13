package com.slifesys.sagnus.corp.domain.pessoa;

import com.slifesys.sagnus.corp.domain.common.SimNao;
import lombok.*;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Pessoa {

    private Long id;

    private String nome;

    private PessoaTipo tipo;

    private String site;

    private String email;

    // papéis (flags do legado)
    private SimNao ehCliente;
    private SimNao ehFornecedor;
    private SimNao ehTransportadora;
    private SimNao ehColaborador;
    private SimNao ehContador;

    // auditoria
    private OffsetDateTime dtCriacao;
    private String usuCriacao;
    private OffsetDateTime dtAlteracao;
    private String usuAlteracao;

    // sub-entidades (tabelas filhas)
    @Builder.Default
    private List<PessoaEndereco> enderecos = new ArrayList<>();

    @Builder.Default
    private List<PessoaTelefone> telefones = new ArrayList<>();

    @Builder.Default
    private List<PessoaContato> contatos = new ArrayList<>();
}

package com.slifesys.sagnus.corp.contract.marca;

import lombok.Builder;
import lombok.Value;

import java.time.Instant;

@Value
@Builder
public class MarcaDTO {
    Long id;
    String nome;
    String descricao;
    Instant criadoEm;
    String usuCriacao;
    Instant atualizadoEm;
    String usuAlteracao;
}

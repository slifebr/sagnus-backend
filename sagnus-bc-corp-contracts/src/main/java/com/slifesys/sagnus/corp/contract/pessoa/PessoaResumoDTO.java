package com.slifesys.sagnus.corp.contract.pessoa;

import lombok.Builder;
import lombok.Value;

/**
 * DTO de integração (Contrato CORP).
 * Uso típico: AUTH/NFe precisam identificar a pessoa sem depender do domínio CORP nem JPA.
 */
@Value
@Builder
public class PessoaResumoDTO {
    Long pessoaId;
    String tipo;       // "F" ou "J" (compatível com legado)
    String documento;  // dígitos
    String nome;
}

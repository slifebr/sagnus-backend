package com.slifesys.sagnus.fina.base.contract.core;

/**
 * DTO mínimo (read-only) para referências cruzadas entre BCs.
 * Evite expor entidades do domínio diretamente.
 */
public record FBaseResumoDTO(
        Long id,
        String codigo,
        String nome,
        Boolean ativo
) {}

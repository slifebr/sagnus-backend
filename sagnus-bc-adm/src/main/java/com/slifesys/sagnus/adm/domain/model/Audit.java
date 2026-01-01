package com.slifesys.sagnus.adm.domain.model;

import java.time.Instant;

/**
 * Informações de auditoria comuns no BC ADM.
 * Mantido no domínio por ser parte do modelo (não depende de Spring/JPA).
 */
public record Audit(
        Instant criadoEm,
        String usuCriacao,
        Instant atualizadoEm,
        String usuAlteracao
) {
    public static Audit novo(String usuCriacao, Instant agora) {
        return new Audit(agora, usuCriacao, null, null);
    }

    public Audit comAlteracao(String usuAlteracao, Instant agora) {
        return new Audit(this.criadoEm, this.usuCriacao, agora, usuAlteracao);
    }
}

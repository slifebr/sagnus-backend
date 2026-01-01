package com.slifesys.sagnus.adm.api.modulo;

public record ModuloResponse(
        Long id,
        String codigo,
        String nome,
        String descricao
) {
}

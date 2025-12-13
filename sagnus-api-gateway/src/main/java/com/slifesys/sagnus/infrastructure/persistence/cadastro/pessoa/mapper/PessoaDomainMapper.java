package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.mapper;

import com.slifesys.sagnus.domain.cadastro.pessoa.Pessoa;
import com.slifesys.sagnus.domain.cadastro.pessoa.TipoPessoa;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;

/**
 * Mapper de infraestrutura para converter entre CadPessoa (JPA)
 * e Pessoa (domínio puro).
 *
 * Fica aqui para isolar:
 *  - conversão S/N -> boolean
 *  - F/J -> enum TipoPessoa
 */
public final class PessoaDomainMapper {

    private PessoaDomainMapper() {
    }

    public static Pessoa toDomain(CadPessoa entity) {
        if (entity == null) {
            return null;
        }

        return Pessoa.reconstruir(
                entity.getId(),
                entity.getNome(),
                TipoPessoa.fromCodigo(entity.getTipo()),
                entity.getSite(),
                entity.getEmail(),
                snToBool(entity.getEhCliente()),
                snToBool(entity.getEhFornecedor()),
                snToBool(entity.getEhTransportadora()),
                snToBool(entity.getEhColaborador()),
                snToBool(entity.getEhContador()),
                snToBool(entity.getEhAtivo())
        );
    }

    /**
     * Atualiza a entidade JPA a partir do domínio.
     * Usado para criação/alteração.
     */
    public static void updateEntityFromDomain(CadPessoa entity, Pessoa domain) {
        entity.setNome(domain.getNome());
        entity.setTipo(domain.getTipo().toCodigo());
        entity.setSite(domain.getSite());
        entity.setEmail(domain.getEmail());
        entity.setEhCliente(boolToSn(domain.isCliente()));
        entity.setEhFornecedor(boolToSn(domain.isFornecedor()));
        entity.setEhTransportadora(boolToSn(domain.isTransportadora()));
        entity.setEhColaborador(boolToSn(domain.isColaborador()));
        entity.setEhContador(boolToSn(domain.isContador()));
        entity.setEhAtivo(boolToSn(domain.isAtivo()));
    }

    private static boolean snToBool(String valor) {
        return "S".equalsIgnoreCase(valor);
    }

    private static String boolToSn(boolean valor) {
        return valor ? "S" : "N";
    }
}

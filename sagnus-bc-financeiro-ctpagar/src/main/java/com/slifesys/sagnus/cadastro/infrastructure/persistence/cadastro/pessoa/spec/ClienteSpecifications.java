package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.spec;

import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadCliente;
import org.springframework.data.jpa.domain.Specification;

public final class ClienteSpecifications {

    private ClienteSpecifications() {}

    public static Specification<CadCliente> pessoaIdEquals(Integer pessoaId) {
        if (pessoaId == null) {
            return null;
        }
        return (root, query, cb) ->
                cb.equal(root.get("pessoa").get("id"), pessoaId);
    }

    public static Specification<CadCliente> pessoaNomeContains(String nome) {
        if (nome == null || nome.isBlank()) {
            return null;
        }
        String filtro = "%" + nome.trim().toLowerCase() + "%";
        return (root, query, cb) ->
                cb.like(cb.lower(root.get("pessoa").get("nome")), filtro);
    }
}

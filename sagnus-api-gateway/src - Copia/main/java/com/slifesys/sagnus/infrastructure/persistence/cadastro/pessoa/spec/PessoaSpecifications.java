package com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.spec;


import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;
import org.springframework.data.jpa.domain.Specification;

public final class PessoaSpecifications {

    private PessoaSpecifications() {
    }

    public static Specification<CadPessoa> nomeContains(String nome) {
        if (nome == null || nome.isBlank()) {
            return null;
        }
        String filtro = "%" + nome.trim().toLowerCase() + "%";
        return (root, query, cb) ->
                cb.like(cb.lower(root.get("nome")), filtro);
    }

    public static Specification<CadPessoa> tipoEquals(String tipo) {
        if (tipo == null || tipo.isBlank()) {
            return null;
        }
        String filtro = tipo.trim().toUpperCase(); // "F" ou "J"
        return (root, query, cb) ->
                cb.equal(cb.upper(root.get("tipo")), filtro);
    }

    public static Specification<CadPessoa> ativoEquals(Boolean ativo) {
        if (ativo == null) {
            return null;
        }
        String valorSn = ativo ? "S" : "N";
        return (root, query, cb) ->
                cb.equal(root.get("ehAtivo"), valorSn);
    }
}

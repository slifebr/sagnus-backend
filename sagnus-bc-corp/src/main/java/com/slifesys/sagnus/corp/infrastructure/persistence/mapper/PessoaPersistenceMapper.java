package com.slifesys.sagnus.corp.infrastructure.persistence.mapper;

import com.slifesys.sagnus.corp.domain.model.pessoa.*;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaEnderecoJpaEntity;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.PessoaJpaEntity;

import java.util.List;
import java.util.stream.Collectors;

public final class PessoaPersistenceMapper {

    private PessoaPersistenceMapper() {}

    public static PessoaJpaEntity toJpa(Pessoa p) {
        PessoaJpaEntity e = new PessoaJpaEntity();
        e.setId(p.getId() != null ? p.getId().getValue() : null);
        e.setTipo(p.getTipo() == TipoPessoa.FISICA ? "F" : "J");
        e.setDocumento(p.getDocumento().getValue());
        e.setNome(p.getNome().getValue());
        e.setEmail(p.getEmail() != null ? p.getEmail().getValue() : null);
        e.setSite(p.getSite());
        e.setAtiva(p.isAtiva());
        e.setCriadaEm(p.getCriadaEm());
        e.setAtualizadaEm(p.getAtualizadaEm());

        e.getEnderecos().clear();
        for (Endereco end : p.getEnderecos()) {
            PessoaEnderecoJpaEntity pe = new PessoaEnderecoJpaEntity();
            pe.setPessoa(e);
            pe.setLogradouro(end.getLogradouro());
            pe.setNumero(end.getNumero());
            pe.setComplemento(end.getComplemento());
            pe.setBairro(end.getBairro());
            pe.setCidade(end.getCidade());
            pe.setUf(end.getUf());
            pe.setCep(end.getCep());
            pe.setPais(end.getPais());
            e.getEnderecos().add(pe);
        }
        return e;
    }

    public static Pessoa toDomain(PessoaJpaEntity e) {
        TipoPessoa tipo = "F".equalsIgnoreCase(e.getTipo()) ? TipoPessoa.FISICA : TipoPessoa.JURIDICA;

        Documento doc = Documento.of(e.getDocumento(), tipo);
        Nome nome = Nome.of(e.getNome());
        Email email = Email.of(e.getEmail());

        List<Endereco> enderecos = e.getEnderecos() == null ? List.of() :
                e.getEnderecos().stream().map(PessoaPersistenceMapper::toEndereco).collect(Collectors.toList());

        return Pessoa.reconstruir(
                PessoaId.of(e.getId()),
                tipo,
                doc,
                nome,
                email,
                e.getSite(),
                Boolean.TRUE.equals(e.getAtiva()),
                e.getCriadaEm(),
                e.getAtualizadaEm(),
                enderecos
        );
    }

    private static Endereco toEndereco(PessoaEnderecoJpaEntity pe) {
        return Endereco.builder()
                .logradouro(pe.getLogradouro())
                .numero(pe.getNumero())
                .complemento(pe.getComplemento())
                .bairro(pe.getBairro())
                .cidade(pe.getCidade())
                .uf(pe.getUf())
                .cep(pe.getCep())
                .pais(pe.getPais())
                .build();
    }
}

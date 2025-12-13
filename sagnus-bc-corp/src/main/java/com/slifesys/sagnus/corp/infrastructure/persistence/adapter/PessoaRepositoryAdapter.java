package com.slifesys.sagnus.corp.infrastructure.persistence.adapter;

import com.slifesys.sagnus.corp.domain.common.SimNao;
import com.slifesys.sagnus.corp.domain.pessoa.*;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.entity.*;
import com.slifesys.sagnus.corp.infrastructure.persistence.jpa.repository.PessoaJpaRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.stream.Collectors;

@Repository
@RequiredArgsConstructor
public class PessoaRepositoryAdapter implements PessoaRepository {

    private final PessoaJpaRepository jpa;

    @Override
    @Transactional(readOnly = true)
    public Optional<Pessoa> findById(Long id) {
        return jpa.findWithChildrenById(id).map(this::toDomain);
    }

    @Override
    @Transactional
    public Pessoa save(Pessoa pessoa) {
        PessoaJpaEntity saved = jpa.save(toJpa(pessoa));
        return toDomain(saved);
    }

    private Pessoa toDomain(PessoaJpaEntity e) {
        return Pessoa.builder()
                .id(e.getId())
                .nome(e.getNome())
                .tipo(PessoaTipo.fromDb(e.getTipo()))
                .site(e.getSite())
                .email(e.getEmail())
                .ehCliente(SimNao.fromDb(e.getEhCliente()))
                .ehFornecedor(SimNao.fromDb(e.getEhFornecedor()))
                .ehTransportadora(SimNao.fromDb(e.getEhTransportadora()))
                .ehColaborador(SimNao.fromDb(e.getEhColaborador()))
                .ehContador(SimNao.fromDb(e.getEhContador()))
                .dtCriacao(e.getDtCriacao())
                .usuCriacao(e.getUsuCriacao())
                .dtAlteracao(e.getDtAlteracao())
                .usuAlteracao(e.getUsuAlteracao())
                .enderecos(e.getEnderecos().stream().map(this::toDomain).collect(Collectors.toList()))
                .telefones(e.getTelefones().stream().map(this::toDomain).collect(Collectors.toList()))
                .contatos(e.getContatos().stream().map(this::toDomain).collect(Collectors.toList()))
                .build();
    }

    private PessoaEndereco toDomain(PessoaEnderecoJpaEntity e) {
        return PessoaEndereco.builder()
                .id(e.getId())
                .idPessoa(e.getPessoa() != null ? e.getPessoa().getId() : null)
                .logradouro(e.getLogradouro())
                .numero(e.getNumero())
                .bairro(e.getBairro())
                .municipioIbge(e.getMunicipioIbge())
                .uf(e.getUf())
                .cep(e.getCep())
                .cidade(e.getCidade())
                .complemento(e.getComplemento())
                .principal(SimNao.fromDb(e.getPrincipal()))
                .entrega(SimNao.fromDb(e.getEntrega()))
                .cobranca(SimNao.fromDb(e.getCobranca()))
                .correspondencia(SimNao.fromDb(e.getCorrespondencia()))
                .dtCriacao(e.getDtCriacao())
                .usuCriacao(e.getUsuCriacao())
                .dtAlteracao(e.getDtAlteracao())
                .usuAlteracao(e.getUsuAlteracao())
                .build();
    }

    private PessoaTelefone toDomain(PessoaTelefoneJpaEntity e) {
        return PessoaTelefone.builder()
                .id(e.getId())
                .idPessoa(e.getPessoa() != null ? e.getPessoa().getId() : null)
                .tipo(e.getTipo())
                .numero(e.getNumero())
                .dtCriacao(e.getDtCriacao())
                .usuCriacao(e.getUsuCriacao())
                .dtAlteracao(e.getDtAlteracao())
                .usuAlteracao(e.getUsuAlteracao())
                .build();
    }

    private PessoaContato toDomain(PessoaContatoJpaEntity e) {
        return PessoaContato.builder()
                .id(e.getId())
                .idPessoa(e.getPessoa() != null ? e.getPessoa().getId() : null)
                .nome(e.getNome())
                .email(e.getEmail())
                .observacao(e.getObservacao())
                .dtCriacao(e.getDtCriacao())
                .usuCriacao(e.getUsuCriacao())
                .dtAlteracao(e.getDtAlteracao())
                .usuAlteracao(e.getUsuAlteracao())
                .build();
    }

    private PessoaJpaEntity toJpa(Pessoa d) {
        PessoaJpaEntity p = PessoaJpaEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .tipo(d.getTipo() != null ? d.getTipo().toDb() : null)
                .site(d.getSite())
                .email(d.getEmail())
                .ehCliente(d.getEhCliente() != null ? d.getEhCliente().toDb() : null)
                .ehFornecedor(d.getEhFornecedor() != null ? d.getEhFornecedor().toDb() : null)
                .ehTransportadora(d.getEhTransportadora() != null ? d.getEhTransportadora().toDb() : null)
                .ehColaborador(d.getEhColaborador() != null ? d.getEhColaborador().toDb() : null)
                .ehContador(d.getEhContador() != null ? d.getEhContador().toDb() : null)
                .dtCriacao(d.getDtCriacao())
                .usuCriacao(d.getUsuCriacao())
                .dtAlteracao(d.getDtAlteracao())
                .usuAlteracao(d.getUsuAlteracao())
                .build();

        p.getEnderecos().clear();
        for (PessoaEndereco e : d.getEnderecos()) {
            p.getEnderecos().add(PessoaEnderecoJpaEntity.builder()
                    .id(e.getId())
                    .pessoa(p)
                    .logradouro(e.getLogradouro())
                    .numero(e.getNumero())
                    .bairro(e.getBairro())
                    .municipioIbge(e.getMunicipioIbge())
                    .uf(e.getUf())
                    .cep(e.getCep())
                    .cidade(e.getCidade())
                    .complemento(e.getComplemento())
                    .principal(e.getPrincipal() != null ? e.getPrincipal().toDb() : null)
                    .entrega(e.getEntrega() != null ? e.getEntrega().toDb() : null)
                    .cobranca(e.getCobranca() != null ? e.getCobranca().toDb() : null)
                    .correspondencia(e.getCorrespondencia() != null ? e.getCorrespondencia().toDb() : null)
                    .dtCriacao(e.getDtCriacao())
                    .usuCriacao(e.getUsuCriacao())
                    .dtAlteracao(e.getDtAlteracao())
                    .usuAlteracao(e.getUsuAlteracao())
                    .build());
        }

        p.getTelefones().clear();
        for (PessoaTelefone t : d.getTelefones()) {
            p.getTelefones().add(PessoaTelefoneJpaEntity.builder()
                    .id(t.getId())
                    .pessoa(p)
                    .tipo(t.getTipo())
                    .numero(t.getNumero())
                    .dtCriacao(t.getDtCriacao())
                    .usuCriacao(t.getUsuCriacao())
                    .dtAlteracao(t.getDtAlteracao())
                    .usuAlteracao(t.getUsuAlteracao())
                    .build());
        }

        p.getContatos().clear();
        for (PessoaContato c : d.getContatos()) {
            p.getContatos().add(PessoaContatoJpaEntity.builder()
                    .id(c.getId())
                    .pessoa(p)
                    .nome(c.getNome())
                    .email(c.getEmail())
                    .observacao(c.getObservacao())
                    .dtCriacao(c.getDtCriacao())
                    .usuCriacao(c.getUsuCriacao())
                    .dtAlteracao(c.getDtAlteracao())
                    .usuAlteracao(c.getUsuAlteracao())
                    .build());
        }

        return p;
    }
}

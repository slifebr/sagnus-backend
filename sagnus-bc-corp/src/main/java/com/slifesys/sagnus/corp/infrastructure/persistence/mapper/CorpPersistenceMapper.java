package com.slifesys.sagnus.corp.infrastructure.persistence.mapper;

import com.slifesys.sagnus.corp.domain.model.marca.Marca;
import com.slifesys.sagnus.corp.domain.model.subgrupo.Subgrupo;
import com.slifesys.sagnus.corp.domain.model.unidade.Unidade;
import com.slifesys.sagnus.corp.domain.model.promocao.Promocao;
import com.slifesys.sagnus.corp.domain.model.tabelapreco.TabelaPreco;
import com.slifesys.sagnus.corp.domain.model.setor.Setor;
import com.slifesys.sagnus.corp.domain.model.sindicato.Sindicato;
import com.slifesys.sagnus.corp.domain.model.tipoadmissao.TipoAdmissao;
import com.slifesys.sagnus.corp.domain.model.tiporelacionamento.TipoRelacionamento;
import com.slifesys.sagnus.corp.domain.model.transportadora.Transportadora;
import com.slifesys.sagnus.corp.domain.model.uf.UF;
import com.slifesys.sagnus.corp.domain.model.vendedor.Vendedor;

import com.slifesys.sagnus.corp.infrastructure.persistence.entity.*;

public final class CorpPersistenceMapper {

    private CorpPersistenceMapper() {
    }

    // Marca
    public static MarcaEntity toJpa(Marca d) {
        return MarcaEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .descricao(d.getDescricao())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Marca toDomain(MarcaEntity e) {
        return new Marca(
                e.getId(),
                e.getNome(),
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Subgrupo
    public static SubgrupoEntity toJpa(Subgrupo d) {
        return SubgrupoEntity.builder()
                .id(d.getId())
                .idGrupo(d.getIdGrupo())
                .nome(d.getNome())
                .descricao(d.getDescricao())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Subgrupo toDomain(SubgrupoEntity e) {
        return new Subgrupo(
                e.getId(),
                e.getIdGrupo(),
                e.getNome(),
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Unidade
    public static UnidadeEntity toJpa(Unidade d) {
        return UnidadeEntity.builder()
                .id(d.getId())
                .sigla(d.getSigla())
                .descricao(d.getDescricao()) // Mapping nome to descricao as discussed
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Unidade toDomain(UnidadeEntity e) {
        return new Unidade(
                e.getId(),
                e.getSigla(),
                e.getDescricao(), // Mapping descricao to nome
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Promocao
    public static PromocaoEntity toJpa(Promocao d) {
        return PromocaoEntity.builder()
                .id(d.getId())
                .idProduto(d.getIdProduto())
                .dataInicio(d.getDataInicio())
                .dataFim(d.getDataFim())
                .precoPromocional(d.getPrecoPromocional())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Promocao toDomain(PromocaoEntity e) {
        return new Promocao(
                e.getId(),
                e.getIdProduto(),
                e.getDataInicio(),
                e.getDataFim(),
                e.getPrecoPromocional(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // TabelaPreco
    public static TabelaPrecoEntity toJpa(TabelaPreco d) {
        return TabelaPrecoEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .dataInicio(d.getDataInicio())
                .dataFim(d.getDataFim())
                .coeficiente(d.getCoeficiente())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static TabelaPreco toDomain(TabelaPrecoEntity e) {
        return new TabelaPreco(
                e.getId(),
                e.getNome(),
                e.getDataInicio(),
                e.getDataFim(),
                e.getCoeficiente(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Setor
    public static SetorEntity toJpa(Setor d) {
        return SetorEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .descricao(d.getDescricao())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Setor toDomain(SetorEntity e) {
        return new Setor(
                e.getId(),
                e.getNome(),
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Sindicato
    public static SindicatoEntity toJpa(Sindicato d) {
        return SindicatoEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .codigoBanco(d.getCodigoBanco())
                .codigoAgencia(d.getCodigoAgencia())
                .contaBanco(d.getContaBanco())
                .codigoCedente(d.getCodigoCedente())
                .logradouro(d.getLogradouro())
                .numero(d.getNumero())
                .bairro(d.getBairro())
                .municipioIbge(d.getMunicipioIbge())
                .uf(d.getUf())
                .fone1(d.getFone1())
                .fone2(d.getFone2())
                .email(d.getEmail())
                .tipoSindicato(d.getTipoSindicato())
                .dataBase(d.getDataBase())
                .pisoSalarial(d.getPisoSalarial())
                .cnpj(d.getCnpj())
                .classificacaoContabilConta(d.getClassificacaoContabilConta())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Sindicato toDomain(SindicatoEntity e) {
        return new Sindicato(
                e.getId(),
                e.getNome(),
                e.getCodigoBanco(),
                e.getCodigoAgencia(),
                e.getContaBanco(),
                e.getCodigoCedente(),
                e.getLogradouro(),
                e.getNumero(),
                e.getBairro(),
                e.getMunicipioIbge(),
                e.getUf(),
                e.getFone1(),
                e.getFone2(),
                e.getEmail(),
                e.getTipoSindicato(),
                e.getDataBase(),
                e.getPisoSalarial(),
                e.getCnpj(),
                e.getClassificacaoContabilConta(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // TipoAdmissao
    public static TipoAdmissaoEntity toJpa(TipoAdmissao d) {
        return TipoAdmissaoEntity.builder()
                .id(d.getId())
                .codigo(d.getCodigo())
                .nome(d.getNome())
                .descricao(d.getDescricao())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static TipoAdmissao toDomain(TipoAdmissaoEntity e) {
        return new TipoAdmissao(
                e.getId(),
                e.getCodigo(),
                e.getNome(),
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // TipoRelacionamento
    public static TipoRelacionamentoEntity toJpa(TipoRelacionamento d) {
        return TipoRelacionamentoEntity.builder()
                .id(d.getId())
                .nome(d.getNome())
                .descricao(d.getDescricao())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static TipoRelacionamento toDomain(TipoRelacionamentoEntity e) {
        return new TipoRelacionamento(
                e.getId(),
                e.getNome(),
                e.getDescricao(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Transportadora
    public static TransportadoraEntity toJpa(Transportadora d) {
        return TransportadoraEntity.builder()
                .id(d.getId())
                .idPessoa(d.getIdPessoa())
                .placaVeiculo(d.getPlacaVeiculo())
                .rntc(d.getRntc())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Transportadora toDomain(TransportadoraEntity e) {
        return new Transportadora(
                e.getId(),
                e.getIdPessoa(),
                e.getPlacaVeiculo(),
                e.getRntc(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // UF
    public static UFEntity toJpa(UF d) {
        return UFEntity.builder()
                .id(d.getId())
                .sigla(d.getSigla())
                .nome(d.getNome())
                .icmsInterno(d.getIcmsInterno())
                .icmsInterestadual(d.getIcmsInterestadual())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static UF toDomain(UFEntity e) {
        return new UF(
                e.getId(),
                e.getSigla(),
                e.getNome(),
                e.getIcmsInterno(),
                e.getIcmsInterestadual(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }

    // Vendedor
    public static VendedorEntity toJpa(Vendedor d) {
        return VendedorEntity.builder()
                .id(d.getId())
                .idColaborador(d.getIdPessoa())
                .comissao(d.getComissao())
                .metaVenda(d.getMeta())
                .criadoEm(d.getCriadoEm())
                .usuCriacao(d.getUsuCriacao())
                .atualizadoEm(d.getAtualizadoEm())
                .usuAlteracao(d.getUsuAlteracao())
                .build();
    }

    public static Vendedor toDomain(VendedorEntity e) {
        return new Vendedor(
                e.getId(),
                e.getIdColaborador(),
                e.getComissao(),
                e.getMetaVenda(),
                e.getCriadoEm(),
                e.getUsuCriacao(),
                e.getAtualizadoEm(),
                e.getUsuAlteracao());
    }
}

package com.slifesys.sagnus.application.cadastro.pessoa;

import com.slifesys.sagnus.api.cadastro.pessoa.dto.PessoaDTO;
import com.slifesys.sagnus.api.cadastro.pessoa.mapper.PessoaMapper;
import com.slifesys.sagnus.api.error.ErrorType;
import com.slifesys.sagnus.core.exception.BusinessException;
import com.slifesys.sagnus.domain.cadastro.pessoa.Pessoa;
import com.slifesys.sagnus.domain.cadastro.pessoa.TipoPessoa;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.mapper.PessoaDomainMapper;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.repository.CadPessoaRepository;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.spec.PessoaSpecifications;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class PessoaService {

    private final CadPessoaRepository pessoaRepository;
    private final PessoaMapper pessoaMapper;

    public PessoaService(CadPessoaRepository pessoaRepository,
                         PessoaMapper pessoaMapper) {
        this.pessoaRepository = pessoaRepository;
        this.pessoaMapper = pessoaMapper;
    }

    // =========================================================
    // LISTAR (paginado + filtros: nome, tipo, ativo)
    // =========================================================
    @Transactional(readOnly = true)
    public Page<PessoaDTO> listar(String nome,
                                  String tipo,
                                  Boolean ativo,
                                  Pageable pageable) {

        log.debug("Listando pessoas - filtro nome='{}', tipo='{}', ativo={}, page={}",
                nome, tipo, ativo, pageable);

        Specification<CadPessoa> spec = Specification.allOf();

        spec = spec
                .and(PessoaSpecifications.nomeContains(nome))
                .and(PessoaSpecifications.tipoEquals(tipo))
                .and(PessoaSpecifications.ativoEquals(ativo));

        Page<CadPessoa> page = pessoaRepository.findAll(spec, pageable);

        return page.map(pessoaMapper::toDTO);
    }
    // =========================================================
    // BUSCAR POR ID
    // =========================================================
    @Transactional(readOnly = true)
    public PessoaDTO buscarPorId(Integer id) {
        CadPessoa entity = pessoaRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Pessoa não encontrada.",
                        "ERP-PES-404",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));

        // Domínio (se precisar de regra de negócio)
        Pessoa pessoa = PessoaDomainMapper.toDomain(entity);

        // uso de domínio:
        // if (!pessoa.isAtivo()) { ... alguma lógica ... }

        // devolvendo DTO para a API
        return pessoaMapper.toDTO(entity);
    }

    // =========================================================
    // CRIAR
    // =========================================================
    public PessoaDTO criar(PessoaDTO dto) {

        // Converte dto -> domínio
        Pessoa pessoaDomain = Pessoa.novaPessoa(
                dto.getNome(),
                TipoPessoa.fromCodigo(dto.getTipo()),
                dto.getEmail(),
                dto.getSite(),
                snLikeBoolean(dto.getEhCliente()),
                snLikeBoolean(dto.getEhFornecedor()),
                snLikeBoolean(dto.getEhTransportadora()),
                snLikeBoolean(dto.getEhColaborador()),
                snLikeBoolean(dto.getEhContador())
        );

        // Cria entity JPA e preenche a partir do domínio
        CadPessoa entity = new CadPessoa();
        PessoaDomainMapper.updateEntityFromDomain(entity, pessoaDomain);

        // Se tiver coisas adicionais (ex.: pessoaFisica, pessoaJuridica, contatos/endereço), você encaixa aqui.

        CadPessoa salvo = pessoaRepository.save(entity);

        return pessoaMapper.toDTO(salvo);
    }

    // =========================================================
    // ATUALIZAR
    // =========================================================
    public PessoaDTO atualizar(Integer id, PessoaDTO dto) {

        CadPessoa entity = pessoaRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Pessoa não encontrada para atualização.",
                        "ERP-PES-404",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));

        // Constrói domínio a partir da entity atual
        Pessoa pessoaDomain = PessoaDomainMapper.toDomain(entity);

        // Aplica regras de alteração no domínio
        pessoaDomain.alterarDadosBasicos(
                dto.getNome(),
                dto.getEmail(),
                dto.getSite()
        );

        // Perfis/flags
        pessoaDomain = aplicarFlagsDeUso(dto, pessoaDomain);

        // Se mudar tipo (F/J), pode validar regras adicionais
        if (dto.getTipo() != null) {
            pessoaDomain = Pessoa.reconstruir(
                    pessoaDomain.getId(),
                    pessoaDomain.getNome(),
                    TipoPessoa.fromCodigo(dto.getTipo()),
                    pessoaDomain.getSite(),
                    pessoaDomain.getEmail(),
                    pessoaDomain.isCliente(),
                    pessoaDomain.isFornecedor(),
                    pessoaDomain.isTransportadora(),
                    pessoaDomain.isColaborador(),
                    pessoaDomain.isContador(),
                    pessoaDomain.isAtivo()
            );
        }

        // Atualiza entity JPA a partir do domínio
        PessoaDomainMapper.updateEntityFromDomain(entity, pessoaDomain);

        CadPessoa salvo = pessoaRepository.save(entity);

        return pessoaMapper.toDTO(salvo);
    }

    // =========================================================
    // EXCLUIR
    // =========================================================
    public void excluir(Integer id) {
        CadPessoa entity = pessoaRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Pessoa não encontrada para exclusão.",
                        "ERP-PES-404",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));

        // Se quiser exclusão lógica:
        // Pessoa dominio = PessoaDomainMapper.toDomain(entity);
        // dominio.desativar();
        // PessoaDomainMapper.updateEntityFromDomain(entity, dominio);
        // pessoaRepository.save(entity);

        pessoaRepository.delete(entity);
    }

    // =========================================================
    // Helpers internos
    // =========================================================
    private Pessoa aplicarFlagsDeUso(PessoaDTO dto, Pessoa pessoaDomain) {

        // Aqui estou assumindo que dto.getEhCliente() etc retornam boolean ou Boolean.
        // Se ainda forem String "S/N", a função snLikeBoolean cobre.

        if (dto.getEhCliente() != null) {
            if (snLikeBoolean(dto.getEhCliente())) {
                pessoaDomain.marcarComoCliente();
            } else {
                pessoaDomain.desmarcarComoCliente();
            }
        }

        if (dto.getEhFornecedor() != null) {
            if (snLikeBoolean(dto.getEhFornecedor())) {
                pessoaDomain.marcarComoFornecedor();
            } else {
                pessoaDomain.desmarcarComoFornecedor();
            }
        }

        if (dto.getEhTransportadora() != null) {
            if (snLikeBoolean(dto.getEhTransportadora())) {
                pessoaDomain.marcarComoTransportadora();
            } else {
                pessoaDomain.desmarcarComoTransportadora();
            }
        }

        if (dto.getEhColaborador() != null) {
            if (snLikeBoolean(dto.getEhColaborador())) {
                pessoaDomain.marcarComoColaborador();
            } else {
                pessoaDomain.desmarcarComoColaborador();
            }
        }

        if (dto.getEhContador() != null) {
            if (snLikeBoolean(dto.getEhContador())) {
                pessoaDomain.marcarComoContador();
            } else {
                pessoaDomain.desmarcarComoContador();
            }
        }

        if (dto.getEhAtivo() != null) {
            if (snLikeBoolean(dto.getEhAtivo())) {
                pessoaDomain.ativar();
            } else {
                pessoaDomain.desativar();
            }
        }

        return pessoaDomain;
    }

    /**
     * Aceita boolean, Boolean e String "S/N" de forma tolerante.
     */
    private boolean snLikeBoolean(Object valor) {
        if (valor == null) return false;
        if (valor instanceof Boolean b) return b;
        if (valor instanceof String s) return "S".equalsIgnoreCase(s) || "TRUE".equalsIgnoreCase(s);
        return false;
    }
}

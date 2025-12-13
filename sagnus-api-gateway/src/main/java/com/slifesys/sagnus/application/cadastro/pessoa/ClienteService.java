package com.slifesys.sagnus.application.cadastro.pessoa;

import com.slifesys.sagnus.api.cadastro.pessoa.dto.ClienteDTO;
import com.slifesys.sagnus.api.cadastro.pessoa.mapper.ClienteMapper;
import com.slifesys.sagnus.api.error.ErrorType;
import com.slifesys.sagnus.core.exception.BusinessException;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadCliente;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.CadPessoa;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.repository.CadClienteRepository;

import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.repository.CadPessoaRepository;
import com.slifesys.sagnus.infrastructure.persistence.cadastro.pessoa.spec.ClienteSpecifications;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class ClienteService {

    private final CadClienteRepository clienteRepository;
    private final CadPessoaRepository pessoaRepository;
    private final ClienteMapper mapper;

    public ClienteService(CadClienteRepository clienteRepository,
                          CadPessoaRepository pessoaRepository,
                          ClienteMapper mapper) {
        this.clienteRepository = clienteRepository;
        this.pessoaRepository = pessoaRepository;
        this.mapper = mapper;
    }

    // LISTAR PAGINADO + FILTROS
    /*
    @Transactional(readOnly = true)
    public Page<ClienteDTO> listar(Integer pessoaId,
                                   String pessoaNome,
                                   Pageable pageable) {

        Integer pessoaIdFiltro = pessoaId;
        String nomeFiltro = (pessoaNome != null && !pessoaNome.isBlank()) ? pessoaNome : null;

        Page<CadCliente> page;

        if (pessoaIdFiltro != null && nomeFiltro != null) {
            page = clienteRepository.findByPessoa_IdAndPessoa_NomeContainingIgnoreCase(
                    pessoaIdFiltro, nomeFiltro, pageable);
        } else if (pessoaIdFiltro != null) {
            page = clienteRepository.findByPessoa_Id(pessoaIdFiltro, pageable);
        } else if (nomeFiltro != null) {
            page = clienteRepository.findByPessoa_NomeContainingIgnoreCase(nomeFiltro, pageable);
        } else {
            page = clienteRepository.findAll(pageable);
        }

        return page.map(mapper::toDTO);
    }
    */
    @Transactional(readOnly = true)
    public Page<ClienteDTO> listar(Integer pessoaId,
                                   String pessoaNome,
                                   Pageable pageable) {

        Integer pessoaIdFiltro = pessoaId;
        String nomeFiltro = (pessoaNome != null && !pessoaNome.isBlank()) ? pessoaNome : null;

        Specification<CadCliente> spec = Specification.allOf();

        spec = spec
                .and(ClienteSpecifications.pessoaIdEquals(pessoaIdFiltro))
                .and(ClienteSpecifications.pessoaNomeContains(nomeFiltro));

        Page<CadCliente> page = clienteRepository.findAll(spec, pageable);

        return page.map(mapper::toDTO);
    }
    @Transactional(readOnly = true)
    public ClienteDTO buscarPorId(Integer id) {
        CadCliente entity = clienteRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Cliente não encontrado.",
                        "SAG-CLI-001",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));
        return mapper.toDTO(entity);
    }

    @Transactional
    public ClienteDTO criar(ClienteDTO dto) {

        log.info("Criando cliente para pessoaId={}", dto.getPessoaId());

        CadPessoa pessoa = pessoaRepository.findById(dto.getPessoaId())
                .orElseThrow(() -> new BusinessException(
                        "Pessoa vinculada ao cliente não encontrada.",
                        "SAG-PES-004",
                        HttpStatus.BAD_REQUEST,
                        ErrorType.BUSINESS_ERROR
                ));

        CadCliente entity = mapper.toEntity(dto);
        entity.setId(null); // garante INSERT
        entity.setPessoa(pessoa);

        CadCliente salvo = clienteRepository.save(entity);
        return mapper.toDTO(salvo);
    }

    @Transactional
    public ClienteDTO atualizar(Integer id, ClienteDTO dto) {
        CadCliente entity = clienteRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Cliente não encontrado para atualização.",
                        "SAG-CLI-002",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));

        CadPessoa pessoa = pessoaRepository.findById(dto.getPessoaId())
                .orElseThrow(() -> new BusinessException(
                        "Pessoa vinculada ao cliente não encontrada.",
                        "SAG-PES-005",
                        HttpStatus.BAD_REQUEST,
                        ErrorType.BUSINESS_ERROR
                ));

        mapper.updateEntityFromDTO(dto, entity);
        entity.setPessoa(pessoa);

        CadCliente salvo = clienteRepository.save(entity);
        return mapper.toDTO(salvo);
    }

    @Transactional
    public void excluir(Integer id) {
        CadCliente entity = clienteRepository.findById(id)
                .orElseThrow(() -> new BusinessException(
                        "Cliente não encontrado para exclusão.",
                        "SAG-CLI-003",
                        HttpStatus.NOT_FOUND,
                        ErrorType.NOT_FOUND
                ));

        clienteRepository.delete(entity);
    }
}

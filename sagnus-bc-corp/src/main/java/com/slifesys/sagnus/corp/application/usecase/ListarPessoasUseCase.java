package com.slifesys.sagnus.corp.application.usecase;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
import com.slifesys.sagnus.corp.contract.pessoa.PessoaDTO;
import com.slifesys.sagnus.corp.domain.model.pessoa.Pessoa;
import com.slifesys.sagnus.shared.paging.PageRequest;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ListarPessoasUseCase {

    private final PessoaRepository repo;

    @Transactional(readOnly = true)
    public PageResult<PessoaDTO> execute(String nome, String documento, PageRequest pageRequest) {
        PageResult<Pessoa> page = repo.search(nome, documento, pageRequest);
        return PageResult.<PessoaDTO>builder()
                .items(page.getItems().stream().map(this::toDTO).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }

    private PessoaDTO toDTO(Pessoa pessoa) {
        return PessoaDTO.builder()
                .id(pessoa.getId() != null ? pessoa.getId().getValue() : null)
                .tipo(com.slifesys.sagnus.corp.contract.pessoa.TipoPessoa.valueOf(pessoa.getTipo().name()))
                .documento(pessoa.getDocumento().getValue())
                .nome(pessoa.getNome().getValue())
                .email(pessoa.getEmail() != null ? pessoa.getEmail().getValue() : null)
                .site(pessoa.getSite())
                .ativa(pessoa.isAtiva())
                .build();
    }
}

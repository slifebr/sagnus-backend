package com.slifesys.sagnus.corp.application.usecase;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.corp.application.port.PessoaRepository;
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
    public PageResult<PessoaResult> execute(String nome, String documento, PageRequest pageRequest) {
        PageResult<Pessoa> page = repo.search(nome, documento, pageRequest);
        return PageResult.<PessoaResult>builder()
                .items(page.getItems().stream().map(p -> PessoaResult.builder()
                        .id(p.getId() != null ? p.getId().getValue() : null)
                        .tipo(p.getTipo())
                        .documento(p.getDocumento().getValue())
                        .nome(p.getNome().getValue())
                        .email(p.getEmail() != null ? p.getEmail().getValue() : null)
                        .site(p.getSite())
                        .ativa(p.isAtiva())
                        .build()).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

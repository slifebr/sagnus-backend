package com.slifesys.sagnus.corp.api.pessoa;

import com.slifesys.sagnus.corp.application.dto.PessoaResult;
import com.slifesys.sagnus.shared.paging.PageResult;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class PessoaPageResponse {
    private final List<PessoaResponse> items;
    private final long totalElements;
    private final int totalPages;
    private final int page;
    private final int size;

    public static PessoaPageResponse from(PageResult<PessoaResult> page) {
        return PessoaPageResponse.builder()
                .items(page.getItems().stream().map(PessoaResponse::from).toList())
                .totalElements(page.getTotalElements())
                .totalPages(page.getTotalPages())
                .page(page.getPage())
                .size(page.getSize())
                .build();
    }
}

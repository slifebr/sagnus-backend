package com.slifesys.sagnus.shared.paging;

import lombok.Builder;
import lombok.Getter;

import java.util.Collections;
import java.util.List;

/**
 * Database-agnostic paging result.
 */
@Getter
@Builder
public class PageResult<T> {
    private final List<T> items;
    private final long totalElements;
    private final int totalPages;
    private final int page;
    private final int size;

    public static <T> PageResult<T> empty(PageRequest req) {
        return PageResult.<T>builder()
                .items(Collections.emptyList())
                .totalElements(0)
                .totalPages(0)
                .page(req != null ? req.getPage() : 0)
                .size(req != null ? req.getSize() : 0)
                .build();
    }
}

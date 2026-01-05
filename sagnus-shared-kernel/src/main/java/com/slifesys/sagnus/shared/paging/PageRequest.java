package com.slifesys.sagnus.shared.paging;

import lombok.Builder;
import lombok.Getter;

/**
 * Database-agnostic paging request.
 */
@Getter
@Builder
public class PageRequest {
    /** 0-based page index */
    private final int page;
    /** page size */
    private final int size;
    /** optional sort field (camelCase from API, mapped in adapters) */
    private final String sortBy;
    /** optional sort direction */
    private final PageDirection direction;

    public static PageRequest of(int page, int size, String sortBy, PageDirection direction) {
        int p = Math.max(0, page);
        int s = Math.min(Math.max(1, size), 200);
        return PageRequest.builder()
                .page(p)
                .size(s)
                .sortBy(sortBy)
                .direction(direction == null ? PageDirection.ASC : direction)
                .build();
    }
}

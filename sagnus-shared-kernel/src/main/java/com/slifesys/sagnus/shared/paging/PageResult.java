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

    public PageResult(List<T> items, long totalElements, int totalPages, int page, int size) {
        this.items = items;
        this.totalElements = totalElements;
        this.totalPages = totalPages;
        this.page = page;
        this.size = size;
    }

    public static <T> Builder<T> builder() { return new Builder<>(); }

    public List<T> getItems() { return items; }
    public long getTotalElements() { return totalElements; }
    public int getTotalPages() { return totalPages; }
    public int getPage() { return page; }
    public int getSize() { return size; }

    public <U> PageResult<U> map(java.util.function.Function<? super T, U> converter) {
        List<U> newItems = items.stream().map(converter).collect(java.util.stream.Collectors.toList());
        return new PageResult<>(newItems, totalElements, totalPages, page, size);
    }

    public static <T> PageResult<T> empty(PageRequest req) {
        return new PageResult<>(Collections.emptyList(), 0, 0, req != null ? req.getPage() : 0, req != null ? req.getSize() : 0);
    }

    public static class Builder<T> {
        private List<T> items;
        private long totalElements;
        private int totalPages;
        private int page;
        private int size;

        public Builder<T> items(List<T> items) { this.items = items; return this; }
        public Builder<T> totalElements(long totalElements) { this.totalElements = totalElements; return this; }
        public Builder<T> totalPages(int totalPages) { this.totalPages = totalPages; return this; }
        public Builder<T> page(int page) { this.page = page; return this; }
        public Builder<T> size(int size) { this.size = size; return this; }

        public PageResult<T> build() {
            return new PageResult<>(items, totalElements, totalPages, page, size);
        }
    }
}

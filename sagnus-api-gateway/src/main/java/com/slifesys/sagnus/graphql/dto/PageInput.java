package com.slifesys.sagnus.graphql.dto;

public record PageInput(Integer page, Integer size, String sortBy, String sortDir) {
    public PageInput {
        if (page == null) page = 0;
        if (size == null) size = 20;
        if (sortDir == null) sortDir = "ASC";
    }
}

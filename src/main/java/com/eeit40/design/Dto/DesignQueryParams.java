package com.eeit40.design.Dto;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class DesignQueryParams {

    private String search;

    private String orderBy;

    private String sort;

    private Integer fetchNext;

    private Integer offset;

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getFetchNext() {
        return fetchNext;
    }

    public void setFetchNext(Integer fetchNext) {
        this.fetchNext = fetchNext;
    }

    public Integer getOffset() {
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public DesignQueryParams(String search) {
        this.search = search;
    }

    //    public void getSort(String sort) {
//    }
//
//    public void getFetchNext(Integer fetchNext) {
//    }
}

package com.eeit40.design.Util;

import java.util.List;

public class Page<T> {

    private Integer fetchNext;
    private Integer offset;
    private Integer total;
    private List<T> results;

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

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getResults() {
        return results;
    }

    public void setResults(List<T> results) {
        this.results = results;
    }
}

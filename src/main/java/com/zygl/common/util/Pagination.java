package com.zygl.common.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 描述：分页类
 * User: zy.niu
 * Date: 15-5-2
 * Time: 上午10:43
 */
public class Pagination<T> {
    private int total = 0;
    private List<T> rows = new ArrayList<T>();
    private int pageNumber = 1;
    private int pageSize = 10;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}

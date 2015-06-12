package com.zygl.domain.organization;

import javax.persistence.*;

/**
 * 描述：部门、组织架构
 * User:
 * Date: 2015/5/29
 * Time: 20:12
 */
@Entity
@Table(name = "sys_Organization")
public class OrganizationDomain {
    @Id
    private Long id;//主键id
    @Column
    private Long pId;//父id
    @Column
    private String organizationName;//部门名称
    @Column
    private Integer orderNo;//顺序

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }
}

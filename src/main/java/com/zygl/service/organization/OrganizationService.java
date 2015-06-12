package com.zygl.service.organization;

import com.zygl.domain.organization.OrganizationDomain;

import java.util.List;

/**
 * 描述：部门、组织架构Service
 * User:
 * Date: 2015/5/29
 * Time: 20:31
 */
public interface OrganizationService {
    /**
     * 根据pId获取部门list
     *
     * @param pId 上级id
     * @return 部门集合
     */
    public List<OrganizationDomain> getOrganizationByPid(Long pId) throws Exception;
}

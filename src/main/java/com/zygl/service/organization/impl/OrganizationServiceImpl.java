package com.zygl.service.organization.impl;

import com.zygl.dao.organization.OrganizationDao;
import com.zygl.domain.organization.OrganizationDomain;
import com.zygl.service.organization.OrganizationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 描述：
 * User:
 * Date: 2015/5/29
 * Time: 20:33
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Resource
    private OrganizationDao organizationDao;

    /**
     * 根据pId获取部门list
     *
     * @param pId 上级id
     * @return 部门集合
     */
    @Override
    public List<OrganizationDomain> getOrganizationByPid(Long pId) throws Exception {
        return organizationDao.getOrganizationByPid(pId);
    }
}

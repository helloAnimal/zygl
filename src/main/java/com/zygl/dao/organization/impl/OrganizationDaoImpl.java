package com.zygl.dao.organization.impl;

import com.zygl.dao.organization.OrganizationDao;
import com.zygl.domain.organization.OrganizationDomain;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * 描述：部门、组织架构DAO
 * User:
 * Date: 2015/5/29
 * Time: 20:18
 */
@Repository
public class OrganizationDaoImpl implements OrganizationDao {
    @PersistenceContext
    private EntityManager entityManager;

    /**
     * 根据pId获取部门list
     *
     * @param pId 上级id
     * @return 部门集合
     */
    @Override
    public List<OrganizationDomain> getOrganizationByPid(Long pId) throws Exception {
        String hql = "from OrganizationDomain t where t.pId=:pId order by t.orderNo asc";
        Query query = entityManager.createQuery(hql);
        query.setParameter("pId", pId);
        List<OrganizationDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }
}

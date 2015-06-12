package com.zygl.dao.login.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.zygl.domain.login.SysResourceDomain;
import org.springframework.stereotype.Repository;

import com.zygl.dao.login.SysResourceDao;

@Repository
public class SysResourceDaoImpl implements SysResourceDao {
    @PersistenceContext
    private EntityManager entityManager;

    /**
     * 根据父id获取菜单资源
     *
     * @param pid
     * @return
     */
    public List<SysResourceDomain> getTreeById(int pid) {
        Query query = entityManager.createQuery("from SysResourceDomain as t where t.pid=:pid order by t.orderNo asc", SysResourceDomain.class);
        query.setParameter("pid", pid);
        List<SysResourceDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }
}

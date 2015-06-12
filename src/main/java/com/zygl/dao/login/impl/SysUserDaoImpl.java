package com.zygl.dao.login.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.zygl.common.util.Pagination;

import com.zygl.domain.login.SysUserDomain;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.zygl.dao.login.SysUserDao;

@SuppressWarnings("unchecked")
@Repository
public class SysUserDaoImpl implements SysUserDao {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @PersistenceContext
    private EntityManager entityManager;

    /**
     * 根据账号查找账户信息
     */
    public SysUserDomain getByAccount(String account) {
        Query query = entityManager.createQuery("from SysUserDomain as o where o.account=:account", SysUserDomain.class);
        query.setParameter("account", account);
        List<SysUserDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    /**
     * 根据id获取用户信息
     *
     * @param id
     * @return
     */
    public SysUserDomain findSysUserDomainById(Long id) throws Exception {
        return entityManager.find(SysUserDomain.class, id);
    }

    /**
     * 修改用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean modifySysUser(SysUserDomain sysUserDomain) {
        try {
            entityManager.merge(sysUserDomain);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 查询所有的用户
     *
     * @return
     */
    public List<SysUserDomain> findSysUserDomainList() {
        Query query = entityManager.createQuery("from SysUserDomain", SysUserDomain.class);
        List<SysUserDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    /**
     * 分页条件查询
     *
     * @return
     */
    public Pagination<SysUserDomain> findSysUserDomainListByPagination(Pagination<SysUserDomain> pagination, SysUserDomain sysUserDomain) {
        // 根据条件拼装查询语句
        StringBuffer sb = new StringBuffer();
        sb.append("from SysUserDomain o ");
        sb.append("where 1=1 ");
        if (StringUtils.isNotBlank(sysUserDomain.getAccount()))
            sb.append("and o.account like:account ");
        if (StringUtils.isNotBlank(sysUserDomain.getRealName()))
            sb.append("and o.realName like:realName ");
        if (StringUtils.isNotBlank(sysUserDomain.getTelephone()))
            sb.append("and o.telephone like:telephone ");
        Query query = entityManager.createQuery(sb.toString(), SysUserDomain.class);
        if (StringUtils.isNotBlank(sysUserDomain.getAccount()))
            query.setParameter("account", "%" + sysUserDomain.getAccount() + "%");
        if (StringUtils.isNotBlank(sysUserDomain.getRealName()))
            query.setParameter("realName", "%" + sysUserDomain.getRealName() + "%");
        if (StringUtils.isNotBlank(sysUserDomain.getTelephone()))
            query.setParameter("telephone", "%" + sysUserDomain.getTelephone() + "%");
        int total = query.getResultList().size();
        if (total > 0) {
            query.setFirstResult((pagination.getPageNumber() - 1) * pagination.getPageSize());
            query.setMaxResults(pagination.getPageSize());
            pagination.setRows(query.getResultList());
            pagination.setTotal(total);
            return pagination;
        }
        return null;
    }

    /**
     * 添加用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean addSysUser(SysUserDomain sysUserDomain) {
        try {
            entityManager.persist(sysUserDomain);
            return true;
        } catch (Exception e) {
            logger.error("添加用户出错", e);
            return false;
        }
    }

    /**
     * 删除用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean deleteSysUserById(SysUserDomain sysUserDomain) {
        try {
            entityManager.remove(sysUserDomain);
            return true;
        } catch (Exception e) {
            logger.error("删除用户出错", e);
            return false;
        }
    }
}

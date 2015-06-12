package com.zygl.service.login.impl;

import javax.annotation.Resource;

import com.zygl.common.util.Pagination;
import com.zygl.common.util.StrUtils;

import com.zygl.domain.login.SysUserDomain;
import org.springframework.stereotype.Service;

import com.zygl.dao.login.SysUserDao;
import com.zygl.service.login.SysUserService;

import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Resource
    private SysUserDao sysUserDao;

    public SysUserDomain getByAccount(String account) {
        SysUserDomain user = null;
        try {
            user = sysUserDao.getByAccount(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean register(SysUserDomain user) {
        return false;
    }

    /**
     * 根据id获取用户信息
     *
     * @param id
     * @return
     */
    public SysUserDomain findSysUserDomainById(Long id) throws Exception {
        return sysUserDao.findSysUserDomainById(id);
    }

    /**
     * 修改用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean modifySysUser(SysUserDomain sysUserDomain) {
        return sysUserDao.modifySysUser(sysUserDomain);
    }

    /**
     * 查询所有的用户
     *
     * @return
     */
    public List<SysUserDomain> findSysUserDomainList() {
        return sysUserDao.findSysUserDomainList();
    }

    /**
     * 分页查询所有的用户
     *
     * @return
     */
    public Pagination<SysUserDomain> findSysUserDomainListByPagination(Pagination<SysUserDomain> pagination, SysUserDomain sysUserDomain) {
        return sysUserDao.findSysUserDomainListByPagination(pagination, sysUserDomain);
    }

    /**
     * 添加用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean addSysUser(SysUserDomain sysUserDomain) {
        sysUserDomain.setPassword(StrUtils.Md5("123"));
        return sysUserDao.addSysUser(sysUserDomain);
    }

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    public boolean deleteSysUserById(Long id) throws Exception {
        SysUserDomain sysUserDomain = sysUserDao.findSysUserDomainById(id);
        if (sysUserDomain != null) {
            return sysUserDao.deleteSysUserById(sysUserDomain);
        } else {
            return false;
        }
    }
}

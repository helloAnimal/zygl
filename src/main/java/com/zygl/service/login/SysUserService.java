package com.zygl.service.login;

import com.zygl.common.util.Pagination;
import com.zygl.domain.login.SysUserDomain;

import java.util.List;


public interface SysUserService {

    public SysUserDomain getByAccount(String account);

    public boolean register(SysUserDomain user);

    /**
     * 根据id获取用户信息
     *
     * @param id
     * @return
     */
    public SysUserDomain findSysUserDomainById(Long id) throws Exception;

    /**
     * 修改用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean modifySysUser(SysUserDomain sysUserDomain);

    /**
     * 查询所有的用户
     *
     * @return
     */
    public List<SysUserDomain> findSysUserDomainList();

    /**
     * 分页查询所有的用户
     *
     * @return
     */
    public Pagination<SysUserDomain> findSysUserDomainListByPagination(Pagination<SysUserDomain> pagination, SysUserDomain sysUserDomain);

    /**
     * 添加用户
     *
     * @param sysUserDomain
     * @return
     */
    public boolean addSysUser(SysUserDomain sysUserDomain);

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
    public boolean deleteSysUserById(Long id) throws Exception;

}

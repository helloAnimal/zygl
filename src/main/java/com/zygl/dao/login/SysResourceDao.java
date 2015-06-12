package com.zygl.dao.login;

import java.util.List;

import com.zygl.domain.login.SysResourceDomain;

/**
 * 菜单表
 *
 * @author user
 */
public interface SysResourceDao {
    /**
     * 根据父id获取菜单资源
     *
     * @param id
     * @return
     */
    public List<SysResourceDomain> getTreeById(int id);
}

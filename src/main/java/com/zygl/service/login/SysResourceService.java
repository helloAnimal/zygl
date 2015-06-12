package com.zygl.service.login;

import java.util.List;

import com.zygl.domain.login.SysResourceDomain;

public interface SysResourceService {
    /**
     * 根据父id获取菜单资源
     *
     * @param pid
     * @return
     */
    public List<SysResourceDomain> getTreeById(int pid);
}

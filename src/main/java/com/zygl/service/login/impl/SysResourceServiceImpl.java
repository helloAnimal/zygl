package com.zygl.service.login.impl;

import java.util.List;

import javax.annotation.Resource;

import com.zygl.domain.login.SysResourceDomain;
import org.springframework.stereotype.Service;

import com.zygl.dao.login.SysResourceDao;
import com.zygl.service.login.SysResourceService;

/**
 * 菜单资源service
 *
 * @author user
 */
@Service
public class SysResourceServiceImpl implements SysResourceService {

    @Resource
    private SysResourceDao sysResourceDao;

    /**
     * 根据父id获取菜单资源
     *
     * @param pid
     * @return
     */
    public List<SysResourceDomain> getTreeById(int pid) {
        List<SysResourceDomain> list = sysResourceDao.getTreeById(pid);
        return list;
    }

}

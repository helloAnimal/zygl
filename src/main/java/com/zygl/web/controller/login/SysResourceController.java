package com.zygl.web.controller.login;

import java.util.List;

import javax.annotation.Resource;

import com.zygl.domain.login.SysResourceDomain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zygl.service.login.SysResourceService;

@RequestMapping(value = "/login")
@Controller
public class SysResourceController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SysResourceService sysResourceService;

    /**
     * 异步加载菜单资源
     */
    @ResponseBody
    @RequestMapping(value = "tree.do", method = RequestMethod.POST)
    public List<SysResourceDomain> getTreeById(SysResourceDomain sysResourceDomain) {
        List<SysResourceDomain> list = sysResourceService.getTreeById(sysResourceDomain.getId());
        return list;
    }

}

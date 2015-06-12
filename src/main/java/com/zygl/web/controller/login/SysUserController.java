package com.zygl.web.controller.login;

import javax.annotation.Resource;

import com.zygl.common.util.Pagination;
import com.zygl.common.util.StrUtils;

import com.zygl.domain.login.SysUserDomain;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zygl.common.util.CurrentInfoUtils;
import com.zygl.service.login.SysUserService;


/**
 * 用户信息
 *
 * @author user
 */
@Controller
@RequestMapping("/login")
public class SysUserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SysUserService sysUserService;

    /**
     * 根据id获取用户信息
     *
     * @return
     */
    @RequestMapping(value = "findSysUserDomainById.do", method = RequestMethod.GET)
    public String findSysUserDomainById(Long id, Model model) {
        try {
            SysUserDomain sysUserDomain = sysUserService.findSysUserDomainById(id);
            if (sysUserDomain != null) {
                model.addAttribute(sysUserDomain);
                return "forward:/sysuser/sysuser_edit.jsp";
            }
        } catch (Exception e) {
            logger.error("error", e);
        }
        return null;
    }

    /**
     * 修改用户密码
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "modifySysUserPassword.do", method = RequestMethod.POST)
    public boolean modifySysUserPassword(String password) {
        if (password != null) {
            SysUserDomain sysUserDomain = CurrentInfoUtils.getCurrentUser();
            if (sysUserDomain != null) {
                sysUserDomain.setPassword(StrUtils.Md5(password));
            }
            //更新用户信息
            sysUserService.modifySysUser(sysUserDomain);
            return true;
        }
        return false;
    }

    /**
     * 查询所有的用户
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findSysUserDomainList.do", method = RequestMethod.POST)
    public Pagination<SysUserDomain> findSysUserDomainList(SysUserDomain sysUserDomain, Pagination<SysUserDomain> pagination, Model model) {
        pagination = sysUserService.findSysUserDomainListByPagination(pagination, sysUserDomain);
        if (pagination != null) {
            return pagination;
        }
        return new Pagination<SysUserDomain>();
    }

    /**
     * 修改用户信息
     *
     * @param view
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "modifySysUser.do", method = RequestMethod.POST)
    public boolean modifySysUser(SysUserDomain view) {
        try {
            SysUserDomain sysUserDomain = sysUserService.findSysUserDomainById(view.getId());
            if (sysUserDomain != null) {
                sysUserDomain.setAccount(view.getAccount());
                sysUserDomain.setRealName(view.getRealName());
                sysUserDomain.setOrganizationId(view.getOrganizationId());
                sysUserDomain.setMobilePhone(view.getMobilePhone());
                sysUserDomain.setTelephone(view.getTelephone());
                sysUserDomain.setEmail(view.getEmail());
                sysUserDomain.setPresentAddress(view.getPresentAddress());
                sysUserDomain.setProvince(view.getProvince());
                sysUserDomain.setCity(view.getCity());
                sysUserDomain.setNativePlace(view.getNativePlace());
                sysUserDomain.setEmergencyContact(view.getEmergencyContact());
                sysUserDomain.setEmergencyPhone(view.getEmergencyPhone());
                sysUserDomain.setPostalcode(view.getPostalcode());
                sysUserService.modifySysUser(sysUserDomain);
                logger.info("用户修改成功！");
                return true;
            }
        } catch (Exception e) {
            logger.error("error", e);
            return false;
        }
        return false;
    }

    /**
     * 添加用户
     *
     * @param sysUserDomain
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addSysUser.do", method = RequestMethod.POST)
    public boolean addSysUser(SysUserDomain sysUserDomain, Model model) {
        boolean flag = sysUserService.addSysUser(sysUserDomain);
        return flag;
    }

    /**
     * 判断用户名是否存在
     *
     * @param account
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getByAccount.do", method = RequestMethod.POST)
    public boolean getByAccount(String account) {
        SysUserDomain sysUserDomain = sysUserService.getByAccount(account);
        if (sysUserDomain == null) {
            return true;
        }
        return false;
    }

    /**
     * 删除用户
     *
     * @param id
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteSysUserById.do", method = RequestMethod.POST)
    public boolean deleteSysUserById(Long id, Model model) {
        boolean flag = false;
        try {
            flag = sysUserService.deleteSysUserById(id);
        } catch (Exception e) {
            logger.error("error", e);
        }
        return flag;
    }

    /**
     * 根据id获取用户信息
     *
     * @return
     */
    @RequestMapping(value = "findCurrentSysUserDomainById.do", method = RequestMethod.GET)
    public String findCurrentSysUserDomainById(Model model) {
        try {
            SysUserDomain sysUserDomain = CurrentInfoUtils.getCurrentUser();
            if (sysUserDomain != null) {
                model.addAttribute(sysUserDomain);
                return "forward:/sysuser/sysuser_edit.jsp";
            }
        } catch (Exception e) {
            logger.error("error", e);
        }
        return null;
    }
}

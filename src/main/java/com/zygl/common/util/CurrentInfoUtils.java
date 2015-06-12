package com.zygl.common.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.zygl.domain.login.SysUserDomain;

/**
 * 获取当前登陆信息
 *
 * @author user
 */
public class CurrentInfoUtils {
    /**
     * 获取当前登陆人信息
     *
     * @return
     */
    public static SysUserDomain getCurrentUser() {
        Subject subject = SecurityUtils.getSubject();
        SysUserDomain sysUserDomain = (SysUserDomain) subject.getSession().getAttribute("sysUserDomain");
        //将密码至空
        sysUserDomain.setPassword(null);
        return sysUserDomain;
    }

    /**
     * 获取当前登陆人账号
     */
    public static String getCurrentUserAccount() {
        Subject subject = SecurityUtils.getSubject();
        SysUserDomain sysUserDomain = (SysUserDomain) subject.getSession().getAttribute("sysUserDomain");
        return sysUserDomain.getAccount();
    }
}

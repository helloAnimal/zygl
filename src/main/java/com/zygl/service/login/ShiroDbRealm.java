package com.zygl.service.login;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;

import com.zygl.domain.login.SysUserDomain;

public class ShiroDbRealm extends AuthorizingRealm {

    @Resource
    private SysUserService sysUserService;

    /**
     * 授权： 处理登陆人员权限等
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

    /**
     * 认证： 登陆时调用
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        SysUserDomain sysUserDomain = sysUserService.getByAccount(token.getUsername());
        if (sysUserDomain != null) {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession();
            session.setAttribute("sysUserDomain", sysUserDomain);
            return new SimpleAuthenticationInfo(sysUserDomain.getAccount(), sysUserDomain.getPassword(), getName());
        } else {
            return null;
        }
    }

}

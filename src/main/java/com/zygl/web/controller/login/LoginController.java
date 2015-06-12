package com.zygl.web.controller.login;

import com.zygl.domain.login.SysUserDomain;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class LoginController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 判断用户是否登录
     *
     * @param sysUserDomain
     * @return
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(SysUserDomain sysUserDomain, Model model) {
        Subject subject = SecurityUtils.getSubject();
        logger.info("登陆账号【" + sysUserDomain.getAccount() + "】");
        UsernamePasswordToken token = new UsernamePasswordToken(sysUserDomain.getAccount(), sysUserDomain.getPassword());
        token.setRememberMe(true);
        try {
            subject.login(token);
            logger.info("用户【" + sysUserDomain.getAccount() + "】登陆成功");
            return "redirect:/login/main.jsp";
        } catch (AuthenticationException e) {
            logger.error("用户【" + sysUserDomain.getAccount() + "】登陆失败");
            logger.error("登录失败错误信息:" + e);
            model.addAttribute("message", "登陆失败！");
            token.clear();
            return "forward:/login/login.jsp";
        }
    }

    /**
     * 登出
     */
    @ResponseBody
    @RequestMapping("/loginOut.do")
    public boolean loginOut() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            logger.info("用户【" + subject.getPrincipal() + "】退出成功");
            subject.logout();
            return true;
        }
        return false;
    }
}

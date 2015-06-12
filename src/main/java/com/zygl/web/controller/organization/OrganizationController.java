package com.zygl.web.controller.organization;

import com.zygl.domain.organization.OrganizationDomain;
import com.zygl.service.organization.OrganizationService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


/**
 * 描述：机构管理
 * User:
 * Date: 2015/5/29
 * Time: 17:14
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private OrganizationService organizationService;

    /**
     * 根据pId获取部门list
     *
     * @param organizationDomain
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "getOrganizationByPid.do", method = RequestMethod.GET)
    public List<OrganizationDomain> getOrganizationByPid(OrganizationDomain organizationDomain, Model model) {
        try {
            List<OrganizationDomain> list = organizationService.getOrganizationByPid(organizationDomain.getId());
            return list;
        } catch (Exception e) {
            logger.error("error", e);
        }
        return null;
    }
}

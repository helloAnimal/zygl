package com.zygl.web.controller.area;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zygl.domain.area.AreaDomain;
import com.zygl.domain.area.CityDomain;
import com.zygl.domain.area.ProvinceDomain;
import com.zygl.service.area.AreaService;

@RequestMapping(value = "/area")
@Controller
public class AreaController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private AreaService areaService;

    /**
     * 获取省
     */
    @RequestMapping(value = "getProvinceDomains.do", method = RequestMethod.POST)
    @ResponseBody
    public List<ProvinceDomain> getProvinceDomains(Model model) {
        List<ProvinceDomain> list = areaService.getProvinceDomains();
        if (list != null) {
            ProvinceDomain provinceDomain = new ProvinceDomain();
            provinceDomain.setProvince("--请选择--");
            list.add(0, provinceDomain);
            return list;
        }
        return null;
    }

    @RequestMapping(value = "getCityDomainByProvinceId.do", method = RequestMethod.POST)
    @ResponseBody
    public List<CityDomain> getCityDomainByProvinceId(String provinceId, Model model) {
        List<CityDomain> list = new ArrayList<CityDomain>();
        CityDomain cityDomain = new CityDomain();
        cityDomain.setCity("--请选择--");
        list.add(0, cityDomain);
        List<CityDomain> cityDomainList = areaService.getCityDomainsByProvinceId(provinceId);
        if (cityDomainList != null) {
            list.addAll(cityDomainList);
        }
        return list;

    }

    @RequestMapping(value = "getAreaDomainsByCityId.do", method = RequestMethod.POST)
    @ResponseBody
    public List<AreaDomain> getAreaDomainsByCityId(String cityId, Model model) {
        List<AreaDomain> list = new ArrayList<AreaDomain>();
        AreaDomain areaDomain = new AreaDomain();
        areaDomain.setArea("--请选择--");
        list.add(0, areaDomain);
        List<AreaDomain> areaDomainList = areaService.getAreaDomainsByCityId(cityId);
        if (areaDomainList != null) {
            list.addAll(areaDomainList);
        }
        return list;
    }
}

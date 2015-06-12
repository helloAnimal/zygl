package com.zygl.service.area.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zygl.dao.area.AreaDao;
import com.zygl.domain.area.AreaDomain;
import com.zygl.domain.area.CityDomain;
import com.zygl.domain.area.ProvinceDomain;
import com.zygl.service.area.AreaService;

@Service
public class AreaServiceImpl implements AreaService {
    @Resource
    private AreaDao areaDao;

    public List<ProvinceDomain> getProvinceDomains() {
        return areaDao.getProvinceDomains();
    }

    public List<CityDomain> getCityDomainsByProvinceId(String provinceId) {
        return areaDao.getCityDomainsByProvinceId(provinceId);
    }

    public List<AreaDomain> getAreaDomainsByCityId(String cityId) {
        return areaDao.getAreaDomainsByCityId(cityId);
    }
}

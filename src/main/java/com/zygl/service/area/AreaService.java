package com.zygl.service.area;

import java.util.List;

import com.zygl.domain.area.AreaDomain;
import com.zygl.domain.area.CityDomain;
import com.zygl.domain.area.ProvinceDomain;

public interface AreaService {
    public List<ProvinceDomain> getProvinceDomains();

    public List<CityDomain> getCityDomainsByProvinceId(String provinceId);

    public List<AreaDomain> getAreaDomainsByCityId(String cityId);
}

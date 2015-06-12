package com.zygl.dao.area;

import java.util.List;


import com.zygl.domain.area.AreaDomain;
import com.zygl.domain.area.CityDomain;
import com.zygl.domain.area.ProvinceDomain;

public interface AreaDao {
    public List<ProvinceDomain> getProvinceDomains();

    public List<CityDomain> getCityDomainsByProvinceId(String provinceId);

    public List<AreaDomain> getAreaDomainsByCityId(String cityId);
}

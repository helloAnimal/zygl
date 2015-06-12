package com.zygl.dao.area.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.zygl.dao.area.AreaDao;
import com.zygl.domain.area.AreaDomain;
import com.zygl.domain.area.CityDomain;
import com.zygl.domain.area.ProvinceDomain;

@Repository
public class AreaDaoImpl implements AreaDao {
    @PersistenceContext
    private EntityManager entityManager;

    public List<ProvinceDomain> getProvinceDomains() {
        String hql = "from ProvinceDomain";
        Query query = entityManager.createQuery(hql);
        List<ProvinceDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    public List<CityDomain> getCityDomainsByProvinceId(String provinceId) {
        String hql = "from CityDomain o where o.provinceId=:provinceId";
        Query query = entityManager.createQuery(hql);
        query.setParameter("provinceId", provinceId);
        List<CityDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    public List<AreaDomain> getAreaDomainsByCityId(String cityId) {
        String hql = "from AreaDomain o where o.cityId=:cityId";
        Query query = entityManager.createQuery(hql);
        query.setParameter("cityId", cityId);
        List<AreaDomain> list = query.getResultList();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }
}

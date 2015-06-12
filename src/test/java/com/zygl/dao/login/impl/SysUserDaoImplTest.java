package com.zygl.dao.login.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zygl.dao.login.SysUserDao;
import com.zygl.domain.login.SysUserDomain;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml"})
public class SysUserDaoImplTest {
    @Resource
    private SysUserDao sysUserDao;
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//		String[] xmlCfg = new String[] { "classpath:applicationContext.xml","classpath:spring-mvc.xml"};  
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(xmlCfg);
//	}

    @Test
    public void testGetByAccount() {
        SysUserDomain sysUserDomain = sysUserDao.getByAccount("admin");
        System.out.println(sysUserDomain.getAccount());
    }

    @Test
    public void testFindSysUserModelById() {
    }

    @Test
    public void testModifySysUserPassword() {
    }

    @Test
    public void testFindSysUserModelList() {
    }

    @Test
    public void testFindSysUserModelListByPagination() {
    }

}

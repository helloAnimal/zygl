-- ----------------------------
-- Table 行政区域县区信息表 for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` int(11) NOT NULL auto_increment,
  `areaid` varchar(20) NOT NULL,
  `area` varchar(50) NOT NULL,
  `cityid` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='行政区域县区信息表';

-- ----------------------------
-- Table 行政区域地州市信息表 for sys_city
-- ----------------------------
DROP TABLE IF EXISTS `sys_city`;
CREATE TABLE `sys_city` (
  `id` int(11) NOT NULL auto_increment,
  `cityid` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `provinceid` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='行政区域地州市信息表';
-- ----------------------------
-- Table structure for sys_zip_code
-- ----------------------------
DROP TABLE IF EXISTS `sys_zip_code`;
CREATE TABLE `sys_zip_code` (
  `id` int(11) NOT NULL auto_increment,
  `areaid` varchar(20) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Table 机构 for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `orderNo` int(11) default NULL COMMENT '编号',
  `organizationName` varchar(255) default NULL COMMENT '籍贯名称',
  `pId` bigint(20) default NULL COMMENT '父ID',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构';

-- ----------------------------
-- Table 省份信息表 for sys_province
-- ----------------------------
DROP TABLE IF EXISTS `sys_province`;
CREATE TABLE `sys_province` (
  `id` int(11) NOT NULL auto_increment,
  `provinceid` varchar(20) NOT NULL,
  `province` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份信息表';

-- ----------------------------
-- Table 菜单 for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` int(11) NOT NULL COMMENT 'id',
  `pid` int(11) default NULL COMMENT '父id',
  `state` varchar(10) default NULL COMMENT '状态 open closed',
  `text` varchar(50) default NULL COMMENT '菜单显示名字',
  `url` varchar(200) default NULL COMMENT '链接',
  `orderNo` int(11) default NULL COMMENT '排序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Table 医院人员 for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键',
  `account` varchar(50) default NULL COMMENT '登陆账号',
  `city` int(11) default NULL COMMENT '市',
  `country` int(11) default NULL COMMENT '国家',
  `email` varchar(50) default NULL COMMENT '邮箱',
  `emergencyContact` varchar(50) default NULL COMMENT '紧急联系人',
  `emergencyPhone` varchar(20) default NULL COMMENT '紧急联系人电话',
  `mobilePhone` varchar(20) default NULL COMMENT '手机',
  `nativePlace` varchar(300) default NULL COMMENT '籍贯',
  `password` varchar(100) default NULL COMMENT '密码',
  `postalcode` varchar(50) default NULL COMMENT '邮编',
  `presentAddress` varchar(300) default NULL COMMENT '当前住址',
  `province` int(11) default NULL COMMENT '省',
  `telephone` varchar(20) default NULL,
  `realName` varchar(50) default NULL,
  `department` int(11) default NULL,
  `organizationId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_awpog86ljqwb89aqa1c5gvdrd` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医院人员';


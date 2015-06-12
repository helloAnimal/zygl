-- ----------------------------
-- Records of sys_resource 菜单表
-- ----------------------------
--先清空原数据
delete from `sys_resource`;
INSERT INTO `sys_resource` VALUES ('1', '0', 'closed', '系统管理', null, '0');
INSERT INTO `sys_resource` VALUES ('2', '0', 'closed', '住院管理', null, '0');
INSERT INTO `sys_resource` VALUES ('3', '1', 'open', '个人信息', '/login/findCurrentSysUserDomainById.do', '2');
INSERT INTO `sys_resource` VALUES ('5', '2', 'open', '病房管理', null, '1');
INSERT INTO `sys_resource` VALUES ('6', '1', 'open', '修改密码', '/sysuser/sysuser_pwd_edit.jsp', '3');
INSERT INTO `sys_resource` VALUES ('7', '1', 'open', '用户管理', '/sysuser/sysuer_search.jsp', '4');
INSERT INTO `sys_resource` VALUES ('8', '1', 'open', '省市区', '/area/area.jsp', '5');
INSERT INTO `sys_resource` VALUES ('9', '1', 'open', '首页', '/login/center.jsp', '1');

-- ----------------------------
-- Records of sys_user 医院人员表
-- ----------------------------
--先清空原数据
delete from `sys_user`;
INSERT INTO `sys_user` VALUES ('1', 'admin', '150300', null, '15012654769@qq.com', '路人', '15012654769', '15012654769', '山西省大同市', '202cb962ac59075b964b07152d234b70', '110101', '山西省大同市', '150000', '15012654769', '系统管理员', '11', '1122');
INSERT INTO `sys_user` VALUES ('33', '1001', '130200', null, '1534023616@qq.com', '路人乙', '15036047372', '64860206', '河北省唐山市', '202cb962ac59075b964b07152d234b70', '110101', '河北省唐山市', '130000', '15012654769', '路人①', '33', null);
INSERT INTO `sys_user` VALUES ('35', '1003', '150200', null, '15012654769@qq.com', '路人', '15012654769', '15012654769', '内蒙古自治区包头市', '202cb962ac59075b964b07152d234b70', '100101', '内蒙古自治区包头市', '150000', '15012654769', '路人②', '22', null);
INSERT INTO `sys_user` VALUES ('38', '1004', '130200', null, '', '', '', '', '', '202cb962ac59075b964b07152d234b70', '', '', '130000', '', '路人③', '22', null);
INSERT INTO `sys_user` VALUES ('39', '1005', '210900', null, '', '', '', '', '', '202cb962ac59075b964b07152d234b70', '', '', '210000', '', '路人④', null, null);
INSERT INTO `sys_user` VALUES ('40', '1006', null, null, '', '', '', '', '', '202cb962ac59075b964b07152d234b70', '', '', null, '', '路人⑤', null, null);
INSERT INTO `sys_user` VALUES ('41', '1007', null, null, '', '', '', '', '', '202cb962ac59075b964b07152d234b70', '', '', null, '', '路人⑥', null, null);
INSERT INTO `sys_user` VALUES ('43', 'system', '140400', null, '22222@qq.com', '123', '123', '222222222', '123', '202cb962ac59075b964b07152d234b70', '123', '123', '140000', '123333', '小管理员', null, '11');

/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : infosys

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2017-07-07 08:55:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dept`;
CREATE TABLE `t_sys_dept` (
  `deptid` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `deptcode` varchar(30) DEFAULT NULL COMMENT '部门代码',
  `dpetname` varchar(30) DEFAULT NULL COMMENT '部门名称',
  `manager` int(11) DEFAULT NULL COMMENT '部门经理',
  `parent` int(11) DEFAULT NULL COMMENT '父部门',
  `deptlevel` int(4) DEFAULT NULL COMMENT '部门级别,1总部2地区3.部门',
  `delflag` int(1) DEFAULT '1' COMMENT '标志',
  PRIMARY KEY (`deptid`),
  KEY `FK_t_sys_dept_parent` (`parent`),
  CONSTRAINT `FK_t_sys_dept_parent` FOREIGN KEY (`parent`) REFERENCES `t_sys_dept` (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of t_sys_dept
-- ----------------------------
INSERT INTO `t_sys_dept` VALUES ('1', 'GSZB', '公司总部', null, null, '1', '1');
INSERT INTO `t_sys_dept` VALUES ('2', 'ZZDQ', '郑州地区', null, '1', '2', '1');
INSERT INTO `t_sys_dept` VALUES ('3', 'RLZYB', '人力资源部', null, '2', '3', '1');

-- ----------------------------
-- Table structure for `t_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_menu`;
CREATE TABLE `t_sys_menu` (
  `menuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `url` varchar(200) DEFAULT NULL COMMENT '连接',
  `parent` int(11) DEFAULT NULL COMMENT '父菜单',
  `target` varchar(50) DEFAULT NULL COMMENT '目标',
  `idx` int(4) DEFAULT NULL COMMENT '排序',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`menuid`),
  KEY `FK_t_sys_menu_parent` (`parent`),
  CONSTRAINT `FK_t_sys_menu_parent` FOREIGN KEY (`parent`) REFERENCES `t_sys_menu` (`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of t_sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_position`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_position`;
CREATE TABLE `t_sys_position` (
  `postid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `postname` varchar(20) DEFAULT NULL COMMENT '岗位名称',
  `obligatory` varchar(20) DEFAULT NULL COMMENT '岗位职责',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表';

-- ----------------------------
-- Records of t_sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_position_level`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_position_level`;
CREATE TABLE `t_sys_position_level` (
  `plevelid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `plevelname` varchar(20) DEFAULT NULL COMMENT '职级名称',
  `parent` int(11) DEFAULT NULL COMMENT '父级别',
  `idx` int(4) DEFAULT NULL COMMENT '排序',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`plevelid`),
  KEY `FK_t_sys_position_level_parent` (`parent`),
  CONSTRAINT `FK_t_sys_position_level_parent` FOREIGN KEY (`parent`) REFERENCES `t_sys_position_level` (`plevelid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职务级别表';

-- ----------------------------
-- Records of t_sys_position_level
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `rolecode` varchar(30) DEFAULT NULL COMMENT '角色编码',
  `rolename` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_menu`;
CREATE TABLE `t_sys_role_menu` (
  `id` int(11) NOT NULL COMMENT 'ROLEFUNID',
  `roleid` int(11) DEFAULT NULL COMMENT '角色ID',
  `menuid` int(11) DEFAULT NULL COMMENT '功能ID',
  PRIMARY KEY (`id`),
  KEY `FK_t_sys_role_menu_roleid` (`roleid`),
  KEY `FK_t_sys_role_menu_menuid` (`menuid`),
  CONSTRAINT `FK_t_sys_role_menu_menuid` FOREIGN KEY (`menuid`) REFERENCES `t_sys_menu` (`menuid`),
  CONSTRAINT `FK_t_sys_role_menu_roleid` FOREIGN KEY (`roleid`) REFERENCES `t_sys_role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of t_sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `usercode` varchar(30) DEFAULT NULL COMMENT '用户代码',
  `username` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `deptid` int(11) DEFAULT NULL COMMENT '部门编号',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `postid` int(11) DEFAULT NULL COMMENT '岗位编号',
  `plevelid` int(11) DEFAULT NULL COMMENT '职务级别',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `cellphone` varchar(30) DEFAULT NULL COMMENT '手机',
  `home_phone` varchar(30) DEFAULT NULL COMMENT '家庭电话',
  `office_phone` varchar(30) DEFAULT NULL COMMENT '办公电话',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭地址',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `pic` int(11) DEFAULT NULL COMMENT '照片',
  `loginIp` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `loginDate` date DEFAULT NULL COMMENT '最后登录时间',
  `delflag` int(1) DEFAULT '1' COMMENT '删除标志',
  PRIMARY KEY (`userid`),
  KEY `FK_t_sys_user_deptid` (`deptid`),
  KEY `FK_t_sys_user_postid` (`postid`),
  KEY `FK_t_sys_user_plevelid` (`plevelid`),
  CONSTRAINT `FK_t_sys_user_deptid` FOREIGN KEY (`deptid`) REFERENCES `t_sys_dept` (`deptid`),
  CONSTRAINT `FK_t_sys_user_plevelid` FOREIGN KEY (`plevelid`) REFERENCES `t_sys_position_level` (`plevelid`),
  CONSTRAINT `FK_t_sys_user_postid` FOREIGN KEY (`postid`) REFERENCES `t_sys_position` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for `t_sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user_role`;
CREATE TABLE `t_sys_user_role` (
  `urid` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `roleid` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`urid`),
  KEY `FK_t_sys_user_role_userid` (`userid`),
  KEY `FK_t_sys_user_role_roleid` (`roleid`),
  CONSTRAINT `FK_t_sys_user_role_roleid` FOREIGN KEY (`roleid`) REFERENCES `t_sys_role` (`roleid`),
  CONSTRAINT `FK_t_sys_user_role_userid` FOREIGN KEY (`userid`) REFERENCES `t_sys_user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of t_sys_user_role
-- ----------------------------

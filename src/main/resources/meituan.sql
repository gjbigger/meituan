/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : meituan

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-06-22 20:54:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('2', '好', '1', '4');
INSERT INTO `t_comment` VALUES ('3', '中评', '2', '3');
INSERT INTO `t_comment` VALUES ('4', '非常好', '10', '4');
INSERT INTO `t_comment` VALUES ('5', '', '13', '3');
INSERT INTO `t_comment` VALUES ('6', '好', '15', '3');
INSERT INTO `t_comment` VALUES ('7', 'fghkfglful', '17', '4');
INSERT INTO `t_comment` VALUES ('8', 'hjk;j', '20', '4');

-- ----------------------------
-- Table structure for t_dish
-- ----------------------------
DROP TABLE IF EXISTS `t_dish`;
CREATE TABLE `t_dish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `monthSales` int(11) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dish
-- ----------------------------
INSERT INTO `t_dish` VALUES ('1', '翅桶', '100', '0', '1', '1', null);
INSERT INTO `t_dish` VALUES ('2', '巨无霸', '20', '0', '1', '2', null);
INSERT INTO `t_dish` VALUES ('3', '可乐', '8', '0', '1', '3', null);
INSERT INTO `t_dish` VALUES ('4', '鸡米花', '10', '9', '5', '6', null);
INSERT INTO `t_dish` VALUES ('6', 'fghfgh', '60', '9', '5', '5', '57');

-- ----------------------------
-- Table structure for t_dish_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dish_type`;
CREATE TABLE `t_dish_type` (
  `name` varchar(255) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dish_type
-- ----------------------------
INSERT INTO `t_dish_type` VALUES ('全家桶', '1', '1');
INSERT INTO `t_dish_type` VALUES ('汉堡类', '1', '2');
INSERT INTO `t_dish_type` VALUES ('饮品', '1', '3');
INSERT INTO `t_dish_type` VALUES ('小吃类', '1', '4');
INSERT INTO `t_dish_type` VALUES ('a', '5', '5');
INSERT INTO `t_dish_type` VALUES ('rhsfjdrtf', '5', '6');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `startSendTime` datetime DEFAULT NULL,
  `endSendTime` datetime DEFAULT NULL,
  `payOrNot` int(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `storeId` int(255) DEFAULT NULL,
  `dishDetail` varchar(255) DEFAULT NULL,
  `totalMoney` double(11,0) DEFAULT NULL,
  `userReceiveInfoId` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', '-1', '2017-06-04 13:09:04', null, '0', '2017-06-04 11:28:51', '2017-06-04 13:13:23', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('2', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('3', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('4', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('5', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('6', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('7', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('8', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('9', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('10', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('11', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('12', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('13', '1', '2017-06-04 13:46:39', null, '0', '2017-06-04 11:28:51', '2017-06-04 13:46:39', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('14', '-1', '2017-06-04 13:13:45', null, '0', '2017-06-04 11:28:51', '2017-06-04 13:46:48', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('15', '0', '2017-06-04 11:28:40', null, '0', '2017-06-04 11:28:51', '2017-06-04 11:28:55', '5', '汉堡', '100', '2', null);
INSERT INTO `t_order` VALUES ('16', '1', '2017-06-04 23:35:08', null, '0', '2017-06-04 22:27:23', '2017-06-04 23:41:21', '5', '6-fghfgh*60/1', '60', '9', 'sgsgsdfgd');
INSERT INTO `t_order` VALUES ('17', '2', '2017-06-04 23:24:10', '2017-06-05 00:05:10', '0', '2017-06-04 22:29:05', '2017-06-05 00:05:10', '5', '4-鸡米花*10/1', '10', '11', 'hj.;jbhk;uj;uji;');
INSERT INTO `t_order` VALUES ('18', '2', '2017-06-04 23:27:01', '2017-06-04 23:43:13', '0', '2017-06-04 22:30:03', '2017-06-04 23:43:13', '5', '4-鸡米花*10/1', '10', '9', '5555555555555555555');
INSERT INTO `t_order` VALUES ('19', '2', '2017-06-04 22:32:11', '2017-06-04 23:42:32', '1', '2017-06-04 22:30:25', '2017-06-04 23:42:32', '5', '6-fghfgh*60/2,4-鸡米花*10/2', '140', '9', 'drykyul;t78;tu7;8');
INSERT INTO `t_order` VALUES ('20', '2', '2017-06-05 09:53:40', '2017-06-05 09:53:55', '0', '2017-06-05 09:53:19', '2017-06-05 09:53:55', '5', '6-fghfgh*60/4', '240', '13', 'dddd');

-- ----------------------------
-- Table structure for t_store
-- ----------------------------
DROP TABLE IF EXISTS `t_store`;
CREATE TABLE `t_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeLoginName` varchar(255) DEFAULT NULL,
  `storePwd` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `hours` varchar(11) DEFAULT NULL,
  `leastMoney` double(11,0) DEFAULT NULL,
  `fee` double(11,0) DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `avgSendTime` double(11,0) DEFAULT NULL,
  `openOrClose` int(255) DEFAULT NULL,
  `monthSell` int(11) DEFAULT NULL,
  `star` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_store
-- ----------------------------
INSERT INTO `t_store` VALUES ('5', 'gj', '123', '肯德基', '长春', '138138', '上10~晚8', '10', '0', '好吃不贵zzzz', '2', '1', '111', '3');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('2', 'gj', '123');
INSERT INTO `t_user` VALUES ('3', 'test', 'test');
INSERT INTO `t_user` VALUES ('6', 'gjc', '123');

-- ----------------------------
-- Table structure for t_user_receive_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_receive_info`;
CREATE TABLE `t_user_receive_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_receive_info
-- ----------------------------
INSERT INTO `t_user_receive_info` VALUES ('2', '1', '15764334507', '吉林长春');
INSERT INTO `t_user_receive_info` VALUES ('3', '0', '15900855512', '上海嘉定');
INSERT INTO `t_user_receive_info` VALUES ('9', '2', '789', '上海');
INSERT INTO `t_user_receive_info` VALUES ('10', '4', '17612152207', 'zhongguo');
INSERT INTO `t_user_receive_info` VALUES ('11', '2', '3534534', 'sxt');
INSERT INTO `t_user_receive_info` VALUES ('13', '2', '123', 'aaa');

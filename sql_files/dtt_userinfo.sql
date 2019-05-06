/*
Navicat MySQL Data Transfer

Source Server         : localhost_33061
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-05-07 03:37:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dtt_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `dtt_userinfo`;
CREATE TABLE `dtt_userinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USERNAME` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `EMAIL` varchar(63) DEFAULT NULL,
  `REGTIME` varchar(31) DEFAULT 'CURRENT_TIMESTAMP',
  `STATUS` int(11) DEFAULT '0',
  `CONTENT` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  `telephone` varchar(31) DEFAULT NULL,
  `visittime` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dtt_userinfo
-- ----------------------------
INSERT INTO `dtt_userinfo` VALUES ('1', 'gaofei', 'Fei', 'gaofei@qq.com', '2019-05-01 13:07:03', '0', '0', '0', '15247777732', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('2', 'zhangsan', 'Steven', 'zhangsan@qq.com', '2019-05-01 13:07:03', '10', '0', '0', '15247777732', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('3', 'jim', 'Jim', 'jim@gmail.com', '2019-05-01 14:05:51', '0', '0', '0', '15247777732', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('4', 'wangwu', 'Adames', 'wangwu@xiaomi.om', '2019-05-01 14:05:51', '0', '0', '0', '12345678911', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('5', 'taihang', 'okggog', 'ok@yahoo.com', '2019-05-01 14:05:51', '20', '0', '0', '12345678911', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('6', 'lovekiwi', 'nz', 'abc@125.com', '2019-05-01 14:05:51', '0', '0', '0', '12345678911', '2019-05-01 14:05:51');
INSERT INTO `dtt_userinfo` VALUES ('7', 'love', 'ack', 'text@ack.net', '2019-05-01 14:05:51', '10', '0', '0', '12345678911', '2019-05-01 14:05:51');

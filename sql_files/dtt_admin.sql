/*
Navicat MySQL Data Transfer

Source Server         : localhost_33061
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-05-07 03:37:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dtt_admin
-- ----------------------------
DROP TABLE IF EXISTS `dtt_admin`;
CREATE TABLE `dtt_admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ADMINID` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PWD` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dtt_admin
-- ----------------------------
INSERT INTO `dtt_admin` VALUES ('1', 'dtt-admin', 'gnzLDuqKcGxMNKFokfhOew==');
INSERT INTO `dtt_admin` VALUES ('2', 'root', 'gnzLDuqKcGxMNKFokfhOew==');

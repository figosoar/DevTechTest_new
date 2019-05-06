/*
Navicat MySQL Data Transfer

Source Server         : localhost_33061
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-05-07 03:36:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dtt_usernote
-- ----------------------------
DROP TABLE IF EXISTS `dtt_usernote`;
CREATE TABLE `dtt_usernote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL DEFAULT '0',
  `NOTE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATETIME` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `ADMINID` int(11) DEFAULT NULL,
  `DELETED` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dtt_usernote
-- ----------------------------
INSERT INTO `dtt_usernote` VALUES ('1', '1', 'nba', '2019-05-07 02:01:58', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('2', '1', 'IT employee', '2019-05-07 02:01:58', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('3', '3', 'be from U.S.', '2019-05-07 01:58:33', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('4', '3', 'love nz food', '2019-05-07 01:58:33', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('5', '2', '2', '2019-05-07 03:11:47', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('6', '1', 'rap', '2019-05-07 02:01:58', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('7', '2', 'taxi', '2019-05-07 03:11:47', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('8', '3', 'Chinese kungfu', '2019-05-07 01:58:33', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('9', '1', 'newzealand', '2019-05-07 02:01:58', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('10', '8', 'love baby', '2019-05-07 02:02:09', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('11', '6', 'rap', '2019-05-07 03:11:55', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('12', '7', 'love', '2019-05-07 02:42:30', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('13', '5', 'us.', '2019-05-07 03:31:26', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('14', '4', 'txt', '2019-05-07 02:42:56', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('15', '4', 'adfadf', '2019-05-07 02:43:00', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('16', '2', 'nihao', '2019-05-07 03:11:47', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('17', '6', 'hello', '2019-05-07 03:11:55', '1', '0');
INSERT INTO `dtt_usernote` VALUES ('18', '5', 'www', '2019-05-07 03:31:26', '1', '0');

/*
 Navicat Premium Data Transfer

 Source Server         : 172.20.5.63
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : 172.20.5.63:3306
 Source Schema         : command_center

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 08/09/2021 19:31:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` text,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
INSERT INTO `content` VALUES (1, 'Cloud Paks', 'https://www.ibm.com', 'Cloud Paks');
INSERT INTO `content` VALUES (2, 'Demo Cloud', 'https://icc.cn.ibm.com/democloud', 'Demo Cloud');
INSERT INTO `content` VALUES (3, 'Demo Cloud Mgmt', 'https://icc.cn.ibm.com/democloudmanagement', 'Demo Cloud Mgmt');
INSERT INTO `content` VALUES (4, 'PoC Cloud Mgmt', 'https://icc.cn.ibm.com/applymanage', 'PoC Cloud Mgmt');
INSERT INTO `content` VALUES (5, 'Briefing Source', 'https://www.ibm.com', 'Briefing Source');
COMMIT;

-- ----------------------------
-- Table structure for content_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `content_role_relation`;
CREATE TABLE `content_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_role_relation
-- ----------------------------
BEGIN;
INSERT INTO `content_role_relation` VALUES (1, 1, 1);
INSERT INTO `content_role_relation` VALUES (2, 2, 3);
INSERT INTO `content_role_relation` VALUES (3, 3, 3);
INSERT INTO `content_role_relation` VALUES (4, 4, 1);
INSERT INTO `content_role_relation` VALUES (5, 4, 4);
INSERT INTO `content_role_relation` VALUES (6, 5, 2);
INSERT INTO `content_role_relation` VALUES (7, 5, 3);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'Architect');
INSERT INTO `role` VALUES (2, 'Operation Specialist');
INSERT INTO `role` VALUES (3, 'Engagement Lead');
INSERT INTO `role` VALUES (4, 'IT Specialist');
COMMIT;

-- ----------------------------
-- View structure for content_view
-- ----------------------------
DROP VIEW IF EXISTS `content_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `content_view` AS select `content`.`id` AS `id`,`content`.`name` AS `name`,`content`.`url` AS `url`,`content`.`description` AS `description`,`role`.`rolename` AS `rolename`,`role`.`roleid` AS `roleId` from ((`content` left join `content_role_relation` on((`content`.`id` = `content_role_relation`.`contentId`))) left join `role` on((`content_role_relation`.`roleId` = `role`.`roleid`)));

SET FOREIGN_KEY_CHECKS = 1;

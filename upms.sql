/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : upms

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 18/05/2020 17:51:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check_stage
-- ----------------------------
DROP TABLE IF EXISTS `check_stage`;
CREATE TABLE `check_stage`  (
  `id` bigint(0) NOT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stage` int(0) NOT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `status` int(0) NOT NULL,
  `project_id` bigint(0) NULL DEFAULT NULL,
  `verifiers_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK1o3nal7q3t5vlvkn20mfb9x0m`(`project_id`) USING BTREE,
  INDEX `FKt07lje3562r06ejjsh7997jol`(`verifiers_id`) USING BTREE,
  CONSTRAINT `FK1o3nal7q3t5vlvkn20mfb9x0m` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt07lje3562r06ejjsh7997jol` FOREIGN KEY (`verifiers_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of check_stage
-- ----------------------------

-- ----------------------------
-- Table structure for declare_rule
-- ----------------------------
DROP TABLE IF EXISTS `declare_rule`;
CREATE TABLE `declare_rule`  (
  `id` bigint(0) NOT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `major` int(0) NOT NULL,
  `rule_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publisher_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKl0docppqd3k8y173cygtdoj1o`(`publisher_id`) USING BTREE,
  CONSTRAINT `FKl0docppqd3k8y173cygtdoj1o` FOREIGN KEY (`publisher_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of declare_rule
-- ----------------------------

-- ----------------------------
-- Table structure for expert_review
-- ----------------------------
DROP TABLE IF EXISTS `expert_review`;
CREATE TABLE `expert_review`  (
  `id` bigint(0) NOT NULL,
  `mark` bit(1) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `score` int(0) NOT NULL,
  `expert_id` bigint(0) NULL DEFAULT NULL,
  `project_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKdhys754mwjwyxxb5o843mkna8`(`expert_id`) USING BTREE,
  INDEX `FKl5u2vavj35q6qii2vtquluhm6`(`project_id`) USING BTREE,
  CONSTRAINT `FKdhys754mwjwyxxb5o843mkna8` FOREIGN KEY (`expert_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl5u2vavj35q6qii2vtquluhm6` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of expert_review
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);
INSERT INTO `hibernate_sequence` VALUES (2);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint(0) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `date` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seen` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` int(0) NOT NULL,
  `receiver_id` bigint(0) NULL DEFAULT NULL,
  `sender_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK86f0kc2mt26ifwupnivu6v8oa`(`receiver_id`) USING BTREE,
  INDEX `FKcnj2qaf5yc36v2f90jw2ipl9b`(`sender_id`) USING BTREE,
  CONSTRAINT `FK86f0kc2mt26ifwupnivu6v8oa` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKcnj2qaf5yc36v2f90jw2ipl9b` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` bigint(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, NULL, '全部权限', 'all', '/*', NULL);
INSERT INTO `permission` VALUES (2, NULL, '全部权限及子权限', 'all-children', '/**', NULL);
INSERT INTO `permission` VALUES (7, NULL, '查看登录页', '登陆', '/login', NULL);
INSERT INTO `permission` VALUES (8, NULL, '查看注册页', '注册', '/register', NULL);
INSERT INTO `permission` VALUES (9, NULL, '查看用户个人信息页', '个人信息', '/userInfo', NULL);
INSERT INTO `permission` VALUES (11, NULL, 'rbac权限', 'authority', '/authority/*', NULL);
INSERT INTO `permission` VALUES (20, NULL, '文件上传下载', '文件', '/file/*', NULL);
INSERT INTO `permission` VALUES (30, NULL, '登陆注册', '用户', '/user/*', NULL);
INSERT INTO `permission` VALUES (40, NULL, '私信列表、表格权限', '私信', '/pm/*', NULL);
INSERT INTO `permission` VALUES (50, NULL, '申报入口权限及子权限', '申报入口', '/rule/*', NULL);
INSERT INTO `permission` VALUES (60, NULL, '阶段检查权限及子权限', '阶段检查', '/stage/*', NULL);
INSERT INTO `permission` VALUES (70, NULL, '项目权限及子权限', '项目', '/project/*', NULL);
INSERT INTO `permission` VALUES (100, NULL, '管理员权限', 'manager', '/manager/*', NULL);
INSERT INTO `permission` VALUES (110, NULL, '教师权限', 'teacher', '/teacher/*', NULL);
INSERT INTO `permission` VALUES (120, NULL, '专家权限', 'expert', '/expert/*', NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` bigint(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` int(0) NOT NULL,
  `major` int(0) NOT NULL,
  `members` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state` int(0) NOT NULL,
  `submit` bit(1) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `declaration_id` bigint(0) NULL DEFAULT NULL,
  `entrance_id` bigint(0) NULL DEFAULT NULL,
  `leader_id` bigint(0) NULL DEFAULT NULL,
  `manager_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpqthvxk1eg74druucnji8j9cw`(`declaration_id`) USING BTREE,
  INDEX `FKfdimf08uptvq0qj35xylkwy4n`(`entrance_id`) USING BTREE,
  INDEX `FKiw5kyt4ful6dvrcq3rmktwi98`(`leader_id`) USING BTREE,
  INDEX `FK2g58lgoxy5typ93ob5k7unehp`(`manager_id`) USING BTREE,
  CONSTRAINT `FK2g58lgoxy5typ93ob5k7unehp` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfdimf08uptvq0qj35xylkwy4n` FOREIGN KEY (`entrance_id`) REFERENCES `declare_rule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKiw5kyt4ful6dvrcq3rmktwi98` FOREIGN KEY (`leader_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpqthvxk1eg74druucnji8j9cw` FOREIGN KEY (`declaration_id`) REFERENCES `project_file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_commitment_pics
-- ----------------------------
DROP TABLE IF EXISTS `project_commitment_pics`;
CREATE TABLE `project_commitment_pics`  (
  `project_id` bigint(0) NOT NULL,
  `commitment_pics_id` bigint(0) NOT NULL,
  UNIQUE INDEX `UK_rdlpn1c02pyua5r3707dgoabe`(`commitment_pics_id`) USING BTREE,
  INDEX `FK1l4x60q3kwpqpgg61p3s2roiy`(`project_id`) USING BTREE,
  CONSTRAINT `FK1l4x60q3kwpqpgg61p3s2roiy` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhc8m5goxe086dpw1fcst05m4s` FOREIGN KEY (`commitment_pics_id`) REFERENCES `project_file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_commitment_pics
-- ----------------------------

-- ----------------------------
-- Table structure for project_experts
-- ----------------------------
DROP TABLE IF EXISTS `project_experts`;
CREATE TABLE `project_experts`  (
  `project_id` bigint(0) NOT NULL,
  `experts_id` bigint(0) NOT NULL,
  INDEX `FK6glg7ov5fqgjq74qn13iqqrfv`(`experts_id`) USING BTREE,
  INDEX `FKjfv06vpx6us9u2x46yk092cgj`(`project_id`) USING BTREE,
  CONSTRAINT `FK6glg7ov5fqgjq74qn13iqqrfv` FOREIGN KEY (`experts_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKjfv06vpx6us9u2x46yk092cgj` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_experts
-- ----------------------------

-- ----------------------------
-- Table structure for project_file
-- ----------------------------
DROP TABLE IF EXISTS `project_file`;
CREATE TABLE `project_file`  (
  `id` bigint(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `upload_time` datetime(0) NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_22oj9okllt7twva8w179v8vsf`(`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_file
-- ----------------------------

-- ----------------------------
-- Table structure for project_final_check_files
-- ----------------------------
DROP TABLE IF EXISTS `project_final_check_files`;
CREATE TABLE `project_final_check_files`  (
  `project_id` bigint(0) NOT NULL,
  `final_check_files_id` bigint(0) NOT NULL,
  UNIQUE INDEX `UK_shj9bgbtplhds5m6utefllk46`(`final_check_files_id`) USING BTREE,
  INDEX `FKgkq836ci57hd8vsg84cegrc9l`(`project_id`) USING BTREE,
  CONSTRAINT `FKgkq836ci57hd8vsg84cegrc9l` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKkcykdwrdf9m957iyyvjafhgty` FOREIGN KEY (`final_check_files_id`) REFERENCES `project_file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_final_check_files
-- ----------------------------

-- ----------------------------
-- Table structure for project_mid_check_files
-- ----------------------------
DROP TABLE IF EXISTS `project_mid_check_files`;
CREATE TABLE `project_mid_check_files`  (
  `project_id` bigint(0) NOT NULL,
  `mid_check_files_id` bigint(0) NOT NULL,
  UNIQUE INDEX `UK_pau4beut1cbpd2etn0sxoqmrx`(`mid_check_files_id`) USING BTREE,
  INDEX `FKsah7hfncveu92380e3gh6c9tg`(`project_id`) USING BTREE,
  CONSTRAINT `FKrban2gm7w9urc5y2qcx0l4tvt` FOREIGN KEY (`mid_check_files_id`) REFERENCES `project_file` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsah7hfncveu92380e3gh6c9tg` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_mid_check_files
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_8sewwnpamngi6b1dwaa88askk`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, NULL, NULL, 'superadmin', NULL);
INSERT INTO `role` VALUES (2, NULL, NULL, 'manger', NULL);
INSERT INTO `role` VALUES (3, NULL, NULL, 'teacher', NULL);
INSERT INTO `role` VALUES (4, NULL, NULL, 'expert', NULL);

-- ----------------------------
-- Table structure for role_permission_list
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_list`;
CREATE TABLE `role_permission_list`  (
  `role_id` bigint(0) NOT NULL,
  `permission_list_id` bigint(0) NOT NULL,
  INDEX `FKqrjk648ubvovhf4g6sxnsbdov`(`permission_list_id`) USING BTREE,
  INDEX `FKjuoog800x0k4fjyguyv04s2ab`(`role_id`) USING BTREE,
  CONSTRAINT `FKjuoog800x0k4fjyguyv04s2ab` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKqrjk648ubvovhf4g6sxnsbdov` FOREIGN KEY (`permission_list_id`) REFERENCES `permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permission_list
-- ----------------------------
INSERT INTO `role_permission_list` VALUES (1, 1);
INSERT INTO `role_permission_list` VALUES (2, 1);
INSERT INTO `role_permission_list` VALUES (3, 1);
INSERT INTO `role_permission_list` VALUES (4, 1);
INSERT INTO `role_permission_list` VALUES (1, 2);
INSERT INTO `role_permission_list` VALUES (2, 2);
INSERT INTO `role_permission_list` VALUES (3, 2);
INSERT INTO `role_permission_list` VALUES (4, 2);
INSERT INTO `role_permission_list` VALUES (2, 100);
INSERT INTO `role_permission_list` VALUES (3, 110);
INSERT INTO `role_permission_list` VALUES (4, 120);
INSERT INTO `role_permission_list` VALUES (1, 11);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` bigint(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_pao7fvyhbiu7kg0ubf1copfps`(`user_number`) USING BTREE,
  INDEX `FKn82ha3ccdebhokx3a8fgdqeyy`(`role_id`) USING BTREE,
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2019-10-08 05:20:05', 'simple', '123456', NULL, 'Administrator', 1);
INSERT INTO `user` VALUES (2, '2019-10-08 05:20:05', 'simple', '123456', NULL, 'M_LiuFX', 2);
INSERT INTO `user` VALUES (3, '2019-10-08 05:20:05', 'simple', '123456', NULL, 'T_YuS', 3);
INSERT INTO `user` VALUES (4, '2019-10-08 05:20:05', 'simple', '123456', NULL, 'E_GuWJ', 4);

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 23/06/2020 13:40:16
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
INSERT INTO `check_stage` VALUES (13, '2020-06-16 05:24:45', '通过', NULL, 1, '2020-06-16 05:22:24', 1, 8, 2);
INSERT INTO `check_stage` VALUES (15, NULL, NULL, NULL, 2, '2020-06-16 05:24:45', 0, 8, NULL);
INSERT INTO `check_stage` VALUES (23, NULL, NULL, NULL, 1, '2020-06-16 05:52:28', 0, 18, NULL);

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
INSERT INTO `declare_rule` VALUES (2, '2020-03-30 16:00:00', 3, '软件体系结构课程设计', '2020-02-29 16:00:00', '软件体系结构', 2);
INSERT INTO `declare_rule` VALUES (3, '2020-04-29 16:00:00', 3, '软件项目管理课程设计', '2020-03-31 16:00:00', '软件项目管理', 2);
INSERT INTO `declare_rule` VALUES (4, '2020-06-30 16:00:00', 3, '规则如下：……', '2020-05-31 16:00:00', '测试项目', 2);

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
INSERT INTO `expert_review` VALUES (10, b'1', NULL, 10, 4, 8);
INSERT INTO `expert_review` VALUES (20, b'1', NULL, 10, 4, 18);

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
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);
INSERT INTO `hibernate_sequence` VALUES (24);

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
INSERT INTO `message` VALUES (5, '<ul><li style=\"font-size:16px;color:#393D49;\">开始时间：2020-06-01</li><li style=\"font-size:16px;color:#393D49;\">截止时间：2020-07-01</li><li style=\"font-size:15px;\">所属学科：工程与技术科学类</li><li style=\"font-size:15px\">申报规则：规则如下：……</li></ul>', '2020-06-16 05:17:26', '{\"ruleId\":4,\"ruleTitle\":\"测试项目\",\"publisher\":2}', b'1', '测试项目申报入口通知', 0, NULL, 2);
INSERT INTO `message` VALUES (9, '您的项目已通过初步审核，进入立项评审阶段', '2020-06-16 05:20:15', '{\"projectId\":8,\"projectName\":\"项目A\"}', b'1', '项目初步审核通过！', 1, 3, 2);
INSERT INTO `message` VALUES (11, '项目A等待您的评审', '2020-06-16 05:20:34', '{\"projectId\":8,\"projectName\":\"项目A\"}', b'1', '立项评审工作分配', 1, 4, 2);
INSERT INTO `message` VALUES (12, '你的项目已被立项，进入中期检查阶段！', '2020-06-16 05:22:24', '{\"projectId\":8,\"projectName\":\"项目A\"}', b'1', '项目已立项！', 1, 3, 2);
INSERT INTO `message` VALUES (19, '您的项目已通过初步审核，进入立项评审阶段', '2020-06-16 05:48:11', '{\"projectId\":18,\"projectName\":\"项目B\"}', b'1', '项目初步审核通过！', 1, 3, 2);
INSERT INTO `message` VALUES (21, '项目B等待您的评审', '2020-06-16 05:48:54', '{\"projectId\":18,\"projectName\":\"项目B\"}', b'1', '立项评审工作分配', 1, 4, 2);
INSERT INTO `message` VALUES (22, '你的项目已被立项，进入中期检查阶段！', '2020-06-16 05:52:28', '{\"projectId\":18,\"projectName\":\"项目B\"}', b'0', '项目已立项！', 1, 3, 2);

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
INSERT INTO `project` VALUES (8, '2020-06-16 05:19:29', '123@qq.com', 0, 3, '[\"张三\",\"李四\"]', '项目A', '15959120000', 8, b'1', '2020-06-16 05:24:45', 7, 4, 3, 2);
INSERT INTO `project` VALUES (18, '2020-06-16 05:28:07', '123@qq.com', 0, 3, '[\"刘某\",\"王某\"]', '项目B', '15858120000', 5, b'1', '2020-06-16 05:52:28', 17, 4, 3, 2);

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
INSERT INTO `project_commitment_pics` VALUES (8, 6);
INSERT INTO `project_commitment_pics` VALUES (18, 16);

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
INSERT INTO `project_experts` VALUES (8, 4);
INSERT INTO `project_experts` VALUES (18, 4);

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
INSERT INTO `project_file` VALUES (6, '承诺书.png', '2020-06-16 05:19:25', '3035f579f8514df9825bfc173e7ab0c2');
INSERT INTO `project_file` VALUES (7, '申报书.docx', '2020-06-16 05:19:28', 'd8b74037140a481da5d66fef5596b202');
INSERT INTO `project_file` VALUES (14, '中期材料.docx', '2020-06-16 05:24:28', 'e961982624064e08be65668d64ce0389');
INSERT INTO `project_file` VALUES (16, '承诺书.png', '2020-06-16 05:28:02', '7b069a2d64324d34946008f0c5aee5d8');
INSERT INTO `project_file` VALUES (17, '申报书.docx', '2020-06-16 05:28:05', 'fb486f26acf447a9a754187374848018');

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
INSERT INTO `project_mid_check_files` VALUES (8, 14);

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
INSERT INTO `user` VALUES (1, '2019-10-08 05:20:05', 'Administrator', '123456', NULL, 'Administrator', 1);
INSERT INTO `user` VALUES (2, '2019-10-08 05:20:05', 'M_LiuFX', '123456', NULL, 'M_LiuFX', 2);
INSERT INTO `user` VALUES (3, '2019-10-08 05:20:05', 'T_YuS', '123456', NULL, 'T_YuS', 3);
INSERT INTO `user` VALUES (4, '2019-10-08 05:20:05', 'E_GuWJ', '123456', NULL, 'E_GuWJ', 4);

SET FOREIGN_KEY_CHECKS = 1;

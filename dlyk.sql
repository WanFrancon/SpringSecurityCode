/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.238.188
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 192.168.238.188:3306
 Source Schema         : dlyk

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 27/06/2024 15:56:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，活动ID',
  `owner_id` int(11) NULL DEFAULT NULL COMMENT '活动所属人ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '活动结束时间',
  `cost` decimal(11, 2) NULL DEFAULT NULL COMMENT '活动预算',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '活动创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '活动创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '活动编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '活动编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `owner`(`owner_id`) USING BTREE,
  INDEX `create_by`(`create_by`) USING BTREE,
  INDEX `edit_by`(`edit_by`) USING BTREE,
  CONSTRAINT `t_activity_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_ibfk_3` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES (1, 4, '百度推广', '2023-08-05 19:18:20', '2023-08-25 00:00:00', 1200000.00, '百度排名推广,活动非常非常贵,大家好好的做推广.由于推广活动的效果非常好,决定延期一个月.山东科技付货款打扫房间凯撒的补给卡时间跨度风寒咳嗽大部分就开吧打撒个发过火发给你厉害u7如果发生大叔大婶i我饿火绒额特容易骗人空调已汇入退役军人天涯茫然了啊浴室柜打不打卡是i速单号覅收到反馈上课的话费尽口舌大富科技是', '2024-06-25 10:33:33', 8, '2023-05-15 00:10:49', 12);
INSERT INTO `t_activity` VALUES (2, 2, '充话费-送手机', '2023-10-28 17:48:49', '2023-10-30 17:48:54', 9000.00, '充话费,送手机,充满送Iphone14', '2023-03-28 17:49:28', 1, '2023-05-15 00:10:52', 1);
INSERT INTO `t_activity` VALUES (7, 1, '抖音推广', '2023-12-01 12:03:09', '2023-12-30 12:03:09', 15800.00, '抖音直播推广活动1', NULL, 6, NULL, NULL);
INSERT INTO `t_activity` VALUES (8, 1, '抖音推广', '2023-01-01 12:03:09', '2023-04-30 12:03:09', 15800.00, '抖音直播推广活动2', NULL, 7, '2023-04-28 14:28:53', NULL);
INSERT INTO `t_activity` VALUES (10, 2, '11', '2023-01-11 00:30:58', '2023-04-30 00:31:00', 131.00, '12312312', NULL, NULL, '2023-04-28 13:33:56', NULL);
INSERT INTO `t_activity` VALUES (11, 3, '1213', '2023-02-01 00:00:00', '2023-04-30 00:31:13', 123123.00, '23123123', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (12, 1, '抖音推广', '2023-12-01 12:03:09', '2023-12-11 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (13, 1, '抖音推广', '2023-01-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, '2023-04-28 13:27:43', NULL);
INSERT INTO `t_activity` VALUES (14, 1, '抖音推广', '2023-11-01 12:03:09', '2023-12-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (15, 1, '抖音推广', '2023-03-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动11111', NULL, NULL, '2023-04-26 17:09:49', NULL);
INSERT INTO `t_activity` VALUES (16, 1, '抖音推广', '2023-03-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (17, 1, '抖音推广', '2023-03-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (18, 1, '抖音推广', '2023-04-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (19, 1, '抖音推广', '2023-09-01 12:03:09', '2023-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (20, 1, '抖音推广', '2023-09-01 12:03:09', '2023-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (21, 1, '抖音推广', '2023-04-01 12:03:09', '2023-04-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (22, 1, '抖音推广', '2024-02-01 10:03:09', '2024-09-09 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (23, 1, '抖音推广', '2024-02-01 10:03:09', '2024-09-11 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (24, 1, '抖音推广', '2024-01-07 10:03:09', '2024-09-27 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (25, 1, '抖音推广', '2024-02-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (26, 1, '抖音推广', '2024-02-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (27, 1, '抖音推广', '2024-02-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (28, 1, '抖音推广', '2024-02-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (29, 1, '抖音推广', '2024-02-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (40, 1, '抖音推广11', '2024-05-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (41, 1, '抖音推广11', '2024-05-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (42, 1, '抖音推广11', '2024-05-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (43, 1, '抖音推广11', '2024-05-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (44, 1, '抖音推广11', '2024-06-01 12:03:09', '2024-09-01 12:03:09', 15800.00, '抖音直播推广活动1', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (45, 1, '抖音推广11', '2024-06-01 12:03:09', '2024-09-15 12:03:09', 15800.00, '抖音直播推广活动2', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (46, 3, '抖音短视频广告', '2024-07-05 00:00:00', '2024-11-30 00:00:00', 5000.00, '抖音短视频广告，宣传产品', NULL, NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (47, 3, '我去恶趣味', '2024-07-15 16:51:40', '2024-11-30 16:51:42', 231231.00, '色达所大所大所多', '2024-06-25 09:19:14', NULL, '2024-06-25 16:59:31', 1);
INSERT INTO `t_activity` VALUES (48, 7, '可视角度焚枯食淡粉红色', '2024-11-01 00:44:19', '2024-12-30 00:44:19', 185323.00, '第三方水电费水电费水电费是非得失', '2024-06-25 22:27:15', NULL, '2024-06-25 17:00:02', 1);
INSERT INTO `t_activity` VALUES (49, 1, '抖音推广11', '2024-12-01 12:03:09', '2024-12-12 12:03:09', 15800.00, '抖音直播推广活动1', '2024-06-25 09:19:23', NULL, NULL, NULL);
INSERT INTO `t_activity` VALUES (50, 2, '手动滑稽腹背受敌', '2024-06-25 16:58:52', '2024-06-29 00:00:00', 1280000.00, '第三方水电费水电费', '2024-06-25 16:12:00', 1, '2024-06-25 16:58:55', 1);

-- ----------------------------
-- Table structure for t_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_remark`;
CREATE TABLE `t_activity_remark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，活动备注ID',
  `activity_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '备注创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '备注创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '备注编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '备注编辑人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除状态（0或者null正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_id`(`activity_id`) USING BTREE,
  INDEX `t_activity_remark_ibfk_2`(`create_by`) USING BTREE,
  INDEX `t_activity_remark_ibfk_3`(`edit_by`) USING BTREE,
  CONSTRAINT `t_activity_remark_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_remark_ibfk_2` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_activity_remark_ibfk_3` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '市场活动备注表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_activity_remark
-- ----------------------------
INSERT INTO `t_activity_remark` VALUES (1, 46, '1111111111111', '2023-05-17 14:07:48', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (2, 1, '市场活动效果需要进一步改进。', '2023-05-17 14:25:30', 1, '2024-06-25 14:44:01', 1, 1);
INSERT INTO `t_activity_remark` VALUES (3, 2, '1231231', '2023-06-07 23:08:32', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (4, 2, '23123', '2023-06-07 23:08:57', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (5, 10, '恶趣味群二无群二群无', '2023-06-07 23:10:20', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (6, 1, '上帝粉红色的匡扶汉室登记卡放哪的桑拿房科技大收纳发卡机打撒', '2023-08-04 22:30:47', 1, '2024-06-25 14:43:51', 1, NULL);
INSERT INTO `t_activity_remark` VALUES (7, 1, '啥地方跟你说快递费牛会计三大步伐年卡大撒把饭卡大撒把开发受打击开发你受打击考拉放哪受打击可燃放哪凯撒', '2024-06-25 11:11:00', 1, '2024-06-25 14:44:53', 1, NULL);
INSERT INTO `t_activity_remark` VALUES (8, 1, '首付款是的呢防溺水迪菲娜手打 ', '2024-06-25 11:11:30', 1, '2024-06-25 14:44:49', 1, NULL);
INSERT INTO `t_activity_remark` VALUES (9, 1, '活动效果还可以，每天可以拿到2000个真实的意向客户的手机号，但是后续电话联系的时候，大部分电话不接听，联系不上。', '2024-06-25 11:13:30', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (10, 1, '附件看过的发给你了地方你噶漏打卡个', '2024-06-25 11:40:11', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (11, 1, '隧道粉红色款到发货', '2024-06-25 12:01:09', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (12, 1, '冻死佛山分你收到了菲尼萨打卡漏发了双打卡发撒。', '2024-06-25 12:01:21', 1, '2024-06-25 14:44:14', 1, NULL);
INSERT INTO `t_activity_remark` VALUES (13, 1, '咨询费重振雄风产生的', '2024-06-25 12:01:39', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (14, 1, '水电费水电费是的', '2024-06-25 12:01:41', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (15, 1, '水电费水电费是的', '2024-06-25 12:01:43', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (16, 1, '水电费水电费', '2024-06-25 12:01:44', 1, '2024-06-25 14:44:25', 1, 1);
INSERT INTO `t_activity_remark` VALUES (17, 1, '水电费水电费是的', '2024-06-25 12:01:46', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (18, 1, '收到放虎归山东方红郡双打卡饭卡打撒', '2024-06-25 12:12:07', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (19, 1, 'USD会阿迪斯', '2024-06-25 14:45:37', 1, NULL, NULL, 1);
INSERT INTO `t_activity_remark` VALUES (20, 1, '瓦尔特瑞特热二位大范甘迪公对公', '2024-06-25 15:01:27', 1, '2024-06-25 15:01:35', 1, 1);
INSERT INTO `t_activity_remark` VALUES (21, 48, '二哥让他人', '2024-06-25 16:59:50', 1, NULL, NULL, NULL);
INSERT INTO `t_activity_remark` VALUES (22, 48, '如图和液体与东风股份大概', '2024-06-25 16:59:54', 1, '2024-06-25 17:00:08', 1, 1);

-- ----------------------------
-- Table structure for t_clue
-- ----------------------------
DROP TABLE IF EXISTS `t_clue`;
CREATE TABLE `t_clue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索ID',
  `owner_id` int(11) NULL DEFAULT NULL COMMENT '线索所属人ID',
  `activity_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `full_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `appellation` int(11) NULL DEFAULT NULL COMMENT '称呼',
  `phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `year_income` decimal(10, 2) NULL DEFAULT NULL COMMENT '年收入',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `need_loan` int(11) NULL DEFAULT NULL COMMENT '是否需要贷款（0不需要，1需要）',
  `intention_state` int(11) NULL DEFAULT NULL COMMENT '意向状态',
  `intention_product` int(11) NULL DEFAULT NULL COMMENT '意向产品',
  `state` int(11) NULL DEFAULT NULL COMMENT '线索状态',
  `source` int(11) NULL DEFAULT NULL COMMENT '线索来源',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线索描述',
  `next_contact_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `appellation`(`appellation`) USING BTREE,
  INDEX `state`(`state`) USING BTREE,
  INDEX `source`(`source`) USING BTREE,
  INDEX `owner`(`owner_id`) USING BTREE,
  INDEX `create_by`(`create_by`) USING BTREE,
  INDEX `edit_by`(`edit_by`) USING BTREE,
  INDEX `t_clue_ibfk_7`(`activity_id`) USING BTREE,
  INDEX `t_clue_ibfk_8`(`need_loan`) USING BTREE,
  INDEX `t_clue_ibfk_9`(`intention_state`) USING BTREE,
  INDEX `t_clue_ibfk_10`(`intention_product`) USING BTREE,
  CONSTRAINT `t_clue_ibfk_1` FOREIGN KEY (`appellation`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_10` FOREIGN KEY (`intention_product`) REFERENCES `t_product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_2` FOREIGN KEY (`state`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_3` FOREIGN KEY (`source`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_5` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_6` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_7` FOREIGN KEY (`activity_id`) REFERENCES `t_activity` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_8` FOREIGN KEY (`need_loan`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_ibfk_9` FOREIGN KEY (`intention_state`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_clue
-- ----------------------------
INSERT INTO `t_clue` VALUES (1, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 50, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-07-17 15:17:52', NULL, '2023-12-18 18:56:18', 1);
INSERT INTO `t_clue` VALUES (2, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 50, 47, 8, -1, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:13', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (3, 2, 7, '张翔', 18, '13876903226', '13876903226', '123456', NULL, 26, NULL, 9.00, '天津和平', 50, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:17', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (4, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 50, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (5, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 50, 47, 8, -1, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:19', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (6, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:23', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (7, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (8, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, 24, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:25', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (9, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-28 13:24:10', '2023-06-10 01:01:28', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (10, 1, 46, '王杰89890890', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '', 10.00, '北京亦庄', 49, 46, 5, -1, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (11, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, 24, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:30', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (12, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:33', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (13, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, -1, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (14, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, -1, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:36', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (15, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:38', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (16, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (17, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, -1, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:41', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (18, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:44', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (19, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, -1, 3, '近期在看车', '2023-04-27 10:33:47', '2023-06-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (20, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, 24, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (21, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (22, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (23, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, -1, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (24, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (25, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-04-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (26, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, 24, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (27, 2, 7, '张翔', 18, '13876903226', '13876903226', NULL, NULL, 26, NULL, 9.00, '天津和平', 49, 48, 10, 30, 44, '有购车意向，需要跟踪', '2023-04-15 00:00:00', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (28, 1, 46, '王杰', 18, '13700000000', '13700000000', '13700000000', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', 49, 46, 5, 24, 3, '近期在看车', '2023-04-27 10:33:47', '2023-06-12 15:17:52', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (29, 1, 47, '张峰', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', 49, 47, 8, 24, 33, '通过打电话获取的线索', '2023-04-30 10:33:51', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (31, 3, 2, '213213', 20, '12312312', '12312312', '2312312', '12312312', 12, '341231', 2131231.00, '12312312', 50, 46, 7, 24, 44, 'asfeefsdewrewr', '2023-04-27 16:48:30', '2023-06-10 01:01:46', NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1109, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 14, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1110, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 3, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1111, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 16, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1112, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 17, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1113, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 2, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1114, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 22, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1115, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 39, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1116, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 33, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1117, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 36, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1118, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 23, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1119, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 43, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1120, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 44, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1121, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 45, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1122, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 25, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1123, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 14, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1124, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 3, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1125, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 16, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1126, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 17, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1127, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 2, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1128, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 22, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1129, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 39, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1130, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 33, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1131, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 36, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1132, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 23, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1133, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 43, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1134, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 44, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1135, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 45, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1136, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 25, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1137, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 14, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1138, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 3, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1139, 1, 46, '王杰', 18, '13700000000', '13700000000', '230989432', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 16, '近期在看车', '2023-11-27 20:33:25', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1140, 1, 47, '张怡然', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 17, '通过打电话获取的线索', '2023-11-30 10:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1141, 2, 7, '张翔宇', 18, '13876903226', '13876903226', '1298094321', NULL, 26, NULL, 9.00, '天津和平', NULL, NULL, NULL, NULL, 2, '有购车意向，需要跟踪', '2023-11-15 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1142, 1, 46, '王世坤', 18, '13700000000', '13700000000', '209836613', 'wangjie@163.com', 32, '工程师', 10.00, '北京亦庄', NULL, NULL, NULL, NULL, 22, '近期在看车', '2023-12-27 09:20:21', NULL, NULL, NULL, NULL);
INSERT INTO `t_clue` VALUES (1143, 1, 47, '张珊珊', 41, '13700000001', '13700000001', NULL, NULL, 28, NULL, 8.00, '河北廊坊', NULL, NULL, NULL, NULL, 39, '通过打电话获取的线索', '2023-11-30 13:33:51', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_clue_remark`;
CREATE TABLE `t_clue_remark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索备注ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `note_way` int(11) NULL DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟踪内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '跟踪时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '跟踪人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_by`(`create_by`) USING BTREE,
  INDEX `edit_by`(`edit_by`) USING BTREE,
  INDEX `clue_id`(`clue_id`) USING BTREE,
  INDEX `t_clue_remark_ibfk_4`(`note_way`) USING BTREE,
  CONSTRAINT `t_clue_remark_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_3` FOREIGN KEY (`clue_id`) REFERENCES `t_clue` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_clue_remark_ibfk_4` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线索跟踪记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_clue_remark
-- ----------------------------
INSERT INTO `t_clue_remark` VALUES (5, 8, 65, '2143242354', '2023-04-28 14:24:27', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (6, 10, 64, '123412312312', '2023-04-28 14:29:41', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (7, 10, 63, '二位绕弯儿翁人', '2023-04-28 14:30:16', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (8, 21, 61, '12213123123', '2023-05-21 23:43:48', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (9, 21, 62, '3ewrwerewr', '2023-05-21 23:43:52', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (10, 21, 65, 'ewrwerewrewr', '2023-05-21 23:43:55', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (11, 16, 64, '123213123', '2023-05-21 23:54:57', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (12, 16, 63, '23123123', '2023-05-21 23:54:59', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (13, 16, 61, '2312313', '2023-05-21 23:55:02', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (14, 1, 62, NULL, '2023-06-27 22:47:49', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (15, 1, 65, '111111111111111', '2023-06-27 22:47:56', 1, NULL, NULL, NULL);
INSERT INTO `t_clue_remark` VALUES (16, 1, 64, '1111111111111111111111222222222222222222222222', '2023-06-27 22:48:01', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，客户ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `product` int(11) NULL DEFAULT NULL COMMENT '选购产品',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户描述',
  `next_contact_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_customer_ibfk_1`(`clue_id`) USING BTREE,
  INDEX `t_customer_ibfk_2`(`product`) USING BTREE,
  INDEX `t_customer_ibfk_3`(`create_by`) USING BTREE,
  INDEX `t_customer_ibfk_4`(`edit_by`) USING BTREE,
  CONSTRAINT `t_customer_ibfk_1` FOREIGN KEY (`clue_id`) REFERENCES `t_clue` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_2` FOREIGN KEY (`product`) REFERENCES `t_product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, 10, 3, '2131231', '2023-05-06 15:36:59', NULL, NULL, NULL, NULL);
INSERT INTO `t_customer` VALUES (2, 8, 6, '124气味儿群', '2023-05-05 00:00:00', NULL, NULL, NULL, NULL);
INSERT INTO `t_customer` VALUES (3, 6, 6, '1232强21312', '2023-05-06 00:00:00', '2023-04-28 15:42:15', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (4, 2, 3, '阿萨的人', '2023-05-05 00:00:00', '2023-04-28 15:54:04', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (5, 10, 1, '234234', '2023-05-05 00:00:00', '2023-04-28 15:56:44', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (6, 17, 2, '是的啊所大', '2023-05-05 00:00:00', '2023-04-28 15:59:33', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (7, 5, 2, '12312312', '2023-05-12 00:00:00', '2023-05-04 10:03:05', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (8, 19, 2, '气味儿群翁', '2023-05-04 10:03:18', '2023-05-04 10:03:20', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (9, 14, 4, '沃尔沃二', '2023-06-09 00:00:00', '2023-05-04 10:03:39', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (10, 23, 4, '沃尔沃二翁', '2023-05-23 00:00:00', '2023-05-04 10:03:53', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (11, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (12, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (13, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (14, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (15, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (17, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (18, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (19, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (20, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (21, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (22, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (23, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (24, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (25, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (26, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (27, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (28, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (29, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (30, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (31, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (32, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (33, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (34, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (35, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (36, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (37, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (38, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);
INSERT INTO `t_customer` VALUES (39, 13, 2, '沃尔沃二', '2023-05-13 00:00:00', '2023-05-04 10:04:03', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_remark`;
CREATE TABLE `t_customer_remark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，客户备注ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `note_way` int(11) NULL DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟踪内容',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '跟踪人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '跟踪时间',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_customer_remark_ibfk_1`(`customer_id`) USING BTREE,
  INDEX `t_customer_remark_ibfk_2`(`note_way`) USING BTREE,
  INDEX `t_customer_remark_ibfk_3`(`create_by`) USING BTREE,
  INDEX `t_customer_remark_ibfk_4`(`edit_by`) USING BTREE,
  CONSTRAINT `t_customer_remark_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_2` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_customer_remark_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户跟踪记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_customer_remark
-- ----------------------------
INSERT INTO `t_customer_remark` VALUES (1, 10, 65, '1111111111111111', 1, '2023-05-04 15:25:51', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (2, 10, 64, '2222222222222', 1, '2023-05-04 15:28:13', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (3, 10, 63, 'EREWREWRWRWR', 1, '2023-05-04 16:21:03', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (4, 7, 61, '13213123', 1, '2023-05-17 17:36:16', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (5, 10, 62, '2342423423423', 1, '2023-05-17 17:36:33', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (6, 1, 65, '3212321321', 1, '2023-05-21 23:50:42', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (7, 1, 64, 'eqwewqeqwe', 1, '2023-05-21 23:50:46', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (8, 1, 63, 'wqeqwewqeqw', 1, '2023-05-21 23:50:48', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (9, 8, 61, 'ewqeqweq', 1, '2023-05-21 23:50:59', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (10, 5, 62, 'weqweqweqweq', 1, '2023-05-21 23:51:05', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (11, 5, 65, 'weqwewqeqw', 1, '2023-05-21 23:51:08', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (12, 5, 64, '23213213123', 1, '2023-05-21 23:51:13', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (13, 5, 65, '23123213213', 1, '2023-05-21 23:51:16', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (14, 5, 64, '23123213213', 1, '2023-05-21 23:51:19', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (15, 5, 63, '3232323123', 1, '2023-05-21 23:51:23', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (16, 1, 61, '12312321321', 1, '2023-05-21 23:56:55', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (17, 2, 62, '1232131231', 1, '2023-05-21 23:57:03', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (18, 10, 65, NULL, 1, '2023-05-22 22:12:52', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (19, 10, 64, '123213214124', 1, '2023-05-22 22:12:58', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (20, 10, 63, '13241242432432', 1, '2023-05-22 22:13:03', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (21, 10, 61, '3423423423', 1, '2023-05-22 22:13:06', NULL, NULL, NULL);
INSERT INTO `t_customer_remark` VALUES (22, 2, 62, '1242412141', 1, '2023-05-31 20:14:08', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_type`;
CREATE TABLE `t_dic_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，字典类型ID',
  `type_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型代码',
  `type_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型名称',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `code`(`type_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dic_type
-- ----------------------------
INSERT INTO `t_dic_type` VALUES (1, 'sex', '性别', NULL);
INSERT INTO `t_dic_type` VALUES (2, 'appellation', '称呼', NULL);
INSERT INTO `t_dic_type` VALUES (3, 'clueState', '线索状态', NULL);
INSERT INTO `t_dic_type` VALUES (4, 'returnPriority', '回访优先级', NULL);
INSERT INTO `t_dic_type` VALUES (5, 'returnState', '回访状态', NULL);
INSERT INTO `t_dic_type` VALUES (6, 'source', '来源', NULL);
INSERT INTO `t_dic_type` VALUES (7, 'stage', '阶段', NULL);
INSERT INTO `t_dic_type` VALUES (8, 'transactionType', '交易类型', NULL);
INSERT INTO `t_dic_type` VALUES (9, 'intentionState', '意向状态', NULL);
INSERT INTO `t_dic_type` VALUES (10, 'needLoan', '是否贷款', NULL);
INSERT INTO `t_dic_type` VALUES (11, 'educational', '学历', NULL);
INSERT INTO `t_dic_type` VALUES (12, 'userState', '用户状态', NULL);
INSERT INTO `t_dic_type` VALUES (13, 'noteWay', '跟踪方式', NULL);

-- ----------------------------
-- Table structure for t_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_value`;
CREATE TABLE `t_dic_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，字典值ID',
  `type_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典类型代码',
  `type_value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `order` int(11) NULL DEFAULT NULL COMMENT '字典值排序',
  `remark` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_dic_value_ibfk_1`(`type_code`) USING BTREE,
  CONSTRAINT `t_dic_value_ibfk_1` FOREIGN KEY (`type_code`) REFERENCES `t_dic_type` (`type_code`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dic_value
-- ----------------------------
INSERT INTO `t_dic_value` VALUES (-1, 'clueState', '已转客户', 0, NULL);
INSERT INTO `t_dic_value` VALUES (1, 'clueState', '虚假线索', 4, NULL);
INSERT INTO `t_dic_value` VALUES (2, 'source', '知乎', 8, NULL);
INSERT INTO `t_dic_value` VALUES (3, 'source', '车展会', 11, NULL);
INSERT INTO `t_dic_value` VALUES (4, 'returnPriority', '最高', 2, NULL);
INSERT INTO `t_dic_value` VALUES (5, 'appellation', '教授', 5, NULL);
INSERT INTO `t_dic_value` VALUES (6, 'clueState', '将来联系', 2, NULL);
INSERT INTO `t_dic_value` VALUES (7, 'clueState', '丢失线索', 5, NULL);
INSERT INTO `t_dic_value` VALUES (8, 'returnState', '未启动', 1, NULL);
INSERT INTO `t_dic_value` VALUES (10, 'clueState', '试图联系', 1, NULL);
INSERT INTO `t_dic_value` VALUES (11, 'appellation', '博士', 4, NULL);
INSERT INTO `t_dic_value` VALUES (12, 'stage', '01创建交易', 1, NULL);
INSERT INTO `t_dic_value` VALUES (14, 'source', '汽车之家', 14, NULL);
INSERT INTO `t_dic_value` VALUES (15, 'returnPriority', '低', 3, NULL);
INSERT INTO `t_dic_value` VALUES (16, 'source', '网络广告', 1, NULL);
INSERT INTO `t_dic_value` VALUES (17, 'source', '视频直播', 9, NULL);
INSERT INTO `t_dic_value` VALUES (18, 'appellation', '先生', 1, NULL);
INSERT INTO `t_dic_value` VALUES (19, 'returnPriority', '高', 1, NULL);
INSERT INTO `t_dic_value` VALUES (20, 'appellation', '夫人', 2, NULL);
INSERT INTO `t_dic_value` VALUES (21, 'stage', '06丢失关闭', 7, NULL);
INSERT INTO `t_dic_value` VALUES (22, 'source', '地图', 13, NULL);
INSERT INTO `t_dic_value` VALUES (23, 'source', '合作伙伴', 6, NULL);
INSERT INTO `t_dic_value` VALUES (24, 'clueState', '未联系', 6, NULL);
INSERT INTO `t_dic_value` VALUES (25, 'source', '朋友圈', 10, NULL);
INSERT INTO `t_dic_value` VALUES (26, 'returnState', '进行中', 3, NULL);
INSERT INTO `t_dic_value` VALUES (27, 'clueState', '已联系', 3, NULL);
INSERT INTO `t_dic_value` VALUES (28, 'returnState', '推迟', 2, NULL);
INSERT INTO `t_dic_value` VALUES (29, 'returnState', '完成', 4, NULL);
INSERT INTO `t_dic_value` VALUES (30, 'clueState', '需要条件', 7, NULL);
INSERT INTO `t_dic_value` VALUES (32, 'returnState', '等待某人', 5, NULL);
INSERT INTO `t_dic_value` VALUES (33, 'source', '懂车帝', 2, NULL);
INSERT INTO `t_dic_value` VALUES (34, 'returnPriority', '常规', 5, NULL);
INSERT INTO `t_dic_value` VALUES (35, 'stage', '04产品检验', 5, NULL);
INSERT INTO `t_dic_value` VALUES (36, 'source', '易车网', 12, NULL);
INSERT INTO `t_dic_value` VALUES (37, 'stage', '02确认清单', 3, NULL);
INSERT INTO `t_dic_value` VALUES (38, 'returnPriority', '最低', 4, NULL);
INSERT INTO `t_dic_value` VALUES (39, 'source', '员工介绍', 3, NULL);
INSERT INTO `t_dic_value` VALUES (40, 'stage', '03交付定金', 4, NULL);
INSERT INTO `t_dic_value` VALUES (41, 'appellation', '女士', 3, NULL);
INSERT INTO `t_dic_value` VALUES (42, 'stage', '05付款成交', 6, NULL);
INSERT INTO `t_dic_value` VALUES (43, 'source', '官方网站', 5, NULL);
INSERT INTO `t_dic_value` VALUES (44, 'source', '公众号', 7, NULL);
INSERT INTO `t_dic_value` VALUES (45, 'source', '门店参观', 4, NULL);
INSERT INTO `t_dic_value` VALUES (46, 'intentionState', '有意向', 1, NULL);
INSERT INTO `t_dic_value` VALUES (47, 'intentionState', '无意向', 2, NULL);
INSERT INTO `t_dic_value` VALUES (48, 'intentionState', '意向不明', 3, NULL);
INSERT INTO `t_dic_value` VALUES (49, 'needLoan', '需要', 1, NULL);
INSERT INTO `t_dic_value` VALUES (50, 'needLoan', '不需要', 2, NULL);
INSERT INTO `t_dic_value` VALUES (51, 'sex', '男', 1, NULL);
INSERT INTO `t_dic_value` VALUES (52, 'sex', '女', 2, NULL);
INSERT INTO `t_dic_value` VALUES (53, 'educational', '小学', 1, NULL);
INSERT INTO `t_dic_value` VALUES (54, 'educational', '初中', 2, NULL);
INSERT INTO `t_dic_value` VALUES (55, 'educational', '高中', 3, NULL);
INSERT INTO `t_dic_value` VALUES (56, 'educational', '大学', 4, NULL);
INSERT INTO `t_dic_value` VALUES (57, 'educational', '研究生', 5, NULL);
INSERT INTO `t_dic_value` VALUES (58, 'userState', '正常', 1, NULL);
INSERT INTO `t_dic_value` VALUES (59, 'userState', '锁定', 2, NULL);
INSERT INTO `t_dic_value` VALUES (60, 'userState', '禁用', 3, NULL);
INSERT INTO `t_dic_value` VALUES (61, 'noteWay', '电话', 1, NULL);
INSERT INTO `t_dic_value` VALUES (62, 'noteWay', '微信', 2, NULL);
INSERT INTO `t_dic_value` VALUES (63, 'noteWay', 'QQ', 3, NULL);
INSERT INTO `t_dic_value` VALUES (64, 'noteWay', '面聊', 4, NULL);
INSERT INTO `t_dic_value` VALUES (65, 'noteWay', '其他', 5, NULL);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order_no` int(11) NULL DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单对应要渲染的Vue组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '市场活动', NULL, NULL, 'menu', 0, 1, 'OfficeBuilding', NULL);
INSERT INTO `t_permission` VALUES (2, '市场活动', NULL, '/dashboard/activity', 'menu', 1, 1, 'CreditCard', 'ActivityView');
INSERT INTO `t_permission` VALUES (3, '市场活动-列表', 'activity:list', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (4, '市场活动-录入', 'activity:add', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (5, '市场活动-编辑', 'activity:edit', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (6, '市场活动-查看', 'activity:view', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (7, '市场活动-删除', 'activity:delete', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (9, '市场活动-搜索', 'activity:search', NULL, 'button', 2, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (10, '线索管理', NULL, NULL, 'menu', 0, 2, 'Magnet', NULL);
INSERT INTO `t_permission` VALUES (12, '线索管理', NULL, '/dashboard/clue', 'menu', 10, 1, 'Paperclip', 'ClueView');
INSERT INTO `t_permission` VALUES (13, '线索管理-列表', 'clue:list', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (14, '线索管理-录入', 'clue:add', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (15, '线索管理-编辑', 'clue:edit', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (16, '线索管理-查看', 'clue:view', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (17, '线索管理-删除', 'clue:delete', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (18, '线索管理-导入', 'clue:import', NULL, 'button', 12, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (19, '客户管理', NULL, NULL, 'menu', 0, 3, 'User', NULL);
INSERT INTO `t_permission` VALUES (20, '客户管理', NULL, '/dashboard/customer', 'menu', 19, 1, 'UserFilled', 'CustomerView');
INSERT INTO `t_permission` VALUES (21, '客户管理-列表', 'customer:list', NULL, 'button', 20, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (22, '客户管理-查看', 'customer:view', NULL, 'button', 20, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (23, '客户管理-导出', 'customer:export', NULL, 'button', 20, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (24, '交易管理', NULL, NULL, 'menu', 0, 4, 'Wallet', NULL);
INSERT INTO `t_permission` VALUES (25, '交易管理', NULL, '/dashboard/tran', 'menu', 24, 1, 'Coin', 'TranView');
INSERT INTO `t_permission` VALUES (26, '交易管理-列表', 'tran:list', NULL, 'button', 25, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (27, '交易管理-查看', 'tran:view', NULL, 'button', 25, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (28, '产品管理', NULL, NULL, 'menu', 0, 5, 'Memo', NULL);
INSERT INTO `t_permission` VALUES (29, '产品管理', NULL, '/dashboard/product', 'menu', 28, 1, 'SetUp', 'ProductView');
INSERT INTO `t_permission` VALUES (30, '产品管理-列表', 'product:list', NULL, 'button', 29, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (31, '产品管理-录入', 'product:add', NULL, 'button', 29, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (32, '产品管理-编辑', 'product:edit', NULL, 'button', 29, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (33, '产品管理-查看', 'product:view', NULL, 'button', 29, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (34, '产品管理-删除', 'product:delete', NULL, 'button', 29, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (35, '字典管理', NULL, NULL, 'menu', 0, 6, 'Grid', NULL);
INSERT INTO `t_permission` VALUES (36, '字典类型', NULL, '/dashboard/dictype', 'menu', 35, 1, 'Postcard', 'DictypeView');
INSERT INTO `t_permission` VALUES (37, '字典类型-列表', 'dictype:list', NULL, 'button', 36, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (38, '字典类型-录入', 'dictype:add', NULL, 'button', 36, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (39, '字典类型-编辑', 'dictype:edit', NULL, 'button', 36, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (40, '字典类型-查看', 'dictype:view', NULL, 'button', 36, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (41, '字典类型-删除', 'dictype:delete', NULL, 'button', 36, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (42, '字典数据', '', '/dashboard/dicvalue', 'menu', 35, 2, 'DataAnalysis', 'DicvalueView');
INSERT INTO `t_permission` VALUES (43, '字典数据-列表', 'dicvalue:list', NULL, 'button', 42, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (44, '字典数据-录入', 'dicvalue:add', NULL, 'button', 42, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (45, '字典数据-编辑', 'dicvalue:edit', NULL, 'button', 42, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (46, '字典数据-查看', 'dicvalue:view', NULL, 'button', 42, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (47, '字典数据-删除', 'dicvalue:delete', NULL, 'button', 42, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (49, '用户管理', NULL, '/dashboard/user', 'menu', 55, 1, 'User', 'UserView');
INSERT INTO `t_permission` VALUES (50, '用户管理-列表', 'user:list', NULL, 'button', 49, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (51, '用户管理-录入', 'user:add', NULL, 'button', 49, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (52, '用户管理-编辑', 'user:edit', NULL, 'button', 49, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (53, '用户管理-查看', 'user:view', NULL, 'button', 49, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (54, '用户管理-删除', 'user:delete', NULL, 'button', 49, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (55, '系统管理', NULL, NULL, 'menu', 0, 8, 'Setting', NULL);
INSERT INTO `t_permission` VALUES (56, '系统管理', NULL, '/dashboard/system', 'menu', 55, 3, 'Tools', 'SystemView');
INSERT INTO `t_permission` VALUES (57, '系统管理-列表', 'system:list', NULL, 'button', 56, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (58, '系统管理-录入', 'system:add', NULL, 'button', 56, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (59, '系统管理-编辑', 'system:edit', NULL, 'button', 56, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (60, '系统管理-查看', 'system:view', NULL, 'button', 56, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (61, '系统管理-删除', 'system:delete', NULL, 'button', 56, NULL, NULL, NULL);
INSERT INTO `t_permission` VALUES (1112, '角色管理', NULL, '/dashboard/role', 'menu', 55, 2, 'UserFilled', 'RoleView');

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，线索ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品名称',
  `guide_price_s` decimal(10, 2) NULL DEFAULT NULL COMMENT '官方指导起始价',
  `guide_price_e` decimal(10, 2) NULL DEFAULT NULL COMMENT '官方指导最高价',
  `quotation` decimal(10, 2) NULL DEFAULT NULL COMMENT '经销商报价',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态 0在售 1售罄',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_product_ibfk_1`(`create_by`) USING BTREE,
  INDEX `t_product_ibfk_2`(`edit_by`) USING BTREE,
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_product_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '海鸥', 10.18, 10.58, 9.28, 0, '2023-04-06 18:25:00', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (2, '比亚迪e2', 10.28, 10.98, 9.78, 0, '2023-04-03 15:26:12', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (3, '比亚迪e3', 15.48, 15.98, 14.38, 0, '2023-04-03 11:29:08', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (4, '海豚', 11.68, 13.68, 10.86, 0, '2023-04-09 10:27:47', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (5, '秦EV', 12.99, 16.98, 11.98, 0, '2023-04-08 15:28:23', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (6, '秦PLUS DM-i', 9.98, 16.58, 9.06, 0, '2023-04-10 19:29:53', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (7, '秦PLUS EV', 12.98, 18.08, 12.38, 0, '2023-04-05 09:30:31', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (8, '海豹', 21.28, 28.98, 20.18, 0, '2023-04-02 10:31:08', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (9, '汉DM', 21.78, 32.18, 19.88, 0, '2023-04-07 16:31:45', 1, NULL, NULL);
INSERT INTO `t_product` VALUES (10, '宋PLUS EV', 18.68, 20.38, 17.86, 0, '2023-03-18 21:33:08', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', '管理员');
INSERT INTO `t_role` VALUES (2, 'saler', '销售员');
INSERT INTO `t_role` VALUES (3, 'manager', '销售经理');
INSERT INTO `t_role` VALUES (4, 'marketing ', '市场营销');
INSERT INTO `t_role` VALUES (5, 'accountant', '会计');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_role_permission_ibfk_1`(`role_id`) USING BTREE,
  INDEX `t_role_permission_ibfk_2`(`permission_id`) USING BTREE,
  CONSTRAINT `t_role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1, 1);
INSERT INTO `t_role_permission` VALUES (2, 1, 2);
INSERT INTO `t_role_permission` VALUES (3, 1, 3);
INSERT INTO `t_role_permission` VALUES (4, 1, 4);
INSERT INTO `t_role_permission` VALUES (5, 1, 5);
INSERT INTO `t_role_permission` VALUES (6, 1, 6);
INSERT INTO `t_role_permission` VALUES (7, 1, 7);
INSERT INTO `t_role_permission` VALUES (8, 1, 9);
INSERT INTO `t_role_permission` VALUES (9, 1, 10);
INSERT INTO `t_role_permission` VALUES (10, 1, 12);
INSERT INTO `t_role_permission` VALUES (11, 1, 13);
INSERT INTO `t_role_permission` VALUES (12, 1, 14);
INSERT INTO `t_role_permission` VALUES (13, 1, 15);
INSERT INTO `t_role_permission` VALUES (14, 1, 16);
INSERT INTO `t_role_permission` VALUES (15, 1, 17);
INSERT INTO `t_role_permission` VALUES (16, 1, 18);
INSERT INTO `t_role_permission` VALUES (17, 1, 19);
INSERT INTO `t_role_permission` VALUES (18, 1, 20);
INSERT INTO `t_role_permission` VALUES (19, 1, 21);
INSERT INTO `t_role_permission` VALUES (20, 1, 22);
INSERT INTO `t_role_permission` VALUES (21, 1, 23);
INSERT INTO `t_role_permission` VALUES (22, 1, 24);
INSERT INTO `t_role_permission` VALUES (23, 1, 25);
INSERT INTO `t_role_permission` VALUES (24, 1, 26);
INSERT INTO `t_role_permission` VALUES (25, 1, 27);
INSERT INTO `t_role_permission` VALUES (26, 1, 28);
INSERT INTO `t_role_permission` VALUES (27, 1, 29);
INSERT INTO `t_role_permission` VALUES (28, 1, 30);
INSERT INTO `t_role_permission` VALUES (29, 1, 31);
INSERT INTO `t_role_permission` VALUES (30, 1, 32);
INSERT INTO `t_role_permission` VALUES (31, 1, 33);
INSERT INTO `t_role_permission` VALUES (32, 1, 34);
INSERT INTO `t_role_permission` VALUES (33, 1, 35);
INSERT INTO `t_role_permission` VALUES (34, 1, 36);
INSERT INTO `t_role_permission` VALUES (35, 1, 37);
INSERT INTO `t_role_permission` VALUES (36, 1, 38);
INSERT INTO `t_role_permission` VALUES (37, 1, 39);
INSERT INTO `t_role_permission` VALUES (38, 1, 40);
INSERT INTO `t_role_permission` VALUES (39, 1, 41);
INSERT INTO `t_role_permission` VALUES (40, 1, 42);
INSERT INTO `t_role_permission` VALUES (41, 1, 43);
INSERT INTO `t_role_permission` VALUES (42, 1, 44);
INSERT INTO `t_role_permission` VALUES (43, 1, 45);
INSERT INTO `t_role_permission` VALUES (44, 1, 46);
INSERT INTO `t_role_permission` VALUES (45, 1, 47);
INSERT INTO `t_role_permission` VALUES (47, 1, 49);
INSERT INTO `t_role_permission` VALUES (48, 1, 50);
INSERT INTO `t_role_permission` VALUES (49, 1, 51);
INSERT INTO `t_role_permission` VALUES (50, 1, 52);
INSERT INTO `t_role_permission` VALUES (51, 1, 53);
INSERT INTO `t_role_permission` VALUES (52, 1, 54);
INSERT INTO `t_role_permission` VALUES (53, 1, 55);
INSERT INTO `t_role_permission` VALUES (54, 1, 56);
INSERT INTO `t_role_permission` VALUES (55, 1, 57);
INSERT INTO `t_role_permission` VALUES (56, 1, 58);
INSERT INTO `t_role_permission` VALUES (57, 1, 59);
INSERT INTO `t_role_permission` VALUES (58, 1, 60);
INSERT INTO `t_role_permission` VALUES (59, 1, 61);
INSERT INTO `t_role_permission` VALUES (60, 2, 10);
INSERT INTO `t_role_permission` VALUES (61, 2, 12);
INSERT INTO `t_role_permission` VALUES (62, 2, 13);
INSERT INTO `t_role_permission` VALUES (63, 2, 14);
INSERT INTO `t_role_permission` VALUES (64, 2, 15);
INSERT INTO `t_role_permission` VALUES (65, 2, 16);
INSERT INTO `t_role_permission` VALUES (66, 2, 57);
INSERT INTO `t_role_permission` VALUES (67, 2, 18);
INSERT INTO `t_role_permission` VALUES (68, 2, 19);
INSERT INTO `t_role_permission` VALUES (69, 2, 20);
INSERT INTO `t_role_permission` VALUES (70, 2, 21);
INSERT INTO `t_role_permission` VALUES (71, 2, 22);
INSERT INTO `t_role_permission` VALUES (72, 2, 23);
INSERT INTO `t_role_permission` VALUES (73, 2, 24);
INSERT INTO `t_role_permission` VALUES (74, 2, 25);
INSERT INTO `t_role_permission` VALUES (75, 2, 26);
INSERT INTO `t_role_permission` VALUES (76, 2, 27);

-- ----------------------------
-- Table structure for t_system_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_info`;
CREATE TABLE `t_system_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortcuticon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` varchar(145) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `closeMsg` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isopen` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'y',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` int(11) NULL DEFAULT NULL,
  `edit_time` datetime NULL DEFAULT NULL,
  `edit_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_system_info_ibfk_1`(`create_by`) USING BTREE,
  INDEX `t_system_info_ibfk_2`(`edit_by`) USING BTREE,
  CONSTRAINT `t_system_info_ibfk_1` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_system_info_ibfk_2` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_system_info
-- ----------------------------
INSERT INTO `t_system_info` VALUES (1, 'crm', '动力云客系统', 'http://www.bjpowernode.com', 'http://localhost:8080/image/logo.png', '动力云客系统', '动力CRM 企业客户智慧云管理', 'crm, 客户, 客户关系, 客户关系管理', 'http://www.bjpowernode.com/favicon.ico', '010-84846003', '123456789', '123456789@qq.com', '北京市大兴区大族企业湾10栋3层', '系统版本:1.1.0.bate', '网站维护中 动力云客系统 http://www.bjpowernode.com', 'true', '2023-11-08 13:28:18', 1, NULL, NULL);
INSERT INTO `t_system_info` VALUES (2, 'call', '动力呼叫系统', 'http://www.bjpowernode.com', 'http://localhost:8080/image/logo.png', '动力呼叫系统', '动力CRM 企业客户智慧云管理', 'crm, 客户, 客户关系, 客户关系管理', 'http://www.bjpowernode.com/favicon.ico', '010-84846003', '123456789', '123456789@qq.com', '北京市大兴区大族企业湾10栋3层', '系统版本:1.1.0.bate', '网站维护中 动力呼叫系统 http://www.bjpowernode.com', 'true', '2023-11-08 13:28:21', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_tran
-- ----------------------------
DROP TABLE IF EXISTS `t_tran`;
CREATE TABLE `t_tran`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易ID',
  `tran_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `expected_date` datetime NULL DEFAULT NULL COMMENT '预计成交日期',
  `stage` int(11) NULL DEFAULT NULL COMMENT '交易所处阶段',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易描述',
  `next_contact_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_tran_ibfk_1`(`customer_id`) USING BTREE,
  INDEX `t_tran_ibfk_2`(`stage`) USING BTREE,
  INDEX `t_tran_ibfk_3`(`create_by`) USING BTREE,
  INDEX `t_tran_ibfk_4`(`edit_by`) USING BTREE,
  CONSTRAINT `t_tran_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_2` FOREIGN KEY (`stage`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 613 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tran
-- ----------------------------
INSERT INTO `t_tran` VALUES (1, '202311121932019432', 7, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (5, '202311121932019431', 1, 120000.00, '2023-11-14 00:00:00', 42, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (6, '202311121932019432', 2, 93000.00, '2023-11-12 00:00:00', 42, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (7, '202311121932019432', 3, 93000.00, '2023-11-12 00:00:00', 42, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (8, '202311121932019432', 4, 93000.00, '2023-11-12 00:00:00', 42, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (9, '202311121932019432', 6, 93000.00, '2023-11-12 00:00:00', 42, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (10, '202311121932019432', 5, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (11, '202311121932019432', 8, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (12, '202311121932019432', 10, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (13, '202311121932019432', 11, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (14, '202311121932019432', 12, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (15, '202311121932019432', 13, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (16, '202311121932019432', 14, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (17, '202311121932019432', 15, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);
INSERT INTO `t_tran` VALUES (612, '202311121932019432', 9, 93000.00, '2023-11-12 00:00:00', 12, '123131', '2023-11-29 00:00:00', '2023-11-12 19:32:02', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `t_tran_history`;
CREATE TABLE `t_tran_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易记录ID',
  `tran_id` int(11) NULL DEFAULT NULL COMMENT '交易ID',
  `stage` int(11) NULL DEFAULT NULL COMMENT '交易阶段',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `expected_date` datetime NULL DEFAULT NULL COMMENT '交易预计成交时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_tran_history_ibfk_1`(`tran_id`) USING BTREE,
  INDEX `t_tran_history_ibfk_2`(`stage`) USING BTREE,
  INDEX `t_tran_history_ibfk_3`(`create_by`) USING BTREE,
  CONSTRAINT `t_tran_history_ibfk_1` FOREIGN KEY (`tran_id`) REFERENCES `t_tran` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_history_ibfk_2` FOREIGN KEY (`stage`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_history_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易历史记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tran_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `t_tran_remark`;
CREATE TABLE `t_tran_remark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，交易备注ID',
  `tran_id` int(11) NULL DEFAULT NULL COMMENT '交易ID',
  `note_way` int(11) NULL DEFAULT NULL COMMENT '跟踪方式',
  `note_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跟踪内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '跟踪时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '跟踪人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '删除状态（0正常，1删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_tran_remark_ibfk_1`(`tran_id`) USING BTREE,
  INDEX `t_tran_remark_ibfk_2`(`note_way`) USING BTREE,
  INDEX `t_tran_remark_ibfk_3`(`create_by`) USING BTREE,
  INDEX `t_tran_remark_ibfk_4`(`edit_by`) USING BTREE,
  CONSTRAINT `t_tran_remark_ibfk_1` FOREIGN KEY (`tran_id`) REFERENCES `t_tran` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_2` FOREIGN KEY (`note_way`) REFERENCES `t_dic_value` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_3` FOREIGN KEY (`create_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_tran_remark_ibfk_4` FOREIGN KEY (`edit_by`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易跟踪记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动增长，用户ID',
  `login_act` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `login_pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `account_no_expired` int(11) NULL DEFAULT NULL COMMENT '账户是否没有过期，0已过期 1正常',
  `credentials_no_expired` int(11) NULL DEFAULT NULL COMMENT '密码是否没有过期，0已过期 1正常',
  `account_no_locked` int(11) NULL DEFAULT NULL COMMENT '账号是否没有锁定，0已锁定 1正常',
  `account_enabled` int(11) NULL DEFAULT NULL COMMENT '账号是否启用，0禁用 1启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '编辑时间',
  `edit_by` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login_act`(`login_act`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '$2a$10$M/Cj/AMCXXHbf3nlRhivoO81o5n9ETel0Mo8v5QAjYMKrzJP6w1Ei', '管理员', '13700000000', 'admin@qq.com', 1, 1, 1, 1, '2023-02-22 09:37:12', NULL, '2024-06-24 10:48:48', 1, '2024-01-11 11:20:17');
INSERT INTO `t_user` VALUES (2, 'yuyan', '$2a$10$WEkWUvuJOV/q7lRXzmdvgulskx8EhLPU8N.hdnfNyk.AYqYSPwYHa', '于嫣', '13809090908', 'yuyan@163.com', 1, 1, 1, 1, '2023-02-28 12:11:40', 1, '2024-06-22 16:31:32', 2, '2023-12-11 21:07:07');
INSERT INTO `t_user` VALUES (3, 'zhangqi', '$2a$10$Q0qTW6QqkabTzFyoilViw..YdrVzZkSKe5RvLmjgPgW/IrcPkBoF.', '张琪', '1362362323', 'zhangqi@qq.com', 1, 1, 1, 1, '2023-03-02 11:37:34', NULL, '2023-05-23 00:21:02', NULL, '2023-12-11 21:07:28');
INSERT INTO `t_user` VALUES (4, 'suwanting', '$2a$10$3bambNLTCAKtQn2OXPiHb.f0SzH.MucTiLi6GPT6nQrYpsxsdxaFi', '苏婉婷', NULL, 'suwanting@qq.com', 1, 1, 1, 1, '2023-04-03 15:04:54', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (5, 'wuxiaoxiao', '$2a$10$Lmk5wXYkZzQMFJEcXVZAZegIQhnAm6ONHpz09X/.gbOh5ze5fU6MW', '吴潇潇', NULL, 'wuxiaoxiao@qq.com', 1, 1, 1, 1, '2023-01-27 12:15:26', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (6, 'mengyan', '$2a$10$6zGT7CfeuJ/6jZPk1pAqcuiMYDnCJstrceThGD5DVVOA5XvOP/sQq', '孟岩', NULL, 'mengyan@163.com', 1, 1, 1, 1, '2023-03-19 10:17:28', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (7, 'yuanhuimin', '$2a$10$mbsloGtPV7cDwfAVYxuvLemQRWumZKrDxVZxg4fnbfaocnfZFlYuu', '袁慧敏', NULL, 'yuanhuimin@11.com', 1, 1, 1, 1, '2023-04-11 20:18:50', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (8, 'qinxuwen', '$2a$10$ir8uLlBrPMHRtGiu5Ajkv.UKcRacXWRen7zxelp9iUaco3WhGkJ36', '秦旭文', '13820000000', 'qinxuwen@163.com', 1, 1, 1, 1, '2023-03-19 21:11:37', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (9, 'chengjie', '$2a$10$jQR8yyF/ailGP/zW6G4JOOffzWOXhe02Rgw7MZLfxL.IGFdM3cjM2', '程杰', '13500000000', 'chengjie@qq.com', 1, 1, 1, 1, '2023-04-16 07:16:19', NULL, '2023-04-20 21:42:21', NULL, NULL);
INSERT INTO `t_user` VALUES (10, 'zhouliang', '$2a$10$0yOGdkAcG8JLEcoEmmCnfO8Vp6rcqBnn30k6pGor5Z0.eLMyLEd7.', '周亮', '13800000008', 'zhouliang@163.com', 1, 1, 1, 1, '2023-03-18 13:13:45', NULL, '2024-06-22 16:49:57', 2, NULL);
INSERT INTO `t_user` VALUES (11, 'zhangwei', '$2a$10$BfOgsdSAZ9VYBOzv692BM.oWGPLktcqhhjU3AaWESkGNRcW484N7O', '张伟', NULL, 'zhangwei@qq.com', 1, 1, 1, 1, '2023-03-06 09:18:23', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (12, 'dengping', '$2a$10$hpN8orfqUFXb.WWbIoZBkOZrr6D8rdSbl/SWXsMQ0zEuqkldlkpW2', '邓萍', NULL, 'dengping@qq.com', 1, 1, 1, 1, '2023-02-19 20:10:58', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (13, 'zhangxing', '$2a$10$uBVDcCCJQvTfoFCjbjwrf.MhyczNNJfCn76jD61CsAgsUlXjXhxzG', '张欣', NULL, 'zhangxing@qq.com', 1, 1, 1, 1, '2023-03-17 12:12:11', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (14, 'zhangmeng', '$2a$10$MMHG2cQh4H4YFbdf48SnyO9IZ78F110x3.7IWGNExrgk2rFmhrd/u', '张萌', NULL, 'zhangmeng@qq.com', 1, 1, 1, 1, '2023-01-13 08:16:02', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (15, 'shixixiang', '$2a$10$zYwq/QfevFPAZxw4b2DkCeQvjVQ52AUU9c4aC0uS0wTJaRr75G74y', '石喜祥', NULL, 'shixixiang@qq.com', 1, 1, 1, 1, '2023-03-10 15:19:49', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (16, 'chengjiuming', '$2a$10$yNN5TcFkM4OqRsKGNM8CNeqAJhRYKQgXVFqbre5lQPicnIXT7THTu', '陈久明', NULL, 'chengjiuming@163.com', 1, 1, 1, 1, '2023-04-09 23:17:37', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (17, 'genghao', '$2a$10$rWHo.vUpJCbqWLGMkPj95O5FlhaQLzro.LY7pVQ/UnVVAdvjEAy0K', '耿浩', NULL, 'genghao@qq.com', 1, 1, 1, 1, '2023-03-19 12:10:22', NULL, '2023-04-10 21:42:21', NULL, NULL);
INSERT INTO `t_user` VALUES (18, 'hanmingyang', '$2a$10$PRMdG7a8nFIN1A3TD584Xe2BZI7Y0mktDL7Wp5lF88E1D1iPijFc6', '韩明洋', NULL, 'hanmingyang@163.com', 1, 1, 1, 1, '2023-02-12 18:13:01', NULL, '2023-04-13 23:43:25', NULL, NULL);
INSERT INTO `t_user` VALUES (19, 'xuyan', '$2a$10$S7MF2dOqFcoOJPqpEH2nu.Muhn2XC0BlBTZ5gAoL3axrQxdJEJNnK', '徐燕', NULL, 'xuyan@qq.com', 1, 1, 1, 1, '2023-03-29 13:16:15', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (20, 'chengjuan', '$2a$10$m1g5cxikApV05pR7Cx4cy.d4sT3efOl6UvDLvH27WzMjtpymQ5ANi', '程娟', NULL, 'chengjuan@qq.com', 1, 1, 1, 1, '2023-02-19 15:12:22', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (21, 'huangxiao', '$2a$10$R/RwQd5.3OxYpSZBLIn8DeeYYNF0vgWCrCR4tcyL.c/HtnuIfBRIK', '黄潇', NULL, 'huangxiao@qq.com', 1, 1, 1, 1, '2023-03-26 22:11:37', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (22, 'yangyuxin', '$2a$10$ucE/By6NLBb4tN5H3CUimOQ2eAtbjXFf2v77SJUPbHXRI9lTF97Ka', '杨雨欣', NULL, 'yangyuxin@163.com', 1, 1, 1, 1, '2023-04-13 18:14:59', NULL, NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (23, 'xiaojie', '$2a$10$A215.iFSp7/d99X5M6KE.eu5YvA7nJ5vNEJraxmpA8EUYJN6lx9rW', '肖捷', NULL, 'xiaojie@163.com', 1, 1, 1, 1, '2023-02-18 09:19:02', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_user_role_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_user_role_ibfk_2`(`role_id`) USING BTREE,
  CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (2, 2, 2);
INSERT INTO `t_user_role` VALUES (3, 3, 2);
INSERT INTO `t_user_role` VALUES (4, 4, 3);
INSERT INTO `t_user_role` VALUES (5, 5, 4);
INSERT INTO `t_user_role` VALUES (6, 6, 5);

SET FOREIGN_KEY_CHECKS = 1;

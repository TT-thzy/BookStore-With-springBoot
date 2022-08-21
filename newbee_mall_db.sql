/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : newbee_mall_db

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/05/2022 17:43:19
*/

create database newbee_mall_db;

use newbee_mall_db;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user`;
CREATE TABLE `tb_newbee_mall_admin_user` (
  `admin_user_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  `role_id` bigint NOT NULL COMMENT '角色id',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_admin_user` VALUES (1, 'admin', 'admin', '王晓光', 0, 1);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (2, 'guest', 'guest', '客户', 0, 2);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_announcement
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_announcement`;
CREATE TABLE `tb_newbee_mall_announcement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除 0否1是',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tb_newbee_mall_announcement_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='共告表';

-- ----------------------------
-- Records of tb_newbee_mall_announcement
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_announcement` VALUES (2, '网上书城正式上线啦', 0, '2022-01-17 18:43:15', 10);
INSERT INTO `tb_newbee_mall_announcement` VALUES (3, '双11大促活动正式来临！！！！', 0, '2022-02-22 11:32:46', 10);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_carousel`;
CREATE TABLE `tb_newbee_mall_carousel` (
  `carousel_id` int NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '''##''' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int NOT NULL DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_carousel
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_carousel` VALUES (2, 'http://localhost:28089/upload/20220220_22130268.jpg', '#', 13, 1, '2019-11-29 00:00:00', 0, '2022-02-22 00:22:21', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (5, 'http://localhost:28089/upload/20220220_22131714.jpg', '#', 0, 1, '2019-11-29 00:00:00', 0, '2022-02-22 00:22:28', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (6, 'http://localhost:28089/upload/20220220_22133322.jpg', '##', 0, 1, '2022-02-20 22:13:36', 0, '2022-04-02 14:00:22', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (7, 'http://localhost:28089/upload/20220222_00224796.jpg', '##', 0, 1, '2022-02-22 00:22:49', 0, '2022-04-02 14:00:22', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (8, 'http://localhost:28089/upload/20220222_00230014.jpg', '##', 0, 1, '2022-02-22 00:23:01', 0, '2022-04-02 14:00:22', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (9, 'http://localhost:28089/upload/20220505_22572419.jpg', '##', 0, 0, '2022-05-05 22:57:31', 0, '2022-05-05 22:57:31', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (10, 'http://localhost:28089/upload/20220505_22575480.jpg', '##', 0, 0, '2022-05-05 22:57:56', 0, '2022-05-05 22:57:56', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (11, 'http://localhost:28089/upload/20220505_2258044.jpg', '##', 0, 0, '2022-05-05 22:58:06', 0, '2022-05-05 22:58:06', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_category`;
CREATE TABLE `tb_newbee_mall_goods_category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint NOT NULL DEFAULT '0' COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父分类id',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` int DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_category
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_goods_category` VALUES (15, 1, 0, '童书', 100, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:27:38', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (16, 1, 0, '文学', 99, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:30:56', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (17, 2, 15, '幼儿启蒙', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:28:07', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (18, 2, 15, '益智游戏', 9, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:28:22', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (20, 3, 17, '中国儿童文学', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:29:38', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (21, 3, 17, '图画书', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:29:58', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (22, 3, 17, '婴儿读物', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:30:12', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (42, 3, 18, '左右脑开发', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 18:01:00', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (43, 3, 18, '贴纸游戏书', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 18:01:10', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (59, 1, 0, '教辅', 97, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:43:25', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (60, 1, 0, '艺术', 96, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:47:29', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (61, 1, 0, '历史', 98, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:33:45', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (62, 1, 0, '管理', 94, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:48:30', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (67, 2, 16, '中国现当代随笔', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:31:32', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (68, 2, 16, '文学理论', 9, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:31:51', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (70, 2, 61, '中国史', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:34:15', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (71, 2, 61, '世界史', 9, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:34:31', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (76, 3, 67, '人民文学出版社', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:32:55', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (77, 3, 70, '现代史', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:35:11', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (78, 3, 73, '小学教材全解', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:44:47', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (79, 2, 60, '绘画', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:49:06', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (80, 2, 60, '书法', 9, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:49:19', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (82, 3, 79, '素描', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:50:27', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (83, 2, 62, '电子商务', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:51:35', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (84, 2, 62, '市场营销', 9, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:51:58', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (86, 3, 83, '电子工业出版社', 10, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:53:14', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (107, 3, 67, '长江文艺出版社', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:33:24', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (108, 3, 70, '中国通史', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:35:39', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (109, 3, 74, '5年高考3年模拟', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:47:01', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (110, 3, 80, '字帖', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:50:46', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (111, 3, 84, '机械工业出版社', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 17:53:54', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (112, 3, 68, '苏轼十讲', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 18:02:55', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (113, 3, 71, '亚洲史', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 18:04:22', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (114, 3, 71, '欧洲史', 0, 0, '2022-02-20 11:46:03', 0, '2022-02-21 18:04:31', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_info`;
CREATE TABLE `tb_newbee_mall_goods_info` (
  `goods_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint NOT NULL DEFAULT '0' COMMENT '关联分类id',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `original_price` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '商品价格',
  `selling_price` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '商品实际售价',
  `stock_num` int NOT NULL DEFAULT '0' COMMENT '商品库存数量',
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint NOT NULL DEFAULT '0' COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int NOT NULL DEFAULT '0' COMMENT '添加者主键id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品添加时间',
  `update_user` int NOT NULL DEFAULT '0' COMMENT '修改者主键id',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10926 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_goods_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10907, '亲爱的小孩 猜猜世界多有趣 多位国际插画大师倾心绘制', '本书专为3-6岁孩子打造，儿童文学作者撰写奇趣科普童话，国际绘本大师绘制精美插图', 20, 'http://localhost:28089/upload/20220221_17372562.jpg', 'http://localhost:28089/upload/20220221_17372562.jpg', '<h2>多位国际插画大师倾心绘制，丰富知识融入不同主题科普绘本故事，亲子共读体验“玩”科学的乐趣，拓展实践提高孩子综合潜能</h2>', 32.50, 45.99, 10, '童书', 0, 0, '2022-01-20 07:09:50', 0, '2022-02-21 17:37:58');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10908, '图画书', '《科学聊起来》（全15册，孩子能读懂的科学书，孩子视角+语言，轻松了解科普知识中的十万个为什么，含科技、数学、物理、化学、天文、生物。', 21, 'http://localhost:28089/upload/20220221_18050873.jpg', 'http://localhost:28089/upload/20220221_18050873.jpg', '<p>《科学聊起来》（全15册，孩子能读懂的科学书，孩子视角+语言，轻松了解科普知识中的十万个为什么，含科技、数学、物理、化学、天文、生物。</p>', 47.90, 47.00, 44, '人民文学出版社', 0, 0, '2022-02-21 18:06:08', 0, '2022-04-02 14:03:28');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10909, '婴儿读物', '颠覆对十二生肖动物的传统认识，影响了中国三代孩子，时隔十年，第三版图文并全新上市，荣获联合国全球十大图书\"，适合7-14岁阅读的儿童文学作品。', 22, 'http://localhost:28089/upload/20220221_18065967.jpg', 'http://localhost:28089/upload/20220221_18065967.jpg', '<p>颠覆对十二生肖动物的传统认识，影响了中国三代孩子，时隔十年，第三版图文并全新上市，荣获联合国全球十大图书\"，适合7-14岁阅读的儿童文学作品。</p>', 98.00, 98.00, 56, '人民邮电出版社', 0, 0, '2022-02-21 18:07:12', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10910, '左右脑开发', '获2018站酷奖绘本类优秀奖，钱儿爸、年糕妈妈、小小包麻麻、尹建莉等100+家自媒体联袂推荐，一套书了解人类日常生活的“前世今生”，萌趣幽默水墨风，轻松愉悦历史观，睡前亲子好读伴！', 42, 'http://localhost:28089/upload/20220221_18080725.jpg', 'http://localhost:28089/upload/20220221_18080725.jpg', '<p>获2018站酷奖绘本类优秀奖，钱儿爸、年糕妈妈、小小包麻麻、尹建莉等100+家自媒体联袂推荐，一套书了解人类日常生活的“前世今生”，萌趣幽默水墨风，轻松愉悦历史观，睡前亲子好读伴！</p>', 47.90, 47.90, 34, '贵州人民出版社', 0, 0, '2022-02-21 18:08:17', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10911, '贴纸游戏书', '什么是什么”系列是德国知名的少儿科普品牌，该系列百科全书出版60年以来长盛不衰，全球累计销量超过100000000册，是市场信赖的科普大品牌，自上市以来取得了不错的销量和口碑。', 43, 'http://localhost:28089/upload/20220221_18102580.jpg', 'http://localhost:28089/upload/20220221_18102580.jpg', '<p>什么是什么”系列是德国知名的少儿科普品牌，该系列百科全书出版60年以来长盛不衰，全球累计销量超过100000000册，是市场信赖的科普大品牌，自上市以来取得了不错的销量和口碑。<br/></p>', 34.00, 34.00, 67, '北京大学出版社', 0, 0, '2022-02-21 18:10:31', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10912, '当代文学', '纪念丰子恺先生诞辰120周年！丰子恺*温暖的散文作品，全彩插图珍藏本，一本书阅尽丰子恺艺术精华 全面收录《渐》《大账簿》《梦痕》《给孩子们》等40篇丰子恺经典散文作品，精选40余幅全彩漫画，', 76, 'http://localhost:28089/upload/20220221_18115458.jpg', 'http://localhost:28089/upload/20220221_18115458.jpg', '<p>&nbsp;纪念丰子恺先生诞辰120周年！丰子恺*温暖的散文作品，全彩插图珍藏本，一本书阅尽丰子恺艺术精华 全面收录《渐》《大账簿》《梦痕》《给孩子们》等40篇丰子恺经典散文作品，精选40余幅全彩漫画，<br/></p>', 45.60, 45.60, 66, '人民文学出版社', 0, 0, '2022-02-21 18:13:04', 0, '2022-02-22 11:00:18');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10913, '时间从来不语', '时间从来不语，却回答了所有问题；岁月从来不言，却见证了所有真心。 时间拉开了距离，也证明了一切。', 107, 'http://localhost:28089/upload/20220221_1821227.jpg', 'http://localhost:28089/upload/20220221_1821227.jpg', '<p>时间从来不语，却回答了所有问题；岁月从来不言，却见证了所有真心。 时间拉开了距离，也证明了一切。<br/></p>', 45.00, 45.00, 21, '北京大学出版社', 0, 0, '2022-02-21 18:21:25', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10914, '苏轼十讲', '备受复旦学生推崇的名家名课，古代文学大家 王水照、陈尚君特别推荐。 本书以十个专题展现出极为丰富而多元的苏轼，给东坡的粉丝们观看苏轼、理解苏轼及其时代以更多角度，为阅读东坡的作品注入了深度与广度。', 112, 'http://localhost:28089/upload/20220221_18234617.jpg', 'http://localhost:28089/upload/20220221_18234617.jpg', '<p>备受复旦学生推崇的名家名课，古代文学大家 王水照、陈尚君特别推荐。 本书以十个专题展现出极为丰富而多元的苏轼，给东坡的粉丝们观看苏轼、理解苏轼及其时代以更多角度，为阅读东坡的作品注入了深度与广度。&nbsp;<br/></p>', 12.00, 12.00, 32, '陕西人民出版社', 0, 0, '2022-02-21 18:23:51', 0, '2022-05-05 22:54:20');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10915, '现代史', '研究五四运动、了解近代中国，难以逾越的一部经典著作 对五四运动的研究，避免了宽泛的宏大叙述，而是着眼回归事件现场，考证每一个细节，苦心孤诣还原历史真实', 77, 'http://localhost:28089/upload/20220221_18254081.jpg', 'http://localhost:28089/upload/20220221_18254081.jpg', '<p>研究五四运动、了解近代中国，难以逾越的一部经典著作 对五四运动的研究，避免了宽泛的宏大叙述，而是着眼回归事件现场，考证每一个细节，苦心孤诣还原历史真实 这是一部研究 五四 而不仅仅停留在 五四 的著作。<br/></p>', 56.00, 56.00, 52, '贵州人民出版社', 0, 0, '2022-02-21 18:26:11', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10916, '中国通史', '.吕思勉先生写给普通读者的中国通史入门书 。 2.吕思勉与陈垣、陈寅恪、钱穆并称 史学四大家 。 3.吕思勉是易中天推崇的史学导师，易中天《品三国》屡次称颂吕思勉。', 108, 'http://localhost:28089/upload/20220221_18275854.jpg', 'http://localhost:28089/upload/20220221_18275854.jpg', '<p>.吕思勉先生写给普通读者的中国通史入门书 。 2.吕思勉与陈垣、陈寅恪、钱穆并称 史学四大家 。 3.吕思勉是易中天推崇的史学导师，易中天《品三国》屡次称颂吕思勉。<br/></p>', 56.00, 56.00, 22, '陕西人民出版社', 0, 0, '2022-02-21 18:28:02', 0, '2022-02-22 11:25:01');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10917, '亚洲史', '1. 恒河是印度的生命之河，也是一系列文明的摇篮，在世界舞台上具有无与伦比的意义。《恒河三千年》是作者耗时四年的第1手报告和研究的呈现，讲述一个立体、有趣、变幻中的恒河史。从', 113, 'http://localhost:28089/upload/20220221_18292623.jpg', 'http://localhost:28089/upload/20220221_18292623.jpg', '<p>1. 恒河是印度的生命之河，也是一系列文明的摇篮，在世界舞台上具有无与伦比的意义。《恒河三千年》是作者耗时四年的第1手报告和研究的呈现，讲述一个立体、有趣、变幻中的恒河史。从<br/></p>', 150.00, 150.00, 45, '人民邮电出版社', 0, 0, '2022-02-21 18:29:31', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10918, '欧洲史', '阿拉伯世界历史 的里程碑式巨作、国际畅销书。在这一版本中，罗根阐述了该地区*的地缘政治发展。', 114, 'http://localhost:28089/upload/20220221_18304577.jpg', 'http://localhost:28089/upload/20220221_18304577.jpg', '<p>阿拉伯世界历史 的里程碑式巨作、国际畅销书。在这一版本中，罗根阐述了该地区*的地缘政治发展。&nbsp;<br/></p>', 34.00, 34.00, 5, '北京联合出版公司', 0, 0, '2022-02-21 18:30:49', 0, '2022-05-12 11:39:47');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10919, '小学教材全解', '《小学教材全解》丛书自2006年问世以来，备受广大师生的呵护与厚爱。历经多年的精心打造，日趋成熟，赢得了全国教育专家和老师、家长、同学的认可和好评', 78, 'http://localhost:28089/upload/20220221_18322436.jpg', 'http://localhost:28089/upload/20220221_18322436.jpg', '<p>《小学教材全解》丛书自2006年问世以来，备受广大师生的呵护与厚爱。历经多年的精心打造，日趋成熟，赢得了全国教育专家和老师、家长、同学的认可和好评，现在已经成为大家喜爱的学习用书。2<br/></p>', 34.00, 34.00, 3, '人民邮电出版社', 0, 0, '2022-02-21 18:32:30', 0, '2022-02-22 11:28:02');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10920, '5年高考3年模拟', '在备战高考的过程中，相信对于每一个想跨越词汇关的考生来说，“如何快速、有效地记单词”是大家关心的问题。而在时间有限的情况下，如何实现短期突破，选对一本实用的词汇书则显得尤为重要。', 109, 'http://localhost:28089/upload/20220221_18350663.jpg', 'http://localhost:28089/upload/20220221_18350663.jpg', '<p>在备战高考的过程中，相信对于每一个想跨越词汇关的考生来说，“如何快速、有效地记单词”是大家关心的问题。而在时间有限的情况下，如何实现短期突破，选对一本实用的词汇书则显得尤为重要。<br/></p>', 98.00, 98.00, 44, '北京大学出版社', 0, 0, '2022-02-21 18:35:10', 0, '2022-05-12 15:27:30');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10921, '素描', '这是一本写给绘画爱好者的素描基础书，全面覆盖素描5大题材：石膏几何体 石膏头像 素描静物 人物头像 人物半身像 人物速写，本书的重点是加强素描基本技法训练，从而提高学习者的综合素质与实践能力。在', 82, 'http://localhost:28089/upload/20220221_18363589.jpg', 'http://localhost:28089/upload/20220221_18363589.jpg', '<p>这是一本写给绘画爱好者的素描基础书，全面覆盖素描5大题材：石膏几何体 石膏头像 素描静物 人物头像 人物半身像 人物速写，本书的重点是加强素描基本技法训练，从而提高学习者的综合素质与实践能力。在<br/></p>', 13.00, 13.00, 4, '人民邮电出版社', 0, 0, '2022-02-21 18:36:40', 0, NULL);
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10922, '字帖', '华夏万卷字帖5本装 正楷一本通田英章书 楷书硬笔书法学生成人钢笔字帖 大学男女生临摹描红手写体', 110, 'http://localhost:28089/upload/20220221_1837405.jpg', 'http://localhost:28089/upload/20220221_1837405.jpg', '<p><a href=\"http://product.dangdang.com/25147189.html\" target=\"_blank\">华夏万卷字帖5本装 正楷一本通田英章书 楷书硬笔书法学生成人钢笔字帖 大学男女生临摹描红手写体&nbsp;</a><br/></p>', 34.00, 34.00, 63, '陕西人民出版社', 0, 0, '2022-02-21 18:37:46', 0, '2022-02-22 11:26:10');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10923, '电子商务', '解读小红书的内容平台模式 分析小红书的内容运营策略 本书提供以下阅读帮助： 精准定位，知道自己要在小红书上做什么 发布笔记：制作原创图文视频，爆', 86, 'http://localhost:28089/upload/20220221_18385491.jpg', 'http://localhost:28089/upload/20220221_18385491.jpg', '<p>解读小红书的内容平台模式 分析小红书的内容运营策略 本书提供以下阅读帮助： 精准定位，知道自己要在小红书上做什么 发布笔记：制作原创图文视频，爆<br/></p>', 23.00, 23.00, 5, '陕西人民出版社', 0, 0, '2022-02-21 18:38:59', 0, '2022-02-22 11:39:41');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10924, '影响力', '这是继西奥迪尼《影响力》之后，世界**思想家培根用20年的时间精心书写,关于影响力研究的新的里程碑! 系统全面的实战宝典,权威,透彻,华盛顿大学*受欢迎的影响力课程精华,效果火爆,引爆热烈讨论.', 111, 'http://localhost:28089/upload/20220221_18403154.jpg', 'http://localhost:28089/upload/20220221_18403154.jpg', '<p>这是继西奥迪尼《影响力》之后，世界**思想家培根用20年的时间精心书写,关于影响力研究的新的里程碑! 系统全面的实战宝典,权威,透彻,华盛顿大学*受欢迎的影响力课程精华,效果火爆,引爆热烈讨论.<br/></p>', 30.30, 30.30, 35, '北京联合出版公司', 0, 0, '2022-02-21 18:40:35', 0, '2022-02-22 11:04:34');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10925, '水浒传', '经典小说之一', 76, 'http://localhost:28089/upload/20220222_00270842.jpg', 'http://localhost:28089/upload/20220222_00270842.jpg', '<p>四大名著，必读阅本</p>', 88.56, 78.99, 122, '人民邮电出版社', 0, 0, '2022-02-22 00:28:10', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_index_config`;
CREATE TABLE `tb_newbee_mall_index_config` (
  `config_id` bigint NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint NOT NULL DEFAULT '0' COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint NOT NULL DEFAULT '0' COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int NOT NULL DEFAULT '0' COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` int NOT NULL DEFAULT '0' COMMENT '创建者id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  `update_user` int DEFAULT '0' COMMENT '修改者id',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_index_config
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_index_config` VALUES (25, '新书上线 影响力', 4, 10924, '##', 0, 1, '2022-02-21 23:42:49', 0, '2022-05-12 11:38:33', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (26, '新品上线 解读小红书的内容平台模式', 4, 10923, '##', 0, 0, '2022-02-21 23:43:24', 0, '2022-02-21 23:43:24', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (27, '新品上线 华夏万卷字帖', 4, 10922, '##', 0, 0, '2022-02-21 23:44:01', 0, '2022-02-21 23:44:01', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (28, '苏轼十讲', 4, 10914, '##', 0, 0, '2022-02-21 23:44:23', 0, '2022-02-21 23:44:23', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (29, '时间从来不语', 4, 10913, '##', 0, 0, '2022-02-21 23:44:46', 0, '2022-02-21 23:44:46', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (30, '左右脑开发', 4, 10910, '##', 0, 0, '2022-02-21 23:45:05', 0, '2022-02-21 23:45:05', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (31, '婴儿读物', 5, 10909, '##', 0, 0, '2022-02-21 23:45:50', 0, '2022-02-21 23:45:50', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (32, '图画书', 5, 10908, '##', 0, 0, '2022-02-21 23:46:08', 0, '2022-02-21 23:46:08', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (33, '猜猜世界多有趣', 5, 10907, '##', 0, 0, '2022-02-21 23:46:41', 0, '2022-02-21 23:46:41', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (34, '现代史', 5, 10915, '##', 0, 0, '2022-02-21 23:48:05', 0, '2022-02-21 23:48:05', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (35, '亚洲史', 5, 10917, '##', 0, 0, '2022-02-21 23:49:02', 0, '2022-02-21 23:49:02', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (36, '欧洲史', 5, 10918, '##', 0, 0, '2022-02-21 23:49:47', 0, '2022-02-21 23:49:47', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (37, '5年高考3年模拟', 5, 10920, '##', 0, 0, '2022-02-21 23:51:22', 0, '2022-02-21 23:52:07', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (38, '素描', 5, 10921, '##', 0, 0, '2022-02-21 23:52:28', 0, '2022-02-21 23:52:28', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (39, '电子商务', 5, 10923, '##', 0, 0, '2022-02-21 23:52:49', 0, '2022-02-21 23:52:49', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (40, '苏轼十讲', 3, 10914, '##', 0, 0, '2022-02-22 00:06:03', 0, '2022-02-22 00:06:03', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (41, '当代文学', 3, 10912, '##', 0, 0, '2022-02-22 00:06:22', 0, '2022-02-22 00:06:22', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (42, '左右脑开发', 3, 10910, '##', 0, 0, '2022-02-22 00:06:50', 0, '2022-02-22 00:06:50', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (43, '电子商务', 3, 10923, '##', 0, 0, '2022-02-22 00:07:32', 0, '2022-02-22 00:07:32', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (44, '影响力', 3, 10924, '##', 0, 0, '2022-02-22 00:08:03', 0, '2022-02-22 00:08:03', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (45, '水浒传', 5, 10925, '##', 0, 0, '2022-02-22 00:28:57', 0, '2022-02-22 00:28:57', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (46, '水浒传', 4, 10925, '##', 5, 0, '2022-05-12 15:43:14', 0, '2022-05-12 15:43:43', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_menu`;
CREATE TABLE `tb_newbee_mall_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `parent_id` bigint NOT NULL COMMENT '父类菜单id',
  `menu_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求路径',
  `is_deleted` int DEFAULT NULL COMMENT '是否删除  0否1删除',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_menu
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_menu` VALUES (1, '订单管理', 0, NULL, 0, '2022-01-22 00:00:00');
INSERT INTO `tb_newbee_mall_menu` VALUES (2, '订单信息', 1, '/admin/orders', 0, '2022-01-17 00:03:21');
INSERT INTO `tb_newbee_mall_menu` VALUES (3, '商品管理', 0, NULL, 0, '2022-01-17 02:40:37');
INSERT INTO `tb_newbee_mall_menu` VALUES (4, '商品信息', 3, '/admin/goods', 0, '2022-01-17 02:41:38');
INSERT INTO `tb_newbee_mall_menu` VALUES (5, '商品分类', 3, '/admin/categories?parentId=0&categoryLevel=1&backParentId=0', 0, '2022-01-17 02:42:42');
INSERT INTO `tb_newbee_mall_menu` VALUES (7, '用户管理', 0, NULL, 0, '2022-01-17 03:13:07');
INSERT INTO `tb_newbee_mall_menu` VALUES (8, '用户信息', 7, '/admin/users', 0, '2022-01-17 03:13:07');
INSERT INTO `tb_newbee_mall_menu` VALUES (9, '留言管理', 0, NULL, 0, '2022-01-17 03:28:55');
INSERT INTO `tb_newbee_mall_menu` VALUES (10, '留言查看', 9, '/admin/message', 0, '2022-01-17 03:28:55');
INSERT INTO `tb_newbee_mall_menu` VALUES (11, '过滤关键字', 9, '/admin/message/key', 0, '2022-01-17 03:28:55');
INSERT INTO `tb_newbee_mall_menu` VALUES (12, '公告管理', 0, NULL, 0, '2022-01-17 03:31:20');
INSERT INTO `tb_newbee_mall_menu` VALUES (13, '公告信息', 12, '/admin/announcement', 0, '2022-01-17 03:31:20');
INSERT INTO `tb_newbee_mall_menu` VALUES (14, '权限管理', 0, NULL, 0, '2022-01-17 03:33:16');
INSERT INTO `tb_newbee_mall_menu` VALUES (15, '角色管理', 14, '/admin/role', 0, '2022-01-17 03:33:16');
INSERT INTO `tb_newbee_mall_menu` VALUES (16, '菜单管理', 14, '/admin/menu', 0, '2022-01-17 03:33:16');
INSERT INTO `tb_newbee_mall_menu` VALUES (17, '商品销售统计', 3, '/admin/statisticsView', 0, '2022-01-19 09:32:00');
INSERT INTO `tb_newbee_mall_menu` VALUES (18, '轮播图控制', 20, '/admin/carousels', 0, '2022-01-19 21:17:44');
INSERT INTO `tb_newbee_mall_menu` VALUES (19, '新品推荐', 20, '/admin/indexConfigs?configType=4', 0, '2022-01-19 21:18:29');
INSERT INTO `tb_newbee_mall_menu` VALUES (20, '首页配置', 0, NULL, 0, '2022-01-20 06:34:22');
INSERT INTO `tb_newbee_mall_menu` VALUES (21, '为你推荐', 20, '/admin/indexConfigs?configType=5', 0, '2022-01-20 06:49:46');
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_message`;
CREATE TABLE `tb_newbee_mall_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `parent_id` bigint DEFAULT NULL COMMENT '父编号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `form` bigint NOT NULL COMMENT '留言人',
  `from_to` bigint DEFAULT NULL COMMENT '被留言人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tb_newbee_mall_message_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='留言表';

-- ----------------------------
-- Records of tb_newbee_mall_message
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_message` VALUES (2, '您满意就好', 1, '2022-01-20 07:53:35', 1, NULL);
INSERT INTO `tb_newbee_mall_message` VALUES (3, '这个平台卖的书还可以，都是正版', NULL, '2022-02-22 11:27:00', 12, NULL);
INSERT INTO `tb_newbee_mall_message` VALUES (4, '谢谢光顾', 3, '2022-02-22 11:29:02', 1, NULL);
INSERT INTO `tb_newbee_mall_message` VALUES (5, '质量好，下次还来', NULL, '2022-02-22 11:30:26', 13, NULL);
INSERT INTO `tb_newbee_mall_message` VALUES (7, '价格使用', NULL, '2022-02-22 15:59:46', 15, NULL);
INSERT INTO `tb_newbee_mall_message` VALUES (8, '牛逼', NULL, '2022-05-12 11:40:24', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_message_key
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_message_key`;
CREATE TABLE `tb_newbee_mall_message_key` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除 0否1是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `tb_newbee_mall_message_key_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='留言屏蔽关键字';

-- ----------------------------
-- Records of tb_newbee_mall_message_key
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_message_key` VALUES (1, '我操', '2022-02-20 22:15:02', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order`;
CREATE TABLE `tb_newbee_mall_order` (
  `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint NOT NULL DEFAULT '0' COMMENT '用户主键id',
  `total_price` decimal(10,0) NOT NULL DEFAULT '1' COMMENT '订单总价',
  `pay_status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint NOT NULL DEFAULT '0' COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint NOT NULL DEFAULT '0' COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单body',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人收货地址',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_order
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_order` VALUES (22, '16454988181644762', 10, 46, 1, 1, '2022-02-22 11:00:26', 3, '', '', '', '湖南省长沙市长沙县新安路', 0, '2022-02-22 11:00:18', '2022-02-22 11:02:30');
INSERT INTO `tb_newbee_mall_order` VALUES (23, '16454990745804700', 11, 30, 1, 2, '2022-02-22 11:04:40', 4, '', '', '', '长沙市雨花区劳动东路1299号', 0, '2022-02-22 11:04:34', '2022-02-22 11:23:34');
INSERT INTO `tb_newbee_mall_order` VALUES (24, '16455003011917739', 12, 56, 1, 2, '2022-02-22 11:25:12', 1, '', '', '', '湖南省长沙市岳麓区潇湘中路355号', 0, '2022-02-22 11:25:01', '2022-02-22 11:25:12');
INSERT INTO `tb_newbee_mall_order` VALUES (25, '16455003704841850', 12, 136, 1, 1, '2022-02-22 11:26:16', 4, '', '', '', '湖南省长沙市岳麓区潇湘中路355号', 0, '2022-02-22 11:26:10', '2022-02-22 11:26:48');
INSERT INTO `tb_newbee_mall_order` VALUES (26, '16455004827791333', 12, 68, 1, 2, '2022-02-22 11:28:09', 4, '', '', '', '湖南省长沙市岳麓区潇湘中路355号', 0, '2022-02-22 11:28:02', '2022-02-22 11:28:35');
INSERT INTO `tb_newbee_mall_order` VALUES (27, '16455011819751048', 15, 23, 1, 2, '2022-02-22 11:39:50', 1, '', '', '', '湖南省长沙市岳麓区坪塘大道299号', 0, '2022-02-22 11:39:41', '2022-02-22 11:39:50');
INSERT INTO `tb_newbee_mall_order` VALUES (28, '16455165704091057', 15, 12, 1, 1, '2022-02-22 15:56:36', 4, '', '', '', '湖南省长沙市岳麓区坪塘大道299号', 0, '2022-02-22 15:56:10', '2022-02-22 15:58:18');
INSERT INTO `tb_newbee_mall_order` VALUES (29, '16488794084921682', 1, 47, 1, 2, '2022-04-02 14:04:21', 1, '', '', '', '湖南省长沙市长沙县ss', 0, '2022-04-02 14:03:28', '2022-04-02 14:04:21');
INSERT INTO `tb_newbee_mall_order` VALUES (30, '16517624607209126', 1, 12, 1, 2, '2022-05-05 22:54:31', 4, '', '', '', '湖南省长沙市长沙县ss', 0, '2022-05-05 22:54:20', '2022-05-05 22:55:59');
INSERT INTO `tb_newbee_mall_order` VALUES (31, '16523267870947743', 1, 34, 1, 1, '2022-05-12 11:39:56', 4, '', '', '', '湖南省长沙市长沙县ss', 0, '2022-05-12 11:39:47', '2022-05-12 11:44:58');
INSERT INTO `tb_newbee_mall_order` VALUES (32, '16523404508415618', 1, 98, 1, 1, '2022-05-12 15:27:42', 4, '', '', '', '湖南省长沙市长沙县ss', 0, '2022-05-12 15:27:30', '2022-05-12 15:28:26');
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_item`;
CREATE TABLE `tb_newbee_mall_order_item` (
  `order_item_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint NOT NULL DEFAULT '0' COMMENT '订单主键id',
  `goods_id` bigint NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int NOT NULL DEFAULT '1' COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int NOT NULL DEFAULT '1' COMMENT '数量(订单快照)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_order_item
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_order_item` VALUES (36, 22, 10912, '当代文学', 'http://localhost:28089/upload/20220221_18115458.jpg', 46, 1, '2022-02-22 11:00:18');
INSERT INTO `tb_newbee_mall_order_item` VALUES (37, 23, 10924, '影响力', 'http://localhost:28089/upload/20220221_18403154.jpg', 30, 1, '2022-02-22 11:04:34');
INSERT INTO `tb_newbee_mall_order_item` VALUES (38, 24, 10916, '中国通史', 'http://localhost:28089/upload/20220221_18275854.jpg', 56, 1, '2022-02-22 11:25:01');
INSERT INTO `tb_newbee_mall_order_item` VALUES (39, 25, 10922, '字帖', 'http://localhost:28089/upload/20220221_1837405.jpg', 34, 4, '2022-02-22 11:26:10');
INSERT INTO `tb_newbee_mall_order_item` VALUES (40, 26, 10919, '小学教材全解', 'http://localhost:28089/upload/20220221_18322436.jpg', 34, 2, '2022-02-22 11:28:02');
INSERT INTO `tb_newbee_mall_order_item` VALUES (41, 27, 10923, '电子商务', 'http://localhost:28089/upload/20220221_18385491.jpg', 23, 1, '2022-02-22 11:39:41');
INSERT INTO `tb_newbee_mall_order_item` VALUES (42, 28, 10914, '苏轼十讲', 'http://localhost:28089/upload/20220221_18234617.jpg', 12, 1, '2022-02-22 15:56:10');
INSERT INTO `tb_newbee_mall_order_item` VALUES (43, 29, 10908, '图画书', 'http://localhost:28089/upload/20220221_18050873.jpg', 47, 1, '2022-04-02 14:03:28');
INSERT INTO `tb_newbee_mall_order_item` VALUES (44, 30, 10914, '苏轼十讲', 'http://localhost:28089/upload/20220221_18234617.jpg', 12, 1, '2022-05-05 22:54:20');
INSERT INTO `tb_newbee_mall_order_item` VALUES (45, 31, 10918, '欧洲史', 'http://localhost:28089/upload/20220221_18304577.jpg', 34, 1, '2022-05-12 11:39:47');
INSERT INTO `tb_newbee_mall_order_item` VALUES (46, 32, 10920, '5年高考3年模拟', 'http://localhost:28089/upload/20220221_18350663.jpg', 98, 1, '2022-05-12 15:27:30');
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_role`;
CREATE TABLE `tb_newbee_mall_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除  0否 1是',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ta_newbee_mall_role_id_uindex` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of tb_newbee_mall_role
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_role` VALUES (1, '超级管理员', 0, '2022-01-17 00:05:19');
INSERT INTO `tb_newbee_mall_role` VALUES (2, '一般管理员', 0, '2022-02-22 11:31:54');
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_role_menu`;
CREATE TABLE `tb_newbee_mall_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id\n',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `menu_id` bigint NOT NULL COMMENT '菜单编号',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除 0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of tb_newbee_mall_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_role_menu` VALUES (1, 1, 1, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (2, 1, 2, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (3, 1, 3, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (4, 1, 4, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (5, 1, 5, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (7, 1, 7, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (8, 1, 8, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (9, 1, 9, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (10, 1, 10, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (11, 1, 11, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (12, 1, 12, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (13, 1, 13, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (14, 1, 14, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (15, 1, 15, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (16, 1, 16, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (17, 1, 17, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (18, 1, 18, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (19, 1, 19, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (20, 1, 20, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (21, 1, 21, 0);
INSERT INTO `tb_newbee_mall_role_menu` VALUES (22, 2, 17, 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_shopping_cart_item`;
CREATE TABLE `tb_newbee_mall_shopping_cart_item` (
  `cart_item_id` bigint NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint NOT NULL COMMENT '用户主键id',
  `goods_id` bigint NOT NULL DEFAULT '0' COMMENT '关联商品id',
  `goods_count` int NOT NULL DEFAULT '1' COMMENT '数量(最大为5)',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_shopping_cart_item
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (69, 1, 10147, 1, 1, '2022-01-14 07:01:34', '2022-01-14 07:01:34');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (70, 1, 10147, 1, 0, '2022-01-19 20:42:59', '2022-01-19 20:42:59');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (71, 10, 10912, 1, 1, '2022-02-22 10:58:51', '2022-02-22 10:58:51');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (72, 11, 10924, 1, 1, '2022-02-22 11:03:45', '2022-02-22 11:03:45');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (73, 12, 10916, 1, 1, '2022-02-22 11:24:20', '2022-02-22 11:24:20');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (74, 12, 10922, 4, 1, '2022-02-22 11:26:01', '2022-02-22 11:26:07');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (75, 12, 10919, 2, 1, '2022-02-22 11:27:48', '2022-02-22 11:27:57');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (76, 15, 10923, 1, 1, '2022-02-22 11:39:22', '2022-02-22 11:39:22');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (77, 15, 10914, 1, 1, '2022-02-22 15:55:07', '2022-02-22 15:55:07');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (78, 1, 10908, 1, 1, '2022-04-02 14:02:30', '2022-04-02 14:02:30');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (79, 1, 10914, 1, 1, '2022-05-05 22:54:10', '2022-05-05 22:54:10');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (80, 1, 10918, 1, 1, '2022-05-12 11:39:23', '2022-05-12 11:39:23');
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (81, 1, 10920, 1, 1, '2022-05-12 15:27:01', '2022-05-12 15:27:01');
COMMIT;

-- ----------------------------
-- Table structure for tb_newbee_mall_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user`;
CREATE TABLE `tb_newbee_mall_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint NOT NULL DEFAULT '0' COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_newbee_mall_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_newbee_mall_user` VALUES (1, '王晓光', '13700002703', 'admin', '做你所爱', '湖南省长沙市长沙县ss', 0, 0, '2021-12-22 08:44:57');
INSERT INTO `tb_newbee_mall_user` VALUES (9, '15700742635', '15700742635', '123456', '', '', 0, 0, '2022-01-18 00:38:56');
INSERT INTO `tb_newbee_mall_user` VALUES (10, '13489765678', '13489765678', '123456', '我就是我，不一样的我', '湖南省长沙市长沙县新安路', 0, 0, '2022-02-22 00:24:01');
INSERT INTO `tb_newbee_mall_user` VALUES (11, '17673654353', '17673654353', '123456', '', '长沙市雨花区劳动东路1299号', 0, 0, '2022-02-22 11:03:06');
INSERT INTO `tb_newbee_mall_user` VALUES (12, '17343606271', '17343606271', '123456', '', '湖南省长沙市岳麓区潇湘中路355号', 0, 0, '2022-02-22 11:23:52');
INSERT INTO `tb_newbee_mall_user` VALUES (13, '13400829963', '13400829963', '123456', '', '', 0, 1, '2022-02-22 11:29:55');
INSERT INTO `tb_newbee_mall_user` VALUES (14, '13400825093', '13400825093', '123123', '', '', 0, 0, '2022-02-22 11:31:40');
INSERT INTO `tb_newbee_mall_user` VALUES (15, '18674878975', '18674878975', '123456', '', '湖南省长沙市岳麓区坪塘大道299号', 0, 0, '2022-02-22 11:39:08');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

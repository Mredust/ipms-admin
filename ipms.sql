/*
 Navicat Premium Dump SQL

 Source Server         : 本地-MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : ipms

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 07/02/2026 16:18:44
*/
-- 正确写法1：先判断是否存在，再创建
CREATE DATABASE IF NOT EXISTS `ipms`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

use `ipms`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dictionary
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `dict_key`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '键值',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签',
    `dict_type`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '类型',
    `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `sort_order`  int                                                           NULL DEFAULT 0 COMMENT '排序',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dictionary
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `table_id`          bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `tpl_web_type`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
    `package_name`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `options`           varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `create_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '创建者',
    `create_time`       datetime                                                       NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '更新者',
    `update_time`       datetime                                                       NULL DEFAULT NULL COMMENT '更新时间',
    `remark`            varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table`
VALUES (3, 'login_page', '登录页表', NULL, NULL, 'LoginPage', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms', 'page',
        '登录页', 'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:54:43', '',
        '2026-02-05 11:10:52', NULL);
INSERT INTO `gen_table`
VALUES (4, 'meeting', '会议表', NULL, NULL, 'Meeting', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms', 'meeting',
        '会议', 'Mredust', '0', '/', '{\"parentMenuId\":0}', 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46',
        NULL);
INSERT INTO `gen_table`
VALUES (6, 'meeting_attendee', '参会人员表', NULL, NULL, 'MeetingAttendee', 'crud', '', 'com.ruoyi.system', 'system',
        'attendee', '参会人员', 'Mredust', '0', '/', NULL, 'admin', '2026-02-04 21:54:43', '', NULL, NULL);
INSERT INTO `gen_table`
VALUES (7, 'meeting_feature', '会议功能表', NULL, NULL, 'MeetingFeature', 'crud', 'element-ui', 'com.ruoyi.system',
        'ipms', 'feature', '会议功能', 'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:54:43', '',
        '2026-02-05 11:12:42', NULL);
INSERT INTO `gen_table`
VALUES (8, 'meeting_room', '会议室表', NULL, NULL, 'MeetingRoom', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms',
        'room', '会议室', 'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:54:43', '',
        '2026-02-05 11:11:02', NULL);
INSERT INTO `gen_table`
VALUES (9, 'meeting_type', '会议类型表', NULL, NULL, 'MeetingType', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms',
        'type', '会议类型', 'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:54:43', '',
        '2026-02-05 11:11:46', NULL);
INSERT INTO `gen_table`
VALUES (11, 'organization', '机构表', NULL, NULL, 'Organization', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms',
        'organization', '机构', 'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:54:43', '',
        '2026-02-05 11:04:22', NULL);
INSERT INTO `gen_table`
VALUES (12, 'user', '用户表', NULL, NULL, 'User', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms', 'user', '用户',
        'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52', NULL);
INSERT INTO `gen_table`
VALUES (13, 'vote', '投票表', NULL, NULL, 'Vote', 'crud', 'element-ui', 'com.ruoyi.system', 'ipms', 'vote', '投票',
        'Mredust', '0', '/', '{\"parentMenuId\":0}', 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17', NULL);
INSERT INTO `gen_table`
VALUES (14, 'sys_dept', '机构管理表', NULL, NULL, 'SysDept', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'dept',
        '机构管理', 'Mredust', '0', '/', '{}', 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14', NULL);
INSERT INTO `gen_table`
VALUES (15, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'user',
        '用户信息', 'Mredust', '0', '/', '{\"parentMenuId\":0}', 'admin', '2026-02-05 15:53:41', '',
        '2026-02-05 22:01:38', NULL);
INSERT INTO `gen_table`
VALUES (16, 'meeting_material', '会议资料表', NULL, NULL, 'MeetingMaterial', 'crud', 'element-ui', 'com.ruoyi.ipms',
        'ipms', 'material', '会议资料', 'Mredust', '0', '/', '{\"parentMenuId\":2050}', 'admin', '2026-02-06 16:53:22',
        '', '2026-02-06 16:54:48', NULL);
INSERT INTO `gen_table`
VALUES (17, 'image', '图片表', NULL, NULL, 'Image', 'crud', 'element-ui', 'com.ruoyi.ipms', 'ipms', 'image', '图片',
        'Mredust', '0', '/', '{\"parentMenuId\":1}', 'admin', '2026-02-06 22:33:14', '', '2026-02-06 22:33:55', NULL);
INSERT INTO `gen_table`
VALUES (18, 'meeting_slogan', '会议标语表', NULL, NULL, 'MeetingSlogan', 'crud', 'element-ui', 'com.ruoyi.ipms', 'ipms',
        'slogan', '会议标语', 'Mredust', '0', '/', '{}', 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41',
        NULL);
INSERT INTO `gen_table`
VALUES (19, 'meeting_user_rel', '会议-参会人员关联表', NULL, NULL, 'MeetingUserRel', 'crud', 'element-ui',
        'com.ruoyi.ipms', 'ipms', 'rel', '会议-参会人员关联', 'Mredust', '0', '/', '{}', 'admin', '2026-02-07 11:27:27',
        '', '2026-02-07 11:28:22', NULL);
INSERT INTO `gen_table`
VALUES (20, 'meeting_agenda', '会议议程表', NULL, NULL, 'MeetingAgenda', 'crud', 'element-ui', 'com.ruoyi.ipms', 'ipms',
        'agenda', '会议议程', 'Mredust', '0', '/', '{}', 'admin', '2026-02-07 11:27:49', '', '2026-02-07 11:28:59',
        NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `column_id`      bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                        NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query`       char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                           NULL DEFAULT NULL COMMENT '排序',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 195
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column`
VALUES (20, 3, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (21, 3, 'title', '标题', 'varchar(100)', 'String', 'title', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        2, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (22, 3, 'subtitle', '副标题', 'varchar(200)', 'String', 'subtitle', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 3, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (23, 3, 'footer', '页脚', 'varchar(500)', 'String', 'footer', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'textarea', '', 4, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (24, 3, 'background_image', '背景图', 'varchar(500)', 'String', 'backgroundImage', '0', '0', '0', '1', '1', '1',
        '0', 'EQ', 'imageUpload', '', 5, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (25, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 6, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (26, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 7, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:10:52');
INSERT INTO `gen_table_column`
VALUES (27, 4, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (28, 4, 'scope', '所属范围', 'varchar(50)', 'String', 'scope', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 2, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (29, 4, 'meeting_name', '会议名称', 'varchar(200)', 'String', 'meetingName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE', 'input', '', 3, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (30, 4, 'subtitle', '副标题', 'varchar(200)', 'String', 'subtitle', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 4, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (31, 4, 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'datetime', '', 5, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (32, 4, 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ',
        'datetime', '', 6, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (33, 4, 'room_id', '选择会议室', 'int', 'Long', 'roomId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '',
        7, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (34, 4, 'host_id', '会议主持人', 'int', 'Long', 'hostId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '',
        8, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (35, 4, 'assistant_id', '会议助理', 'int', 'Long', 'assistantId', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 9, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (36, 4, 'type_id', '会议类型', 'int', 'Long', 'typeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '',
        10, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (37, 4, 'feature_select', '功能选择', 'varchar(500)', 'String', 'featureSelect', '0', '0', '0', '1', '1', '1',
        '1', 'EQ', 'checkbox', '', 11, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (38, 4, 'logo', '会议logo', 'varchar(500)', 'String', 'logo', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'textarea', '', 12, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (39, 4, 'seat_chart', '座位图', 'varchar(500)', 'String', 'seatChart', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'textarea', '', 13, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (40, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 14, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (41, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 15, 'admin', '2026-02-04 21:54:43', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (51, 6, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (52, 6, 'name', '姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '',
        2, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (53, 6, 'position', '职位', 'varchar(50)', 'String', 'position', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 3, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (54, 6, 'sort_order', '人员排序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input',
        '', 4, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (55, 6, 'department', '部门', 'varchar(100)', 'String', 'department', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'input', '', 5, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (56, 6, 'unit', '单位', 'varchar(100)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        6, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (57, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 7, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (58, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 8, 'admin', '2026-02-04 21:54:43', '', NULL);
INSERT INTO `gen_table_column`
VALUES (59, 7, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (60, 7, 'feature_name', '功能名称', 'varchar(100)', 'String', 'featureName', '0', '0', '0', '1', '1', '1', '0',
        'LIKE', 'input', '', 2, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (61, 7, 'feature_alias', '功能别名', 'varchar(100)', 'String', 'featureAlias', '0', '0', '0', '1', '1', '1', '0',
        'EQ', 'input', '', 3, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (62, 7, 'sort_order', '排序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        4, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (63, 7, 'color', '颜色选择', 'varchar(20)', 'String', 'color', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 5, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (64, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 6, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (65, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 7, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:12:42');
INSERT INTO `gen_table_column`
VALUES (66, 8, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', '2026-02-05 11:11:02');
INSERT INTO `gen_table_column`
VALUES (67, 8, 'name', '会议室名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'input', '', 2, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:02');
INSERT INTO `gen_table_column`
VALUES (68, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 3, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:02');
INSERT INTO `gen_table_column`
VALUES (69, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 4, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:02');
INSERT INTO `gen_table_column`
VALUES (70, 9, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (71, 9, 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '0', '1', '1', '1', '0', 'LIKE', 'input', '',
        2, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (72, 9, 'description', '描述', 'varchar(500)', 'String', 'description', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'textarea', '', 3, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (73, 9, 'sort_order', '排序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        4, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (74, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ',
        'textarea', '', 5, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (75, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 6, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (76, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 7, 'admin', '2026-02-04 21:54:43', '', '2026-02-05 11:11:46');
INSERT INTO `gen_table_column`
VALUES (89, 11, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (90, 11, 'avatar', '头像', 'varchar(500)', 'String', 'avatar', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'imageUpload', '', 2, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (91, 11, 'parent_id', '上级机构', 'int', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 3, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (92, 11, 'org_name', '机构名称', 'varchar(100)', 'String', 'orgName', '0', '0', '1', '1', '1', '1', '0', 'LIKE',
        'input', '', 4, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (93, 11, 'org_code', '机构编码', 'varchar(50)', 'String', 'orgCode', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 5, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (94, 11, 'org_type', '机构类型', 'varchar(20)', 'String', 'orgType', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'select', 'org_type', 6, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (95, 11, 'leader', '负责人', 'varchar(50)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 7, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (96, 11, 'phone', '电话', 'varchar(20)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        8, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (97, 11, 'email', '邮箱', 'varchar(100)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 9, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (98, 11, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ',
        'textarea', '', 10, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (99, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'datetime', '', 11, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (100, 11, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 12, 'admin', '2026-02-04 21:54:44', '', '2026-02-05 11:04:22');
INSERT INTO `gen_table_column`
VALUES (101, 12, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (102, 12, 'org_id', '归属单位', 'int', 'Long', 'orgId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2,
        'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (103, 12, 'dept_id', '归属部门', 'int', 'Long', 'deptId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '',
        3, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (104, 12, 'employee_no', '工号', 'varchar(50)', 'String', 'employeeNo', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 4, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (105, 12, 'real_name', '姓名', 'varchar(50)', 'String', 'realName', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'input', '', 5, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (106, 12, 'username', '登录名', 'varchar(50)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'input', '', 6, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (107, 12, 'password', '密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '1', '0', 'EQ',
        'input', '', 7, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (108, 12, 'confirm_password', '确认密码', 'varchar(255)', 'String', 'confirmPassword', '0', '0', '1', '1', '1',
        '1', '0', 'EQ', 'input', '', 8, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (109, 12, 'position', '职务', 'varchar(50)', 'String', 'position', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 9, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (110, 12, 'unit', '单位', 'varchar(100)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        10, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (111, 12, 'email', '邮箱', 'varchar(100)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 11, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (112, 12, 'phone', '电话', 'varchar(20)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 12, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (113, 12, 'role', '用户角色', 'varchar(50)', 'String', 'role', '0', '0', '1', '1', '1', '1', '0', 'EQ',
        'checkbox', '', 13, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (114, 12, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ',
        'textarea', '', 14, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (115, 12, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 15, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (116, 12, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 16, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:08:52');
INSERT INTO `gen_table_column`
VALUES (117, 13, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (118, 13, 'vote_title', '投票主题', 'varchar(200)', 'String', 'voteTitle', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'input', '', 2, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (119, 13, 'agenda_id', '关联议程主题', 'int', 'Long', 'agendaId', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'select', '', 3, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (120, 13, 'vote_mode', '投票模式', 'varchar(20)', 'String', 'voteMode', '0', '0', '1', '1', '1', '1', '0', 'EQ',
        'select', 'vote_type', 4, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (121, 13, 'show_switch', '投票显示开关：0-关闭，1-开启', 'tinyint(1)', 'Integer', 'showSwitch', '0', '0', '1', '1',
        '1', '1', '0', 'EQ', 'select', 'show_switch', 5, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (122, 13, 'anonymous_switch', '投票匿名开关：0-关闭，1-开启', 'tinyint(1)', 'Integer', 'anonymousSwitch', '0', '0',
        '1', '1', '1', '1', '0', 'EQ', 'select', 'vote_anonymous', 6, 'admin', '2026-02-04 21:55:11', '',
        '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (123, 13, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ',
        'textarea', '', 7, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (124, 13, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 8, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (125, 13, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 9, 'admin', '2026-02-04 21:55:11', '', '2026-02-05 11:21:17');
INSERT INTO `gen_table_column`
VALUES (126, 14, 'dept_id', '机构id', 'bigint', 'Long', 'deptId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input',
        '', 1, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (127, 14, 'parent_id', '父机构id', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 2, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (128, 14, 'ancestors', '祖级列表', 'varchar(50)', 'String', 'ancestors', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 3, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (129, 14, 'dept_name', '机构名称', 'varchar(30)', 'String', 'deptName', '0', '0', '1', '1', '1', '1', '0',
        'LIKE', 'input', '', 4, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (130, 14, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 5, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (131, 14, 'leader', '负责人', 'varchar(20)', 'String', 'leader', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 6, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (132, 14, 'phone', '联系电话', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 7, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (133, 14, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 8, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (134, 14, 'status', '机构状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '0',
        'EQ', 'radio', '', 9, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (136, 14, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'input', '', 10, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (137, 14, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 11, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (138, 14, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'input', '', 12, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (139, 14, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 13, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (140, 14, 'org_code', '机构编码', 'varchar(50)', 'String', 'orgCode', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 14, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (141, 14, 'org_type', '机构类型', 'varchar(20)', 'String', 'orgType', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'select', 'org_type', 15, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (142, 14, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ',
        'textarea', '', 16, 'admin', '2026-02-05 12:13:27', '', '2026-02-05 12:17:14');
INSERT INTO `gen_table_column`
VALUES (143, 15, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input',
        '', 1, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (144, 15, 'dept_id', '所属部门ID', 'bigint', 'Long', 'deptId', '0', '0', '0', '1', '1', '0', '1', 'EQ', 'input',
        '', 2, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (145, 15, 'user_name', '登录名', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'input', '', 4, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (146, 15, 'nick_name', '姓名', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE',
        'checkbox', '', 3, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (147, 15, 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', '0', '1', '1', '0',
        '0', 'EQ', 'select', '', 20, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (148, 15, 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input',
        '', 7, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (149, 15, 'phonenumber', '电话', 'varchar(11)', 'String', 'phonenumber', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'input', '', 8, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (150, 15, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'select', '', 12, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (151, 15, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'imageUpload', '', 13, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (152, 15, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'input', '', 5, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (153, 15, 'status', '账号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '0', '0',
        'EQ', 'radio', '', 15, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (154, 15, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL,
        NULL, NULL, 'EQ', 'checkbox', '', 16, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (155, 15, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'input', '', 17, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (156, 15, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'datetime', '', 18, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (157, 15, 'pwd_update_date', '密码最后更新时间', 'datetime', 'Date', 'pwdUpdateDate', '0', '0', '0', '1', '1',
        '0', '0', 'EQ', 'datetime', '', 19, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (158, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ',
        'input', '', 21, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (159, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 22, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (160, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'input', '', 23, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (161, 15, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ',
        'datetime', '', 24, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (162, 15, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ',
        'textarea', '', 25, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (163, 15, 'position', '职务', 'varchar(255)', 'String', 'position', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 6, 'admin', '2026-02-05 15:53:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (164, 15, 'unit', '单位', 'varchar(255)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '',
        9, '', '2026-02-05 16:40:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (165, 15, 'employee_no', '工号', 'varchar(255)', 'String', 'employeeNo', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'input', '', 10, '', '2026-02-05 16:40:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (166, 15, 'org_id', '所属单位ID', 'bigint', 'Long', 'orgId', '0', '0', '1', '1', '1', '0', '1', 'EQ', 'input',
        '', 11, '', '2026-02-05 16:40:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (167, 15, 'sign', '签名', 'varchar(255)', 'String', 'sign', '0', '0', '0', '1', '1', '0', '0', 'EQ',
        'imageUpload', '', 14, '', '2026-02-05 16:40:41', '', '2026-02-05 22:01:38');
INSERT INTO `gen_table_column`
VALUES (168, 4, 'status', '会议状态', 'tinyint', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select',
        'mt_status', 16, '', '2026-02-06 15:26:07', '', '2026-02-06 15:26:46');
INSERT INTO `gen_table_column`
VALUES (169, 16, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (170, 16, 'file_name', '文件名称', 'varchar(255)', 'String', 'fileName', '0', '0', '1', '1', '1', '1', '1',
        'LIKE', 'input', '', 2, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (171, 16, 'file_type', '文件类型', 'varchar(50)', 'String', 'fileType', '0', '0', '0', '1', '1', '1', '0', 'EQ',
        'select', '', 3, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (172, 16, 'file_size', '文件大小(KB)', 'decimal(10,2)', 'BigDecimal', 'fileSize', '0', '0', '0', '1', '1', '1',
        '0', 'EQ', 'input', '', 4, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (173, 16, 'file_sort', '文件排序', 'int', 'Long', 'fileSort', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input',
        '', 5, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (174, 16, 'open_download', '打开/下载链接', 'varchar(500)', 'String', 'openDownload', '0', '0', '0', '1', '1',
        '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (175, 16, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 7, 'admin', '2026-02-06 16:53:22', '', '2026-02-06 16:54:48');
INSERT INTO `gen_table_column`
VALUES (176, 17, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-06 22:33:14', '', '2026-02-06 22:33:55');
INSERT INTO `gen_table_column`
VALUES (177, 17, 'url', '链接', 'varchar(500)', 'String', 'url', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'textarea',
        '', 2, 'admin', '2026-02-06 22:33:14', '', '2026-02-06 22:33:55');
INSERT INTO `gen_table_column`
VALUES (178, 17, 'type', '类型', 'varchar(50)', 'String', 'type', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '',
        3, 'admin', '2026-02-06 22:33:14', '', '2026-02-06 22:33:55');
INSERT INTO `gen_table_column`
VALUES (179, 17, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL,
        'EQ', 'datetime', '', 4, 'admin', '2026-02-06 22:33:14', '', '2026-02-06 22:33:55');
INSERT INTO `gen_table_column`
VALUES (180, 17, 'is_system', '是否系统：0-否，1-是', 'tinyint(1)', 'Integer', 'isSystem', '0', '0', '0', '1', '1', '1',
        '0', 'EQ', 'input', '', 5, 'admin', '2026-02-06 22:33:14', '', '2026-02-06 22:33:55');
INSERT INTO `gen_table_column`
VALUES (181, 18, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (182, 18, 'welcome_text', '欢迎语', 'varchar(500)', 'String', 'welcomeText', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'textarea', '', 2, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (183, 18, 'main_title_font', '主标题字体', 'varchar(100)', 'String', 'mainTitleFont', '0', '0', '0', '1', '1',
        '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (184, 18, 'main_title_color', '主标题颜色', 'varchar(7)', 'String', 'mainTitleColor', '0', '0', '0', '1', '1',
        '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (185, 18, 'main_title_size', '主标题大小', 'varchar(50)', 'String', 'mainTitleSize', '0', '0', '0', '1', '1',
        '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (186, 18, 'other_font', '其它字体', 'varchar(100)', 'String', 'otherFont', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'input', '', 6, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (187, 18, 'other_color', '其它颜色', 'varchar(7)', 'String', 'otherColor', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'input', '', 7, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (188, 18, 'other_size', '其它大小', 'varchar(50)', 'String', 'otherSize', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'input', '', 8, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (189, 18, 'background_url', '背景url', 'varchar(500)', 'String', 'backgroundUrl', '0', '0', '0', '1', '1', '1',
        '1', 'EQ', 'textarea', '', 9, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:41');
INSERT INTO `gen_table_column`
VALUES (190, 19, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-07 11:27:27', '', '2026-02-07 11:28:22');
INSERT INTO `gen_table_column`
VALUES (191, 19, 'meeting_id', '会议ID', 'int', 'Long', 'meetingId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input',
        '', 2, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:22');
INSERT INTO `gen_table_column`
VALUES (192, 19, 'user_ids', '用户id列表（JSON数组格式）', 'text', 'String', 'userIds', '0', '0', '0', '1', '1', '1', '1',
        'EQ', 'textarea', '', 3, 'admin', '2026-02-07 11:27:27', '', '2026-02-07 11:28:22');
INSERT INTO `gen_table_column`
VALUES (193, 20, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin',
        '2026-02-07 11:27:49', '', '2026-02-07 11:28:59');
INSERT INTO `gen_table_column`
VALUES (194, 20, 'text_json', '议程JSON数据', 'text', 'String', 'textJson', '0', '0', '0', '1', '1', '1', '1', 'EQ',
        'textarea', '', 2, 'admin', '2026-02-07 11:27:49', '', '2026-02-07 11:28:59');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `url`         varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '链接',
    `type`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '类型',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `is_system`   tinyint(1)                                                    NULL DEFAULT 0 COMMENT '是否系统：0-否，1-是',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '图片表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image`
VALUES (1, '/profile/upload/2026/02/06/1_20260206233655A002.jpg', 'pad', '2026-02-06 23:36:59', 1);
INSERT INTO `image`
VALUES (2, '/profile/upload/2026/02/06/2_20260206233803A003.jpg', 'pad', '2026-02-06 23:38:06', 1);
INSERT INTO `image`
VALUES (3, '/profile/upload/2026/02/06/3_20260206233813A004.jpg', 'pad', '2026-02-06 23:38:18', 1);
INSERT INTO `image`
VALUES (4, '/profile/upload/2026/02/06/4_20260206233822A005.jpg', 'pad', '2026-02-06 23:38:24', 1);
INSERT INTO `image`
VALUES (5, '/profile/upload/2026/02/06/5_20260206233828A006.jpg', 'pad', '2026-02-06 23:38:30', 1);
INSERT INTO `image`
VALUES (6, '/profile/upload/2026/02/06/6_20260206233836A007.jpg', 'pad', '2026-02-06 23:38:39', 1);
INSERT INTO `image`
VALUES (7, '/profile/upload/2026/02/06/7_20260206233843A008.jpg', 'pad', '2026-02-06 23:38:45', 1);
INSERT INTO `image`
VALUES (8, '/profile/upload/2026/02/06/8_20260206233852A009.jpg', 'pad', '2026-02-06 23:38:54', 1);
INSERT INTO `image`
VALUES (9, '/profile/upload/2026/02/06/9_20260206233857A010.jpg', 'pad', '2026-02-06 23:39:00', 1);
INSERT INTO `image`
VALUES (10, '/profile/upload/2026/02/06/10_20260206233906A011.jpg', 'pad', '2026-02-06 23:39:08', 1);
INSERT INTO `image`
VALUES (11, '/profile/upload/2026/02/06/1_20260206234008A012.jpg', 'web', '2026-02-06 23:40:11', 1);
INSERT INTO `image`
VALUES (12, '/profile/upload/2026/02/06/2_20260206234019A013.jpg', 'web', '2026-02-06 23:40:22', 1);
INSERT INTO `image`
VALUES (13, '/profile/upload/2026/02/06/3_20260206234026A014.png', 'web', '2026-02-06 23:40:28', 1);
INSERT INTO `image`
VALUES (14, '/profile/upload/2026/02/06/4_20260206234032A015.png', 'web', '2026-02-06 23:40:36', 1);
INSERT INTO `image`
VALUES (15, '/profile/upload/2026/02/06/6_20260206234040A016.jpg', 'web', '2026-02-06 23:40:42', 1);
INSERT INTO `image`
VALUES (16, '/profile/upload/2026/02/06/7_20260206234048A017.jpg', 'web', '2026-02-06 23:40:50', 1);
INSERT INTO `image`
VALUES (17, '/profile/upload/2026/02/06/8_20260206234056A018.jpg', 'web', '2026-02-06 23:40:58', 1);
INSERT INTO `image`
VALUES (18, '/profile/upload/2026/02/06/9_20260206234103A019.png', 'web', '2026-02-06 23:41:05', 1);
INSERT INTO `image`
VALUES (19, '/profile/upload/2026/02/06/background_01_20260206234109A020.jpg', 'web', '2026-02-06 23:41:11', 1);
INSERT INTO `image`
VALUES (20, '/profile/upload/2026/02/06/background_02_20260206234115A021.jpg', 'web', '2026-02-06 23:41:17', 1);
INSERT INTO `image`
VALUES (21, '/profile/upload/2026/02/06/background_03_20260206234122A022.jpg', 'web', '2026-02-06 23:41:24', 1);
INSERT INTO `image`
VALUES (22, '/profile/upload/2026/02/06/background_04_20260206234129A023.jpg', 'web', '2026-02-06 23:41:31', 1);
INSERT INTO `image`
VALUES (23, '/profile/upload/2026/02/06/background_05_20260206234136A024.jpg', 'web', '2026-02-06 23:41:38', 1);
INSERT INTO `image`
VALUES (24, '/profile/upload/2026/02/06/it-bg2_20260206234304A025.png', 'other', '2026-02-06 23:43:07', 0);

-- ----------------------------
-- Table structure for login_page
-- ----------------------------
DROP TABLE IF EXISTS `login_page`;
CREATE TABLE `login_page`
(
    `id`               int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `title`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
    `subtitle`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '副标题',
    `footer`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页脚',
    `background_image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '背景图',
    `create_time`      datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录页表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of login_page
-- ----------------------------
INSERT INTO `login_page`
VALUES (1, '无纸化会议系统', 'v1.0.0', 'Copyright © 2025-2030 Mredust. All Rights Reserved.',
        '/profile/upload/2026/02/05/background_20260205232636A001.jpg', '2026-02-05 15:29:34', '2026-02-06 00:13:37');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`
(
    `id`             int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `scope`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '所属范围',
    `meeting_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会议名称',
    `subtitle`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '副标题',
    `start_time`     datetime                                                      NOT NULL COMMENT '开始时间',
    `end_time`       datetime                                                      NOT NULL COMMENT '结束时间',
    `room_id`        int                                                           NOT NULL COMMENT '选择会议室',
    `host_id`        int                                                           NOT NULL COMMENT '会议主持人',
    `assistant_id`   int                                                           NULL     DEFAULT NULL COMMENT '会议助理',
    `type_id`        int                                                           NOT NULL COMMENT '会议类型',
    `feature_select` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '功能选择',
    `logo`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '会议logo',
    `seat_chart`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '座位图',
    `create_time`    datetime                                                      NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    datetime                                                      NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `status`         tinyint                                                       NOT NULL DEFAULT 0 COMMENT '会议状态',
    `pad_bg_url`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT 'PAD背景图',
    `web_bg_url`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT 'WEB背景图',
    `slogan_id`      int                                                           NULL     DEFAULT NULL COMMENT '会议标语id',
    `agenda_id`      int                                                           NULL     DEFAULT NULL COMMENT '会议议程id',
    `vote_ids`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '会议投票ids',
    `summary_file`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL     DEFAULT NULL COMMENT '纪要文件',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting`
VALUES (1, '100', '省人大第八次会议', '副标题测试', '2026-02-06 14:25:15', '2026-02-14 10:00:00', 1, 102, 108, 4,
        '1,2,3,4,5,7,9,10,11,8', '/profile/upload/2026/02/06/ui_20260206140534A001.png',
        '/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg', '2026-02-06 14:05:02',
        '2026-02-06 22:28:52', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `meeting`
VALUES (2, '100', '全省人民法庭工作会议', NULL, '2026-02-06 14:24:59', '2026-02-05 14:25:04', 2, 108, 108, 2,
        '1,2,3,4,5,6,7,8,9,10,11,12', NULL, NULL, '2026-02-06 14:13:26', '2026-02-06 15:32:40', 1, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `meeting`
VALUES (3, '100', '2025全国石油行业经济形势分析会', NULL, '2026-02-01 10:00:00', '2026-02-06 12:00:00', 1, 108, NULL, 5,
        '1,2,3,4,5,6,7,8,9,10,11,12', NULL, NULL, '2026-02-06 15:11:54', '2026-02-06 15:32:42', 2, NULL, NULL, NULL,
        NULL, NULL, NULL);
INSERT INTO `meeting`
VALUES (4, '100', '公安厅2025年下半年工作总结', NULL, '2026-02-06 15:12:13', '2026-02-07 15:12:15', 5, 108, NULL, 3,
        '1,2,3,4,5,6,7,8,9,10,11', NULL, NULL, '2026-02-06 15:12:34', '2026-02-06 15:12:33', 0, NULL, NULL, NULL, NULL,
        NULL, NULL);
INSERT INTO `meeting`
VALUES (5, '100', '全市法院重点工作推进会', NULL, '2026-02-06 15:12:48', '2026-02-07 00:00:00', 3, 108, NULL, 1,
        '1,2,3,4,5,6,7,8,9,10,11', NULL, NULL, '2026-02-06 15:13:01', '2026-02-06 15:13:01', 0, NULL, NULL, NULL, NULL,
        NULL, NULL);
INSERT INTO `meeting`
VALUES (6, '100', '测试会议2', '测试会议副标题2', '2026-02-06 22:29:13', '2026-02-21 00:00:00', 2, 1, 1, 4,
        '1,2,3,4,6,7,8,9,10,11,5', NULL, '/profile/upload/2026/02/07/book_20260207101251A026.png',
        '2026-02-06 22:29:28', '2026-02-07 12:22:49', 0, '/profile/upload/2026/02/06/7_20260206233843A008.jpg',
        '/profile/upload/2026/02/06/6_20260206234040A016.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `meeting`
VALUES (8, '100', '测试', NULL, '2026-02-07 14:37:46', '2026-02-08 00:00:00', 1, 1, NULL, 1, '', NULL, NULL,
        '2026-02-07 14:37:57', '2026-02-07 14:37:57', 0, NULL, NULL, 2, 1, '8,9', NULL);

-- ----------------------------
-- Table structure for meeting_agenda
-- ----------------------------
DROP TABLE IF EXISTS `meeting_agenda`;
CREATE TABLE `meeting_agenda`
(
    `id`        int                                                   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `text_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '议程JSON数据',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议议程表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_agenda
-- ----------------------------
INSERT INTO `meeting_agenda`
VALUES (1,
        '[{\"topicNo\":1,\"topicName\":\"测试议题名称\",\"mainFile\":\"/profile/upload/2026/02/07/测试文档_20260207143834A001.docx\",\"mainFileName\":\"测试文档.docx\",\"attachmentIds\":[],\"memberIds\":[],\"ext_col\":[]},{\"topicNo\":2,\"topicName\":\"\",\"mainFile\":\"\",\"mainFileName\":\"\",\"attachmentIds\":[],\"memberIds\":[],\"ext_col\":[]}]');

-- ----------------------------
-- Table structure for meeting_attendee
-- ----------------------------
DROP TABLE IF EXISTS `meeting_attendee`;
CREATE TABLE `meeting_attendee`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '姓名',
    `position`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '职位',
    `sort_order`  int                                                           NULL DEFAULT 0 COMMENT '人员排序',
    `department`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门',
    `unit`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '参会人员表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting_attendee
-- ----------------------------

-- ----------------------------
-- Table structure for meeting_feature
-- ----------------------------
DROP TABLE IF EXISTS `meeting_feature`;
CREATE TABLE `meeting_feature`
(
    `id`            int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `feature_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '功能名称',
    `feature_alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '功能别名',
    `sort_order`    int                                                           NULL DEFAULT 0 COMMENT '排序',
    `color`         varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '颜色选择',
    `create_time`   datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议功能表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting_feature
-- ----------------------------
INSERT INTO `meeting_feature`
VALUES (1, '终端同屏', 'tongping', 1, '#FFFFFF', '2026-02-05 14:33:08', '2026-02-06 00:27:00');
INSERT INTO `meeting_feature`
VALUES (2, '切换界面', 'qiehuan', 2, '#FFFFFF', '2026-02-05 14:34:04', '2026-02-06 00:27:07');
INSERT INTO `meeting_feature`
VALUES (3, '会议评价', 'huiyipingjia', 3, '#FFFFFF', '2026-02-05 14:34:16', '2026-02-06 11:15:15');
INSERT INTO `meeting_feature`
VALUES (4, '投票表决', 'toupiaobiaojue', 4, '#FFFFFF', '2026-02-05 14:34:28', '2026-02-06 11:15:13');
INSERT INTO `meeting_feature`
VALUES (5, '会议服务', 'huiyifuwu', 5, '#FFFFFF', '2026-02-05 14:34:37', '2026-02-06 11:15:20');
INSERT INTO `meeting_feature`
VALUES (6, '通知消息', 'tongzhixiaoxi', 6, '#FFFFFF', '2026-02-05 14:34:46', '2026-02-06 11:15:18');
INSERT INTO `meeting_feature`
VALUES (7, '会议记录', 'huiyijilu', 7, '#FFFFFF', '2026-02-05 14:34:56', '2026-02-06 11:15:33');
INSERT INTO `meeting_feature`
VALUES (8, '会议空间', 'huiyikongjian', 8, '#FFFFFF', '2026-02-05 14:35:06', '2026-02-06 11:15:31');
INSERT INTO `meeting_feature`
VALUES (9, '外部信号', 'waibuxinhao', 9, '#FFFFFF', '2026-02-05 14:35:16', '2026-02-06 11:15:29');
INSERT INTO `meeting_feature`
VALUES (10, '签批', 'qianpi', 10, '#FFFFFF', '2026-02-05 14:35:29', '2026-02-06 11:15:27');
INSERT INTO `meeting_feature`
VALUES (11, '大屏投影', 'touying', 11, '#FFFFFF', '2026-02-05 14:35:38', '2026-02-06 11:15:24');
INSERT INTO `meeting_feature`
VALUES (12, '腾讯会议', 'tencentmt', 20, '#FFFFFF', '2026-02-05 14:35:48', '2026-02-06 11:15:22');

-- ----------------------------
-- Table structure for meeting_material
-- ----------------------------
DROP TABLE IF EXISTS `meeting_material`;
CREATE TABLE `meeting_material`
(
    `id`            int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `file_name`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件名称',
    `file_type`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '文件类型',
    `file_size`     decimal(10, 2)                                                NULL DEFAULT NULL COMMENT '文件大小(KB)',
    `file_sort`     int                                                           NULL DEFAULT 0 COMMENT '文件排序',
    `open_download` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打开/下载链接',
    `create_time`   datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议资料表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_material
-- ----------------------------
INSERT INTO `meeting_material`
VALUES (1, '新建 DOCX 文档.docx', 'docx', 0.00, 0,
        'http://localhost:4040/profile/upload/2026/02/06/新建 DOCX 文档_20260206172407A001.docx',
        '2026-02-06 17:24:08');

-- ----------------------------
-- Table structure for meeting_room
-- ----------------------------
DROP TABLE IF EXISTS `meeting_room`;
CREATE TABLE `meeting_room`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议室表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting_room
-- ----------------------------
INSERT INTO `meeting_room`
VALUES (1, '党委会议室', '2026-02-05 14:05:16', '2026-02-05 14:05:15');
INSERT INTO `meeting_room`
VALUES (2, '行政会议室', '2026-02-05 14:06:29', '2026-02-05 14:06:28');
INSERT INTO `meeting_room`
VALUES (3, '无纸化会议室', '2026-02-05 14:06:33', '2026-02-05 14:06:32');
INSERT INTO `meeting_room`
VALUES (4, '常委会议室', '2026-02-05 14:06:38', '2026-02-05 14:06:37');
INSERT INTO `meeting_room`
VALUES (5, '大会议室', '2026-02-05 14:06:41', '2026-02-05 14:06:41');

-- ----------------------------
-- Table structure for meeting_slogan
-- ----------------------------
DROP TABLE IF EXISTS `meeting_slogan`;
CREATE TABLE `meeting_slogan`
(
    `id`               int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `welcome_text`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '欢迎您莅临此次会议' COMMENT '欢迎语',
    `main_title_font`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '方正小标宋简体' COMMENT '主标题字体',
    `main_title_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '#FFFFFF' COMMENT '主标题颜色',
    `main_title_size`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '8em' COMMENT '主标题大小',
    `other_font`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '方正小标宋简体' COMMENT '其它字体',
    `other_color`      varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT '#FFFFFF' COMMENT '其它颜色',
    `other_size`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '2em' COMMENT '其它大小',
    `background_url`   varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '背景url',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议标语表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_slogan
-- ----------------------------
INSERT INTO `meeting_slogan`
VALUES (1, '欢迎您莅临此次会议', '方正小标宋简体', '#ffffff', '8em', '方正小标宋简体', '#ffffff', '2em', NULL);
INSERT INTO `meeting_slogan`
VALUES (2, '欢迎您莅临此次会议', '方正小标宋简体', '#ffffff', '8em', '方正小标宋简体', '#ffffff', '2em', NULL);

-- ----------------------------
-- Table structure for meeting_type
-- ----------------------------
DROP TABLE IF EXISTS `meeting_type`;
CREATE TABLE `meeting_type`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `name`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    `sort_order`  int                                                           NULL DEFAULT 0 COMMENT '排序',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meeting_type
-- ----------------------------
INSERT INTO `meeting_type`
VALUES (1, '党委会', '党委会议', 0, NULL, '2026-02-05 14:19:48', '2026-02-05 14:19:48');
INSERT INTO `meeting_type`
VALUES (2, '主任会议', '主任', 0, NULL, '2026-02-05 14:20:10', '2026-02-05 14:20:09');
INSERT INTO `meeting_type`
VALUES (3, '办公室会议', '办公室', 0, NULL, '2026-02-05 14:20:20', '2026-02-05 14:20:20');
INSERT INTO `meeting_type`
VALUES (4, '调解室会议', '调解', 0, NULL, '2026-02-05 14:20:28', '2026-02-05 14:20:28');
INSERT INTO `meeting_type`
VALUES (5, '业务开发', '业务部', 0, NULL, '2026-02-05 14:20:37', '2026-02-05 14:20:36');
INSERT INTO `meeting_type`
VALUES (6, '行政办公会', '行政办公会', 0, NULL, '2026-02-05 14:20:46', '2026-02-05 14:20:45');

-- ----------------------------
-- Table structure for meeting_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `meeting_user_rel`;
CREATE TABLE `meeting_user_rel`
(
    `id`         int                                                   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `meeting_id` int                                                   NOT NULL COMMENT '会议ID',
    `user_ids`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户id列表（JSON数组格式）',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '会议-参会人员关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting_user_rel
-- ----------------------------
INSERT INTO `meeting_user_rel`
VALUES (1, 7, '[103,104,105,106,107,108]');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
    `id`          int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `pid`         int                                                           NULL DEFAULT 0 COMMENT '父菜单ID',
    `name`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '名称',
    `link`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
    `target`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT '_self' COMMENT '目标',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
    `sort`        int                                                           NULL DEFAULT 0 COMMENT '排序',
    `visible`     tinyint(1)                                                    NULL DEFAULT 1 COMMENT '可见：0-隐藏，1-显示',
    `permission`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `config_id`    int                                                           NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
    `create_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`  datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`  datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 100
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '参数配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-06-24 22:47:50', '',
        NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config`
VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-06-24 22:47:50', '', NULL,
        '初始化密码 123456');
INSERT INTO `sys_config`
VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-06-24 22:47:50', '', NULL,
        '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config`
VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2025-06-24 22:47:50', 'admin',
        '2025-09-07 17:11:18', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-06-24 22:47:50',
        '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config`
VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-06-24 22:47:50', '', NULL,
        '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config`
VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-06-24 22:47:50', '',
        NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config`
VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-06-24 22:47:50',
        '', NULL,
        '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`
(
    `dept_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '机构id',
    `parent_id`   bigint                                                        NULL DEFAULT 0 COMMENT '父机构id',
    `ancestors`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '祖级列表',
    `dept_name`   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '机构名称',
    `order_num`   int                                                           NULL DEFAULT 0 COMMENT '显示顺序',
    `leader`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '机构状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `org_code`    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '机构编码',
    `org_type`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '机构类型',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 216
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '机构管理表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept`
VALUES (100, 0, '0', '无纸化会议系统', 0, '', '', '', '0', 'admin', '2025-06-24 22:47:50', 'admin',
        '2026-02-05 13:56:52', '', '3', NULL);
INSERT INTO `sys_dept`
VALUES (212, 0, '', '科技有限公司', 0, NULL, NULL, NULL, '0', 'admin', '2026-02-05 21:43:15', '', NULL, NULL, '0',
        NULL);
INSERT INTO `sys_dept`
VALUES (213, 0, '', '网络有限公司', 0, NULL, NULL, NULL, '0', 'admin', '2026-02-05 21:43:25', '', NULL, NULL, '0',
        NULL);
INSERT INTO `sys_dept`
VALUES (214, 212, '', '开发部门', 0, NULL, NULL, NULL, '0', 'admin', '2026-02-05 21:43:39', '', NULL, NULL, '1', NULL);
INSERT INTO `sys_dept`
VALUES (215, 213, '', '运维部门', 0, NULL, NULL, NULL, '0', 'admin', '2026-02-05 21:43:48', '', NULL, NULL, '1', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `dict_code`   bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                           NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 116
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典数据表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '默认分组');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '系统分组');
INSERT INTO `sys_dict_data`
VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '系统默认是');
INSERT INTO `sys_dict_data`
VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data`
VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '通知');
INSERT INTO `sys_dict_data`
VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '公告');
INSERT INTO `sys_dict_data`
VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '关闭状态');
INSERT INTO `sys_dict_data`
VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '其他操作');
INSERT INTO `sys_dict_data`
VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '新增操作');
INSERT INTO `sys_dict_data`
VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '修改操作');
INSERT INTO `sys_dict_data`
VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '删除操作');
INSERT INTO `sys_dict_data`
VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '授权操作');
INSERT INTO `sys_dict_data`
VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '导出操作');
INSERT INTO `sys_dict_data`
VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '导入操作');
INSERT INTO `sys_dict_data`
VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '强退操作');
INSERT INTO `sys_dict_data`
VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-06-24 22:47:50', '', NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (100, 0, '单位', '0', 'org_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:01:26', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (101, 1, '部门', '1', 'org_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:02:09', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (102, 2, '小组', '2', 'org_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:02:42', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (103, 3, '其他', '3', 'org_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:02:49', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (104, 0, '模式一', '0', 'vote_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:16:57', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (105, 1, '模式二', '1', 'vote_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:17:06', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (106, 2, '自定义投票选项', '2', 'vote_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:17:18', '', NULL,
        NULL);
INSERT INTO `sys_dict_data`
VALUES (107, 0, '否', '0', 'vote_anonymous', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:20:24', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (108, 1, '是', '1', 'vote_anonymous', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:20:29', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (109, 0, '否', '0', 'show_switch', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:20:39', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (110, 1, '是', '1', 'show_switch', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:20:45', '', NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (111, 0, '全称参会', '0', 'join_meeting_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:24:03', '',
        NULL, '全程参会：可以查看所有议程及会议资料');
INSERT INTO `sys_dict_data`
VALUES (112, 1, '临时参会', '1', 'join_meeting_type', NULL, 'default', 'N', '0', 'admin', '2026-02-05 11:24:16', '',
        NULL, '临时参会：只能查看当前进行时的议题及资料');
INSERT INTO `sys_dict_data`
VALUES (113, 2, '已结束', '2', 'mt_status', NULL, 'danger', 'N', '0', 'admin', '2026-02-06 15:22:07', 'admin',
        '2026-02-06 15:23:17', NULL);
INSERT INTO `sys_dict_data`
VALUES (114, 1, '进行中', '1', 'mt_status', NULL, 'success', 'N', '0', 'admin', '2026-02-06 15:22:22', 'admin',
        '2026-02-06 15:22:47', NULL);
INSERT INTO `sys_dict_data`
VALUES (115, 0, '未发布', '0', 'mt_status', NULL, 'primary', 'N', '0', 'admin', '2026-02-06 15:22:36', 'admin',
        '2026-02-06 15:23:12', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `dict_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`dict_id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_type` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 106
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '字典类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type`
VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type`
VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type`
VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type`
VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type`
VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type`
VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type`
VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type`
VALUES (100, '机构类型', 'org_type', '0', 'admin', '2026-02-05 11:00:31', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (101, '投票类型', 'vote_type', '0', 'admin', '2026-02-05 11:16:29', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (102, '是否匿名投票', 'vote_anonymous', '0', 'admin', '2026-02-05 11:19:41', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (103, '是否显示开关', 'show_switch', '0', 'admin', '2026-02-05 11:20:11', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (104, '参会类型', 'join_meeting_type', '0', 'admin', '2026-02-05 11:23:44', '', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (105, '会议状态', 'mt_status', '0', 'admin', '2026-02-06 15:21:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`
(
    `info_id`        bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '访问ID',
    `user_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '用户账号',
    `ipaddr`         varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '登录IP地址',
    `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '登录地点',
    `browser`        varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '浏览器类型',
    `os`             varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '操作系统',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci       NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
    `msg`            varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
    `login_time`     datetime                                                       NULL DEFAULT NULL COMMENT '访问时间',
    PRIMARY KEY (`info_id`) USING BTREE,
    INDEX `idx_sys_logininfor_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_logininfor_lt` (`login_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 188
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor`
VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-07 16:48:03');
INSERT INTO `sys_logininfor`
VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-07 16:48:06');
INSERT INTO `sys_logininfor`
VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-07 16:48:11');
INSERT INTO `sys_logininfor`
VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误',
        '2025-07-18 10:01:53');
INSERT INTO `sys_logininfor`
VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误',
        '2025-07-18 10:02:00');
INSERT INTO `sys_logininfor`
VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 10:02:05');
INSERT INTO `sys_logininfor`
VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-18 12:32:22');
INSERT INTO `sys_logininfor`
VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 12:32:30');
INSERT INTO `sys_logininfor`
VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 13:56:04');
INSERT INTO `sys_logininfor`
VALUES (109, 'admi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-07-18 15:55:32');
INSERT INTO `sys_logininfor`
VALUES (110, 'admi', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '用户不存在/密码错误',
        '2025-07-18 15:55:38');
INSERT INTO `sys_logininfor`
VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 15:56:05');
INSERT INTO `sys_logininfor`
VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-07-18 15:56:13');
INSERT INTO `sys_logininfor`
VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 15:56:17');
INSERT INTO `sys_logininfor`
VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-07-18 17:32:59');
INSERT INTO `sys_logininfor`
VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-07-18 17:33:02');
INSERT INTO `sys_logininfor`
VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-07 17:10:53');
INSERT INTO `sys_logininfor`
VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-09-07 17:34:43');
INSERT INTO `sys_logininfor`
VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-04 21:53:23');
INSERT INTO `sys_logininfor`
VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-04 23:08:16');
INSERT INTO `sys_logininfor`
VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-04 23:57:31');
INSERT INTO `sys_logininfor`
VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 10:44:30');
INSERT INTO `sys_logininfor`
VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 15:03:43');
INSERT INTO `sys_logininfor`
VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:08:59');
INSERT INTO `sys_logininfor`
VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:09:04');
INSERT INTO `sys_logininfor`
VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:10:54');
INSERT INTO `sys_logininfor`
VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:11:44');
INSERT INTO `sys_logininfor`
VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:14:27');
INSERT INTO `sys_logininfor`
VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'orderNum\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'orderNum\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:16:09');
INSERT INTO `sys_logininfor`
VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1',
        'nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'status\' of \'class com.ruoyi.common.core.domain.entity.SysDept\' with value \'0\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'status\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 15:18:09');
INSERT INTO `sys_logininfor`
VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 15:19:23');
INSERT INTO `sys_logininfor`
VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 15:20:48');
INSERT INTO `sys_logininfor`
VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 15:20:50');
INSERT INTO `sys_logininfor`
VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 15:21:12');
INSERT INTO `sys_logininfor`
VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 15:21:14');
INSERT INTO `sys_logininfor`
VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 15:21:41');
INSERT INTO `sys_logininfor`
VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 15:21:42');
INSERT INTO `sys_logininfor`
VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 15:22:21');
INSERT INTO `sys_logininfor`
VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 15:22:22');
INSERT INTO `sys_logininfor`
VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 17:50:56');
INSERT INTO `sys_logininfor`
VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 19:10:33');
INSERT INTO `sys_logininfor`
VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 21:07:05');
INSERT INTO `sys_logininfor`
VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 21:40:04');
INSERT INTO `sys_logininfor`
VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 22:48:20');
INSERT INTO `sys_logininfor`
VALUES (144, '222', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 22:48:28');
INSERT INTO `sys_logininfor`
VALUES (145, '222', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 22:48:36');
INSERT INTO `sys_logininfor`
VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-05 22:48:42');
INSERT INTO `sys_logininfor`
VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 22:48:45');
INSERT INTO `sys_logininfor`
VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:02:56');
INSERT INTO `sys_logininfor`
VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:03:31');
INSERT INTO `sys_logininfor`
VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:06:16');
INSERT INTO `sys_logininfor`
VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:09:32');
INSERT INTO `sys_logininfor`
VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:15:22');
INSERT INTO `sys_logininfor`
VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:22:21');
INSERT INTO `sys_logininfor`
VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:22:25');
INSERT INTO `sys_logininfor`
VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:26:00');
INSERT INTO `sys_logininfor`
VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:26:40');
INSERT INTO `sys_logininfor`
VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:57:09');
INSERT INTO `sys_logininfor`
VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-05 23:57:21');
INSERT INTO `sys_logininfor`
VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-05 23:59:08');
INSERT INTO `sys_logininfor`
VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-06 00:13:22');
INSERT INTO `sys_logininfor`
VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 00:13:27');
INSERT INTO `sys_logininfor`
VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 11:14:49');
INSERT INTO `sys_logininfor`
VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 12:21:24');
INSERT INTO `sys_logininfor`
VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-02-06 14:03:10');
INSERT INTO `sys_logininfor`
VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 14:03:14');
INSERT INTO `sys_logininfor`
VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 16:52:59');
INSERT INTO `sys_logininfor`
VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 17:54:24');
INSERT INTO `sys_logininfor`
VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:29:39');
INSERT INTO `sys_logininfor`
VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:29:45');
INSERT INTO `sys_logininfor`
VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:29:50');
INSERT INTO `sys_logininfor`
VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:30:02');
INSERT INTO `sys_logininfor`
VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:30:55');
INSERT INTO `sys_logininfor`
VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:31:20');
INSERT INTO `sys_logininfor`
VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:32:20');
INSERT INTO `sys_logininfor`
VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:32:25');
INSERT INTO `sys_logininfor`
VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:32:29');
INSERT INTO `sys_logininfor`
VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:32:33');
INSERT INTO `sys_logininfor`
VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:33:48');
INSERT INTO `sys_logininfor`
VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:33:53');
INSERT INTO `sys_logininfor`
VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误',
        '2026-02-06 19:34:55');
INSERT INTO `sys_logininfor`
VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 19:35:15');
INSERT INTO `sys_logininfor`
VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-06 22:24:45');
INSERT INTO `sys_logininfor`
VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-07 10:04:31');
INSERT INTO `sys_logininfor`
VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-07 12:17:30');
INSERT INTO `sys_logininfor`
VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-07 13:36:13');
INSERT INTO `sys_logininfor`
VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-07 14:34:56');
INSERT INTO `sys_logininfor`
VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-02-07 15:24:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `menu_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `menu_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '菜单名称',
    `parent_id`   bigint                                                        NULL DEFAULT 0 COMMENT '父菜单ID',
    `order_num`   int                                                           NULL DEFAULT 0 COMMENT '显示顺序',
    `path`        varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
    `query`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
    `route_name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '路由名称',
    `is_frame`    int                                                           NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
    `is_cache`    int                                                           NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `menu_type`   char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `visible`     char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
    `perms`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2068
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu`
VALUES (1, '系统设置', 0, 3, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-06-24 22:47:50',
        'admin', '2026-02-05 15:24:49', '系统管理目录');
INSERT INTO `sys_menu`
VALUES (100, '用户管理', 1, 2, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user',
        'admin', '2025-06-24 22:47:50', 'admin', '2026-02-05 11:37:38', '用户管理菜单');
INSERT INTO `sys_menu`
VALUES (101, '角色管理', 1, 100, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list',
        'peoples', 'admin', '2025-06-24 22:47:50', 'admin', '2026-02-06 15:39:11', '角色管理菜单');
INSERT INTO `sys_menu`
VALUES (102, '菜单管理', 1, 8, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list',
        'tree-table', 'admin', '2025-06-24 22:47:50', 'admin', '2026-02-05 11:42:21', '菜单管理菜单');
INSERT INTO `sys_menu`
VALUES (103, '机构管理', 1, 1, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', '类型',
        'admin', '2025-06-24 22:47:50', 'admin', '2026-02-05 12:00:32', '部门管理菜单');
INSERT INTO `sys_menu`
VALUES (105, '字典管理', 1, 7, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict',
        'admin', '2025-06-24 22:47:50', 'admin', '2026-02-06 11:16:30', '字典管理菜单');
INSERT INTO `sys_menu`
VALUES (106, '参数设置', 1, 99, 'config', 'system/config/index', '', '', 1, 0, 'C', '1', '0', 'system:config:list',
        'edit', 'admin', '2025-06-24 22:47:50', 'admin', '2026-02-06 11:16:24', '参数设置菜单');
INSERT INTO `sys_menu`
VALUES (107, '通知消息', 2050, 4, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list',
        '提醒', 'admin', '2025-06-24 22:47:50', 'admin', '2026-02-06 16:12:07', '通知公告菜单');
INSERT INTO `sys_menu`
VALUES (116, '代码生成', 0, 5, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin',
        '2025-06-24 22:47:50', 'admin', '2026-02-05 15:24:54', '代码生成菜单');
INSERT INTO `sys_menu`
VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin',
        '2025-06-24 22:47:50', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2001, '功能定制管理', 1, 6, 'feature', 'ipms/feature/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:feature:list',
        'table', 'admin', '2026-02-05 11:27:45', 'admin', '2026-02-05 11:42:04', '会议功能菜单');
INSERT INTO `sys_menu`
VALUES (2002, '会议功能查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:feature:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2003, '会议功能新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:feature:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2004, '会议功能修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:feature:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2005, '会议功能删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:feature:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2006, '会议功能导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:feature:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2007, '会议列表', 0, 1, 'meeting', 'ipms/meeting/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:meeting:list',
        'excel', 'admin', '2026-02-05 11:27:45', 'admin', '2026-02-05 15:00:33', '会议菜单');
INSERT INTO `sys_menu`
VALUES (2008, '会议查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:meeting:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2009, '会议新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:meeting:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2010, '会议修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:meeting:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2011, '会议删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:meeting:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2012, '会议导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:meeting:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2019, '登录页背景设置', 1, 4, 'page', 'ipms/page/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:page:list',
        '图片', 'admin', '2026-02-05 11:27:45', 'admin', '2026-02-05 11:40:29', '登录页菜单');
INSERT INTO `sys_menu`
VALUES (2020, '登录页查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:page:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2021, '登录页新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:page:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2022, '登录页修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:page:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2023, '登录页删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:page:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2024, '登录页导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:page:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2025, '会议室管理', 1, 3, 'room', 'ipms/room/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:room:list', '提醒',
        'admin', '2026-02-05 11:27:45', 'admin', '2026-02-05 16:20:03', '会议室菜单');
INSERT INTO `sys_menu`
VALUES (2026, '会议室查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:room:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2027, '会议室新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:room:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2028, '会议室修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:room:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2029, '会议室删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:room:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2030, '会议室导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:room:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2031, '会议类型管理', 1, 5, 'type', 'ipms/type/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:type:list', 'tree',
        'admin', '2026-02-05 11:27:45', 'admin', '2026-02-05 11:40:52', '会议类型菜单');
INSERT INTO `sys_menu`
VALUES (2032, '会议类型查询', 2031, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:type:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2033, '会议类型新增', 2031, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:type:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2034, '会议类型修改', 2031, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:type:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2035, '会议类型删除', 2031, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:type:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2036, '会议类型导出', 2031, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:type:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2043, '会议投票', 2050, 6, 'vote', 'ipms/vote/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:vote:list', 'list',
        'admin', '2026-02-05 11:27:45', 'admin', '2026-02-06 16:13:34', '投票菜单');
INSERT INTO `sys_menu`
VALUES (2044, '投票查询', 2043, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:vote:query', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2045, '投票新增', 2043, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:vote:add', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2046, '投票修改', 2043, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:vote:edit', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2047, '投票删除', 2043, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:vote:remove', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2048, '投票导出', 2043, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:vote:export', '#', 'admin',
        '2026-02-05 11:27:45', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2050, '无纸化会议系统', 0, 4, 'mt', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'nested', 'admin',
        '2026-02-05 15:26:41', 'admin', '2026-02-07 10:56:52', '');
INSERT INTO `sys_menu`
VALUES (2051, '会议信息', 2050, 1, 'mt-info', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin',
        '2026-02-06 16:10:23', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2052, '参会人员', 2050, 2, 'mt-join-user', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'user', 'admin',
        '2026-02-06 16:10:55', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2053, '会议议程', 2050, 3, 'mt-agenda', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'date', 'admin',
        '2026-02-06 16:11:53', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2055, '会议纪要', 2050, 7, 'mt-minutes', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'dict', 'admin',
        '2026-02-06 16:13:02', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2056, '会议资料', 2050, 5, 'material', 'ipms/material/index', NULL, '', 1, 0, 'C', '0', '0',
        'ipms:material:list', 'clipboard', 'admin', '2026-02-06 16:58:05', 'admin', '2026-02-06 16:58:42',
        '会议资料菜单');
INSERT INTO `sys_menu`
VALUES (2057, '会议资料查询', 2056, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:material:query', '#', 'admin',
        '2026-02-06 16:58:05', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2058, '会议资料新增', 2056, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:material:add', '#', 'admin',
        '2026-02-06 16:58:05', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2059, '会议资料修改', 2056, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:material:edit', '#', 'admin',
        '2026-02-06 16:58:05', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2060, '会议资料删除', 2056, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:material:remove', '#', 'admin',
        '2026-02-06 16:58:05', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2061, '会议资料导出', 2056, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:material:export', '#', 'admin',
        '2026-02-06 16:58:05', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2062, '图片管理', 1, 97, 'image', 'ipms/image/index', NULL, '', 1, 0, 'C', '0', '0', 'ipms:image:list', '图片',
        'admin', '2026-02-06 22:34:42', 'admin', '2026-02-06 23:46:35', '图片菜单');
INSERT INTO `sys_menu`
VALUES (2063, '图片查询', 2062, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:image:query', '#', 'admin',
        '2026-02-06 22:34:42', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2064, '图片新增', 2062, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:image:add', '#', 'admin',
        '2026-02-06 22:34:42', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2065, '图片修改', 2062, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:image:edit', '#', 'admin',
        '2026-02-06 22:34:42', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2066, '图片删除', 2062, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:image:remove', '#', 'admin',
        '2026-02-06 22:34:42', '', NULL, '');
INSERT INTO `sys_menu`
VALUES (2067, '图片导出', 2062, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'ipms:image:export', '#', 'admin',
        '2026-02-06 22:34:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `notice_id`      int                                                           NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` longblob                                                      NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`      varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '通知公告表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice`
VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin',
        '2025-06-24 22:47:50', '', NULL, '管理员');
INSERT INTO `sys_notice`
VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-06-24 22:47:50',
        '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`
(
    `oper_id`        bigint                                                         NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`          varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '模块标题',
    `business_type`  int                                                            NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
    `method`         varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '方法名称',
    `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '请求方式',
    `operator_type`  int                                                            NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
    `oper_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '操作人员',
    `dept_name`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL DEFAULT '' COMMENT '部门名称',
    `oper_url`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '请求URL',
    `oper_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '主机地址',
    `oper_location`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '操作地点',
    `oper_param`     varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
    `json_result`    varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
    `status`         int                                                            NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
    `error_msg`      varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
    `oper_time`      datetime                                                       NULL DEFAULT NULL COMMENT '操作时间',
    `cost_time`      bigint                                                         NULL DEFAULT 0 COMMENT '消耗时间',
    PRIMARY KEY (`oper_id`) USING BTREE,
    INDEX `idx_sys_oper_log_bt` (`business_type` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_s` (`status` ASC) USING BTREE,
    INDEX `idx_sys_oper_log_ot` (`oper_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 504
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log`
VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":116,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"gen\",\"perms\":\"tool:gen:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-07 16:57:09', 24);
INSERT INTO `sys_oper_log`
VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_config\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-07 17:06:04', 80);
INSERT INTO `sys_oper_log`
VALUES (102, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2025-07-07 17:12:09', 22);
INSERT INTO `sys_oper_log`
VALUES (103, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"test\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":100,\"userName\":\"test\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-07-18 10:28:23', 161);
INSERT INTO `sys_oper_log`
VALUES (104, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dict/type/1', '127.0.0.1', '内网IP', '[1]', NULL, 1, '用户性别已分配,不能删除',
        '2025-07-18 17:33:20', 19);
INSERT INTO `sys_oper_log`
VALUES (105, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/config/8', '127.0.0.1', '内网IP', '[8]', NULL, 1,
        '内置参数【sys.account.passwordValidateDays】不能删除 ', '2025-07-18 17:33:40', 7);
INSERT INTO `sys_oper_log`
VALUES (106, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/config', '127.0.0.1', '内网IP',
        '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2025-06-24 22:47:50\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:11:18', 41);
INSERT INTO `sys_oper_log`
VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"红尘管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/mredust\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:30:27', 23);
INSERT INTO `sys_oper_log`
VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-09-07 17:30:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"红尘管理\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/mredust\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:31:07', 22);
INSERT INTO `sys_oper_log`
VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-09-07 17:30:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"红尘管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/system/user/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:31:45', 23);
INSERT INTO `sys_oper_log`
VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-09-07 17:30:27\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"红尘管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"mredust\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:32:21', 20);
INSERT INTO `sys_oper_log`
VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-09-07 17:30:27\",\"icon\":\"枫叶\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"红尘管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"mredust\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-07 17:33:50', 21);
INSERT INTO `sys_oper_log`
VALUES (112, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP',
        '{\"tables\":\"dictionary,login_page,meeting,meeting_agenda,meeting_attendee,meeting_feature,meeting_room,meeting_type,menu,organization\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-04 21:54:44', 781);
INSERT INTO `sys_oper_log`
VALUES (113, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"user,vote\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-04 21:55:11', 164);
INSERT INTO `sys_oper_log`
VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 10:51:05', 32);
INSERT INTO `sys_oper_log`
VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":101,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrgId\",\"columnComment\":\"归属单位\",\"columnId\":102,\"columnName\":\"org_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orgId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"归属部门\",\"columnId\":103,\"columnName\":\"dept_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EmployeeNo\",\"columnComment\":\"工号\",\"columnId\":104,\"columnName\":\"employee_no\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"employeeNo\",\"javaType\":\"String\",\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 10:53:03', 195);
INSERT INTO `sys_oper_log`
VALUES (116, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"机构类型\",\"dictType\":\"org_type\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:00:31', 19);
INSERT INTO `sys_oper_log`
VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"单位\",\"dictSort\":0,\"dictType\":\"org_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:01:26', 26);
INSERT INTO `sys_oper_log`
VALUES (118, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"部门\",\"dictSort\":1,\"dictType\":\"org_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:02:09', 30);
INSERT INTO `sys_oper_log`
VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"小组\",\"dictSort\":2,\"dictType\":\"org_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:02:42', 15);
INSERT INTO `sys_oper_log`
VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他\",\"dictSort\":3,\"dictType\":\"org_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:02:49', 23);
INSERT INTO `sys_oper_log`
VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"organization\",\"className\":\"Organization\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":89,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Avatar\",\"columnComment\":\"头像\",\"columnId\":90,\"columnName\":\"avatar\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"avatar\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"上级机构\",\"columnId\":91,\"columnName\":\"parent_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":true},{\"capJavaField\":\"OrgName\",\"columnComment\":\"机构名称\",\"columnId\":92,\"columnName\":\"org_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:04:22', 51);
INSERT INTO `sys_oper_log`
VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":101,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 10:53:02\",\"usableColumn\":false},{\"capJavaField\":\"OrgId\",\"columnComment\":\"归属单位\",\"columnId\":102,\"columnName\":\"org_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orgId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 10:53:02\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"归属部门\",\"columnId\":103,\"columnName\":\"dept_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 10:53:02\",\"usableColumn\":false},{\"capJavaField\":\"EmployeeNo\",\"columnComment\":\"工号\",\"columnId\":104,\"columnName\":\"employee_no\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:05:47', 68);
INSERT INTO `sys_oper_log`
VALUES (123, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2025-06-24 22:47:50\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通用户\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:06:33', 40);
INSERT INTO `sys_oper_log`
VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":1,\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:06:51', 32);
INSERT INTO `sys_oper_log`
VALUES (125, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2025-06-24 22:47:50\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通用户\",\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:07:12', 29);
INSERT INTO `sys_oper_log`
VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2025-06-24 22:47:50\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通用户\",\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:07:16', 23);
INSERT INTO `sys_oper_log`
VALUES (127, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2026-02-05 11:06:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:07:20', 26);
INSERT INTO `sys_oper_log`
VALUES (128, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2025-06-24 22:47:50\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,116,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通用户\",\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:07:26', 23);
INSERT INTO `sys_oper_log`
VALUES (129, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"User\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":101,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:05:47\",\"usableColumn\":false},{\"capJavaField\":\"OrgId\",\"columnComment\":\"归属单位\",\"columnId\":102,\"columnName\":\"org_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orgId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:05:47\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"归属部门\",\"columnId\":103,\"columnName\":\"dept_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:05:47\",\"usableColumn\":false},{\"capJavaField\":\"EmployeeNo\",\"columnComment\":\"工号\",\"columnId\":104,\"columnName\":\"employee_no\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:08:52', 51);
INSERT INTO `sys_oper_log`
VALUES (130, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"room\",\"className\":\"MeetingRoom\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"会议室名称\",\"columnId\":67,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":68,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"更新时间\",\"columnId\":69,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:09:50', 21);
INSERT INTO `sys_oper_log`
VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"page\",\"className\":\"LoginPage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":20,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":21,\"columnName\":\"title\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subtitle\",\"columnComment\":\"副标题\",\"columnId\":22,\"columnName\":\"subtitle\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"subtitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Footer\",\"columnComment\":\"页脚\",\"columnId\":23,\"columnName\":\"footer\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"footer\",\"javaT',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:10:52', 28);
INSERT INTO `sys_oper_log`
VALUES (132, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"room\",\"className\":\"MeetingRoom\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":66,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:09:50\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"会议室名称\",\"columnId\":67,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:09:50\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":68,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:09:50\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"更新时间\",\"columnId\":69,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"i',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:11:02', 33);
INSERT INTO `sys_oper_log`
VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"type\",\"className\":\"MeetingType\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":70,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名称\",\"columnId\":71,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"描述\",\"columnId\":72,\"columnName\":\"description\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"description\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SortOrder\",\"columnComment\":\"排序\",\"columnId\":73,\"columnName\":\"sort_order\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sortOrde',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:11:46', 32);
INSERT INTO `sys_oper_log`
VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"feature\",\"className\":\"MeetingFeature\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":59,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FeatureName\",\"columnComment\":\"功能名称\",\"columnId\":60,\"columnName\":\"feature_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"featureName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FeatureAlias\",\"columnComment\":\"功能别名\",\"columnId\":61,\"columnName\":\"feature_alias\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"featureAlias\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SortOrder\",\"columnComment\":\"排序\",\"columnId\":62,\"columnName\":\"sort_order\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isR',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:12:42', 33);
INSERT INTO `sys_oper_log`
VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"meeting\",\"className\":\"Meeting\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Scope\",\"columnComment\":\"所属范围\",\"columnId\":28,\"columnName\":\"scope\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"scope\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MeetingName\",\"columnComment\":\"会议名称\",\"columnId\":29,\"columnName\":\"meeting_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"meetingName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subtitle\",\"columnComment\":\"副标题\",\"columnId\":30,\"columnName\":\"subtitle\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:14:50', 55);
INSERT INTO `sys_oper_log`
VALUES (136, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 11:15:24', 23);
INSERT INTO `sys_oper_log`
VALUES (137, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门',
        '/tool/gen/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 11:15:28', 21);
INSERT INTO `sys_oper_log`
VALUES (138, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"投票类型\",\"dictType\":\"vote_type\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:16:29', 19);
INSERT INTO `sys_oper_log`
VALUES (139, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"模式一\",\"dictSort\":0,\"dictType\":\"vote_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:16:57', 21);
INSERT INTO `sys_oper_log`
VALUES (140, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"模式二\",\"dictSort\":1,\"dictType\":\"vote_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:17:06', 22);
INSERT INTO `sys_oper_log`
VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"自定义投票选项\",\"dictSort\":2,\"dictType\":\"vote_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:17:18', 13);
INSERT INTO `sys_oper_log`
VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"vote\",\"className\":\"Vote\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":117,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VoteTitle\",\"columnComment\":\"投票主题\",\"columnId\":118,\"columnName\":\"vote_title\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"voteTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AgendaId\",\"columnComment\":\"关联议程主题\",\"columnId\":119,\"columnName\":\"agenda_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"agendaId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"VoteMode\",\"columnComment\":\"投票模式\",\"columnId\":120,\"columnName\":\"vote_mode\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"vote_type\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"java',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:18:39', 50);
INSERT INTO `sys_oper_log`
VALUES (143, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"是否匿名投票\",\"dictType\":\"vote_anonymous\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:19:41', 12);
INSERT INTO `sys_oper_log`
VALUES (144, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"是否显示开关\",\"dictType\":\"show_switch\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:20:11', 11);
INSERT INTO `sys_oper_log`
VALUES (145, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"vote_anonymous\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:20:24', 13);
INSERT INTO `sys_oper_log`
VALUES (146, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"vote_anonymous\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:20:29', 20);
INSERT INTO `sys_oper_log`
VALUES (147, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"show_switch\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:20:40', 17);
INSERT INTO `sys_oper_log`
VALUES (148, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"show_switch\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:20:45', 22);
INSERT INTO `sys_oper_log`
VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"vote\",\"className\":\"Vote\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":117,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:18:39\",\"usableColumn\":false},{\"capJavaField\":\"VoteTitle\",\"columnComment\":\"投票主题\",\"columnId\":118,\"columnName\":\"vote_title\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"voteTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:18:39\",\"usableColumn\":false},{\"capJavaField\":\"AgendaId\",\"columnComment\":\"关联议程主题\",\"columnId\":119,\"columnName\":\"agenda_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"agendaId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 11:18:39\",\"usableColumn\":false},{\"capJavaField\":\"VoteMode\",\"columnComment\":\"投票模式\",\"columnId\":120,\"columnName\":\"vote_mode\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:55:11\",\"dictType\":\"vote_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:21:17', 35);
INSERT INTO `sys_oper_log`
VALUES (150, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"参会类型\",\"dictType\":\"join_meeting_type\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:23:44', 22);
INSERT INTO `sys_oper_log`
VALUES (151, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"全称参会\",\"dictSort\":0,\"dictType\":\"join_meeting_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"全程参会：可以查看所有议程及会议资料\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:24:03', 23);
INSERT INTO `sys_oper_log`
VALUES (152, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '研发部门', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"临时参会\",\"dictSort\":1,\"dictType\":\"join_meeting_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"临时参会：只能查看当前进行时的议题及资料\",\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:24:16', 14);
INSERT INTO `sys_oper_log`
VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP',
        '{\"tables\":\"user,vote,login_page,meeting,meeting_feature,meeting_room,meeting_type,organization\"}', NULL, 0,
        NULL, '2026-02-05 11:25:08', 1458);
INSERT INTO `sys_oper_log`
VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/meeting/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"会议\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"meeting\",\"perms\":\"ipms:meeting:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:31:40', 42);
INSERT INTO `sys_oper_log`
VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/organization/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"类型\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"organization\",\"perms\":\"ipms:organization:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:36:33', 25);
INSERT INTO `sys_oper_log`
VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:37:38', 22);
INSERT INTO `sys_oper_log`
VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/user/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"用户\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"ipms:user:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:37:42', 24);
INSERT INTO `sys_oper_log`
VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/page/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"图片\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"登录页背景设置\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"page\",\"perms\":\"ipms:page:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:40:29', 15);
INSERT INTO `sys_oper_log`
VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/type/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"会议类型管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"type\",\"perms\":\"ipms:type:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:40:53', 27);
INSERT INTO `sys_oper_log`
VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/feature/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"功能定制管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"feature\",\"perms\":\"ipms:feature:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:42:04', 25);
INSERT INTO `sys_oper_log`
VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:42:12', 22);
INSERT INTO `sys_oper_log`
VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 11:42:21', 23);
INSERT INTO `sys_oper_log`
VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:00:06', 27);
INSERT INTO `sys_oper_log`
VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"类型\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:00:19', 21);
INSERT INTO `sys_oper_log`
VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"类型\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"机构管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:00:32', 22);
INSERT INTO `sys_oper_log`
VALUES (166, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:00:55', 31);
INSERT INTO `sys_oper_log`
VALUES (167, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:00:57', 21);
INSERT INTO `sys_oper_log`
VALUES (168, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:00:59', 23);
INSERT INTO `sys_oper_log`
VALUES (169, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:01:01', 21);
INSERT INTO `sys_oper_log`
VALUES (170, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:01:03', 13);
INSERT INTO `sys_oper_log`
VALUES (171, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105',
        '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 12:01:14', 6);
INSERT INTO `sys_oper_log`
VALUES (172, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:01:18', 22);
INSERT INTO `sys_oper_log`
VALUES (173, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103',
        '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 12:01:20', 4);
INSERT INTO `sys_oper_log`
VALUES (174, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:01:44', 21);
INSERT INTO `sys_oper_log`
VALUES (175, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-06-24 22:47:50\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-06-24 22:47:50\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"pwdUpdateDate\":\"2025-06-24 22:47:50\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:01:58', 50);
INSERT INTO `sys_oper_log`
VALUES (176, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:02:10', 24);
INSERT INTO `sys_oper_log`
VALUES (177, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101',
        '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 12:02:14', 2);
INSERT INTO `sys_oper_log`
VALUES (178, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dept\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:13:27', 219);
INSERT INTO `sys_oper_log`
VALUES (179, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门',
        '/tool/gen/synchDb/sys_dept', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:15:51', 1361);
INSERT INTO `sys_oper_log`
VALUES (180, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门',
        '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"dept\",\"className\":\"SysDept\",\"columns\":[{\"capJavaField\":\"DeptId\",\"columnComment\":\"机构id\",\"columnId\":126,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 12:13:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 12:15:50\",\"usableColumn\":false},{\"capJavaField\":\"ParentId\",\"columnComment\":\"父机构id\",\"columnId\":127,\"columnName\":\"parent_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 12:13:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"parentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 12:15:50\",\"usableColumn\":true},{\"capJavaField\":\"Ancestors\",\"columnComment\":\"祖级列表\",\"columnId\":128,\"columnName\":\"ancestors\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 12:13:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"ancestors\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":14,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 12:15:50\",\"usableColumn\":false},{\"capJavaField\":\"DeptName\",\"columnComment\":\"机构名称\",\"columnId\":129,\"columnName\":\"dept_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 12:13:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"inser',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 12:17:14', 104);
INSERT INTO `sys_oper_log`
VALUES (181, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_dept\"}', NULL, 0, NULL,
        '2026-02-05 12:17:21', 563);
INSERT INTO `sys_oper_log`
VALUES (182, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.hasChildByDeptId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from sys_dept   where del_flag = \'0\' and parent_id = ? limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'',
        '2026-02-05 12:51:58', 166);
INSERT INTO `sys_oper_log`
VALUES (183, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.hasChildByDeptId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1) from sys_dept   where del_flag = \'0\' and parent_id = ? limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'del_flag\' in \'where clause\'',
        '2026-02-05 12:52:13', 6);
INSERT INTO `sys_oper_log`
VALUES (184, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.hasChildByDeptId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1)         from sys_dept         where and parent_id = ?         limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3',
        '2026-02-05 12:54:46', 35);
INSERT INTO `sys_oper_log`
VALUES (185, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.hasChildByDeptId-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1)         from sys_dept         where and parent_id = ?         limit 1\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and parent_id = 109\n        limit 1\' at line 3',
        '2026-02-05 12:55:07', 5);
INSERT INTO `sys_oper_log`
VALUES (186, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '109', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:57:01', 44);
INSERT INTO `sys_oper_log`
VALUES (187, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '108', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:57:07', 17);
INSERT INTO `sys_oper_log`
VALUES (188, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '102', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 12:57:09', 14);
INSERT INTO `sys_oper_log`
VALUES (189, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:02', 26);
INSERT INTO `sys_oper_log`
VALUES (190, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '106', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:04', 23);
INSERT INTO `sys_oper_log`
VALUES (191, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '105', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:05', 24);
INSERT INTO `sys_oper_log`
VALUES (192, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '104', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:07', 15);
INSERT INTO `sys_oper_log`
VALUES (193, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103',
        '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 13:08:10', 6);
INSERT INTO `sys_oper_log`
VALUES (194, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101',
        '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 13:08:12', 3);
INSERT INTO `sys_oper_log`
VALUES (195, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101',
        '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2026-02-05 13:08:41', 3);
INSERT INTO `sys_oper_log`
VALUES (196, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:43', 25);
INSERT INTO `sys_oper_log`
VALUES (197, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:08:45', 26);
INSERT INTO `sys_oper_log`
VALUES (198, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"zhangsan@qq.com\",\"leader\":\"张三\",\"orderNum\":0,\"orgType\":\"1\",\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:09:18', 26);
INSERT INTO `sys_oper_log`
VALUES (199, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"zhangsan@qq.com\",\"leader\":\"张三\",\"orderNum\":0,\"orgCode\":\"010203040506070809\",\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:09:29', 28);
INSERT INTO `sys_oper_log`
VALUES (200, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orderNum\":2,\"orgType\":\"1\",\"params\":{},\"status\":\"0\"}',
        NULL, 1, 'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getStatus()\" because \"info\" is null',
        '2026-02-05 13:15:17', 23);
INSERT INTO `sys_oper_log`
VALUES (201, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试不骂你\",\"orgType\":\"1\",\"params\":{}}', NULL, 1,
        'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getAncestors()\" because \"info\" is null',
        '2026-02-05 13:22:54', 31);
INSERT INTO `sys_oper_log`
VALUES (202, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"1\",\"params\":{}}', NULL, 1,
        'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getAncestors()\" because \"info\" is null',
        '2026-02-05 13:23:15', 9);
INSERT INTO `sys_oper_log`
VALUES (203, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":100}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dept(        parent_id,     dept_name,     ancestors,                     org_type,         create_by,    create_time   )values(        ?,     ?,     ?,                 ?,    sysdate()   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1',
        '2026-02-05 13:24:30', 105);
INSERT INTO `sys_oper_log`
VALUES (204, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":100}',
        NULL, 1,
        'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'org_type\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 13:27:23', 41);
INSERT INTO `sys_oper_log`
VALUES (205, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":100}',
        NULL, 1,
        'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'org_type\' in \'class com.ruoyi.common.core.domain.entity.SysDept\'',
        '2026-02-05 13:30:52', 143032);
INSERT INTO `sys_oper_log`
VALUES (206, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":100}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:32:11', 11383);
INSERT INTO `sys_oper_log`
VALUES (207, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100,200\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试单位\",\"leader\":\"李四\",\"orgCode\":\"01011\",\"orgType\":\"0\",\"params\":{},\"parentId\":200,\"phone\":\"12345678901\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:32:43', 29);
INSERT INTO `sys_oper_log`
VALUES (208, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/201', '127.0.0.1', '内网IP', '201', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:32:48', 23);
INSERT INTO `sys_oper_log`
VALUES (209, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/200', '127.0.0.1', '内网IP', '200', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:32:49', 23);
INSERT INTO `sys_oper_log`
VALUES (210, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}', NULL, 1,
        'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getAncestors()\" because \"info\" is null',
        '2026-02-05 13:33:02', 12);
INSERT INTO `sys_oper_log`
VALUES (211, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}', NULL, 1,
        'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getAncestors()\" because \"info\" is null',
        '2026-02-05 13:34:37', 40);
INSERT INTO `sys_oper_log`
VALUES (212, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}', NULL, 1,
        'Cannot invoke \"com.ruoyi.common.core.domain.entity.SysDept.getAncestors()\" because \"info\" is null',
        '2026-02-05 13:34:52', 6);
INSERT INTO `sys_oper_log`
VALUES (213, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}', NULL, 1,
        'java.lang.NullPointerException\r\n	at com.ruoyi.system.service.impl.SysDeptServiceImpl.insertDept(Unknown Source)\r\n	at com.ruoyi.system.service.impl.SysDeptServiceImpl$$FastClassBySpringCGLIB$$b1f4f5f8.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:707)\r\n	at com.ruoyi.system.service.impl.SysDeptServiceImpl$$EnhancerBySpringCGLIB$$e17f4b6b.insertDept(<generated>)\r\n	at com.ruoyi.web.controller.system.SysDeptController.add(SysDeptController.java:71)\r\n	at com.ruoyi.web.controller.system.SysDeptController$$FastClassBySpringCGLIB$$e2a16b48.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:792)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:762)\r\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.',
        '2026-02-05 13:36:46', 99951);
INSERT INTO `sys_oper_log`
VALUES (214, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:36:46', 32);
INSERT INTO `sys_oper_log`
VALUES (215, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:37:25', 231);
INSERT INTO `sys_oper_log`
VALUES (216, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:37:53', 28);
INSERT INTO `sys_oper_log`
VALUES (217, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/203', '127.0.0.1', '内网IP', '203', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:38:43', 22);
INSERT INTO `sys_oper_log`
VALUES (218, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/202', '127.0.0.1', '内网IP', '202', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:38:45', 26);
INSERT INTO `sys_oper_log`
VALUES (219, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/204', '127.0.0.1', '内网IP', '204', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:38:47', 26);
INSERT INTO `sys_oper_log`
VALUES (220, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:39:02', 32);
INSERT INTO `sys_oper_log`
VALUES (221, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":205}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:39:26', 25);
INSERT INTO `sys_oper_log`
VALUES (222, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试部门\",\"orgType\":\"2\",\"params\":{},\"parentId\":206}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:39:40', 23);
INSERT INTO `sys_oper_log`
VALUES (223, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"zhangsan@qq.com\",\"leader\":\"张三\",\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"remark\":\"备注\"}',
        NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(100, ancestors)\' at line 3\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.selectNormalChildrenDeptById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)         from sys_dept         where and find_in_set(?, ancestors)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(100, ancestors)\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(100, ancestors)\' at line 3',
        '2026-02-05 13:42:05', 129);
INSERT INTO `sys_oper_log`
VALUES (224, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/207', '127.0.0.1', '内网IP', '207', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:42:37', 17);
INSERT INTO `sys_oper_log`
VALUES (225, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/206', '127.0.0.1', '内网IP', '206', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:42:39', 14);
INSERT INTO `sys_oper_log`
VALUES (226, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/205', '127.0.0.1', '内网IP', '205', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:42:41', 13);
INSERT INTO `sys_oper_log`
VALUES (227, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"0\",\"params\":{},\"phone\":\"12345678901\",\"remark\":\"备注\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:43:25', 21);
INSERT INTO `sys_oper_log`
VALUES (228, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"\",\"children\":[],\"deptId\":208,\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"1\",\"params\":{},\"parentId\":0,\"phone\":\"12345678901\",\"remark\":\"备注\"}',
        NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.selectNormalChildrenDeptById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)         from sys_dept         where and find_in_set(?, ancestors)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3',
        '2026-02-05 13:46:39', 27);
INSERT INTO `sys_oper_log`
VALUES (229, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"\",\"children\":[],\"deptId\":208,\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"1\",\"params\":{},\"parentId\":0,\"phone\":\"12345678901\",\"remark\":\"备注\"}',
        NULL, 1,
        '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.selectNormalChildrenDeptById-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(*)         from sys_dept         where and find_in_set(?, ancestors)\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'and find_in_set(208, ancestors)\' at line 3',
        '2026-02-05 13:46:55', 10);
INSERT INTO `sys_oper_log`
VALUES (230, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"\",\"children\":[],\"deptId\":208,\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"1\",\"params\":{},\"parentId\":0,\"phone\":\"12345678901\",\"remark\":\"备注\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:52:57', 64);
INSERT INTO `sys_oper_log`
VALUES (231, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":208,\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"1\",\"params\":{},\"parentId\":100,\"phone\":\"12345678901\",\"remark\":\"备注\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:53:05', 38);
INSERT INTO `sys_oper_log`
VALUES (232, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":208,\"deptName\":\"中央系统\",\"email\":\"lisi@qq.com\",\"leader\":\"李四\",\"orgCode\":\"01\",\"orgType\":\"1\",\"params\":{},\"parentName\":\"无纸化会议系统\",\"phone\":\"12345678901\",\"remark\":\"备注\"}',
        NULL, 1,
        'Cannot invoke \"java.lang.Long.equals(Object)\" because the return value of \"com.ruoyi.common.core.domain.entity.SysDept.getParentId()\" is null',
        '2026-02-05 13:53:17', 11);
INSERT INTO `sys_oper_log`
VALUES (233, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/system/dept/208', '127.0.0.1', '内网IP', '208', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 13:53:57', 17);
INSERT INTO `sys_oper_log`
VALUES (234, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"\",\"leader\":\"\",\"orgCode\":\"\",\"orgType\":\"1\",\"params\":{},\"parentId\":0,\"phone\":\"\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:56:46', 29);
INSERT INTO `sys_oper_log`
VALUES (235, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"email\":\"\",\"leader\":\"\",\"orgCode\":\"\",\"orgType\":\"3\",\"params\":{},\"parentId\":0,\"phone\":\"\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:56:52', 20);
INSERT INTO `sys_oper_log`
VALUES (236, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试系统\",\"orgType\":\"0\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:57:08', 29);
INSERT INTO `sys_oper_log`
VALUES (237, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试帮忙呢\",\"orgType\":\"1\",\"params\":{},\"parentId\":209}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:57:18', 23);
INSERT INTO `sys_oper_log`
VALUES (238, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门',
        '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"测试\",\"orgType\":\"2\",\"params\":{},\"parentId\":210}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 13:57:33', 26);
INSERT INTO `sys_oper_log`
VALUES (239, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/room/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"提醒\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"会议室管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"room\",\"perms\":\"ipms:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:04:05', 153);
INSERT INTO `sys_oper_log`
VALUES (240, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:05:15\",\"id\":1,\"name\":\"党委会议室\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:05:15', 49);
INSERT INTO `sys_oper_log`
VALUES (241, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:06:28\",\"id\":2,\"name\":\"行政会议室\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:06:29', 25);
INSERT INTO `sys_oper_log`
VALUES (242, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:06:32\",\"id\":3,\"name\":\"无纸化会议室\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:06:32', 8);
INSERT INTO `sys_oper_log`
VALUES (243, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:06:37\",\"id\":4,\"name\":\"常委会议室\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:06:37', 18);
INSERT INTO `sys_oper_log`
VALUES (244, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:06:41\",\"id\":5,\"name\":\"大会议室\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:06:41', 19);
INSERT INTO `sys_oper_log`
VALUES (245, '会议室', 1, 'com.ruoyi.system.controller.MeetingRoomController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:15:05\",\"id\":6,\"name\":\"测试\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:15:05', 21);
INSERT INTO `sys_oper_log`
VALUES (246, '会议室', 2, 'com.ruoyi.system.controller.MeetingRoomController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/ipms/room', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:15:06\",\"id\":6,\"name\":\"测试1111\",\"params\":{},\"updateTime\":\"2026-02-05 14:15:11\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:15:11', 20);
INSERT INTO `sys_oper_log`
VALUES (247, '会议室', 3, 'com.ruoyi.system.controller.MeetingRoomController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/ipms/room/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 14:15:16', 23);
INSERT INTO `sys_oper_log`
VALUES (248, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:19:48\",\"description\":\"党委会议\",\"id\":1,\"name\":\"党委会\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:19:48', 25);
INSERT INTO `sys_oper_log`
VALUES (249, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:20:09\",\"description\":\"主任\",\"id\":2,\"name\":\"主任会议\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:20:09', 20);
INSERT INTO `sys_oper_log`
VALUES (250, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:20:20\",\"description\":\"办公室\",\"id\":3,\"name\":\"办公室会议\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:20:20', 19);
INSERT INTO `sys_oper_log`
VALUES (251, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:20:28\",\"description\":\"调解\",\"id\":4,\"name\":\"调解室会议\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:20:28', 19);
INSERT INTO `sys_oper_log`
VALUES (252, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:20:36\",\"description\":\"业务部\",\"id\":5,\"name\":\"业务开发\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:20:36', 21);
INSERT INTO `sys_oper_log`
VALUES (253, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:20:45\",\"description\":\"行政办公会\",\"id\":6,\"name\":\"行政办公会\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:20:45', 19);
INSERT INTO `sys_oper_log`
VALUES (254, '会议类型', 1, 'com.ruoyi.system.controller.MeetingTypeController.add()', 'POST', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:26:25\",\"description\":\"测试\",\"id\":7,\"name\":\"测试\",\"params\":{},\"remark\":\"测试\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:26:25', 23);
INSERT INTO `sys_oper_log`
VALUES (255, '会议类型', 2, 'com.ruoyi.system.controller.MeetingTypeController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/ipms/type', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 14:26:25\",\"description\":\"测试111\",\"id\":7,\"name\":\"测试\",\"params\":{},\"remark\":\"测试\",\"sortOrder\":0,\"updateTime\":\"2026-02-05 14:26:29\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:26:29', 13);
INSERT INTO `sys_oper_log`
VALUES (256, '会议类型', 3, 'com.ruoyi.system.controller.MeetingTypeController.remove()', 'DELETE', 1, 'admin',
        '研发部门', '/ipms/type/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-05 14:26:31', 10);
INSERT INTO `sys_oper_log`
VALUES (257, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:33:08\",\"featureAlias\":\"tongping\",\"featureName\":\"终端同屏\",\"id\":1,\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:33:08', 23);
INSERT INTO `sys_oper_log`
VALUES (258, '会议功能', 2, 'com.ruoyi.system.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:33:08\",\"featureAlias\":\"tongping\",\"featureName\":\"终端同屏\",\"id\":1,\"params\":{},\"sortOrder\":1,\"updateTime\":\"2026-02-05 14:33:49\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:33:49', 21);
INSERT INTO `sys_oper_log`
VALUES (259, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:04\",\"featureAlias\":\"qiehuan\",\"featureName\":\"切换界面\",\"id\":2,\"params\":{},\"sortOrder\":2}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:04', 20);
INSERT INTO `sys_oper_log`
VALUES (260, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:16\",\"featureAlias\":\"huiyipingjia\",\"featureName\":\"会议评价\",\"id\":3,\"params\":{},\"sortOrder\":3}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:16', 9);
INSERT INTO `sys_oper_log`
VALUES (261, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:27\",\"featureAlias\":\"toupiaobiaojue\",\"featureName\":\"投票表决\",\"id\":4,\"params\":{},\"sortOrder\":4}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:27', 20);
INSERT INTO `sys_oper_log`
VALUES (262, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:37\",\"featureAlias\":\"huiyifuwu\",\"featureName\":\"会议服务\",\"id\":5,\"params\":{},\"sortOrder\":5}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:37', 12);
INSERT INTO `sys_oper_log`
VALUES (263, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:45\",\"featureAlias\":\"tongzhixiaoxi\",\"featureName\":\"通知消息\",\"id\":6,\"params\":{},\"sortOrder\":6}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:45', 20);
INSERT INTO `sys_oper_log`
VALUES (264, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:34:55\",\"featureAlias\":\"huiyijilu\",\"featureName\":\"会议记录\",\"id\":7,\"params\":{},\"sortOrder\":7}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:34:55', 19);
INSERT INTO `sys_oper_log`
VALUES (265, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:06\",\"featureAlias\":\"huiyikongjian\",\"featureName\":\"会议空间\",\"id\":8,\"params\":{},\"sortOrder\":8}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:35:06', 17);
INSERT INTO `sys_oper_log`
VALUES (266, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:15\",\"featureAlias\":\"waibuxinhao\",\"featureName\":\"外部信号\",\"id\":9,\"params\":{},\"sortOrder\":9}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:35:15', 17);
INSERT INTO `sys_oper_log`
VALUES (267, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:29\",\"featureAlias\":\"qianpi\",\"featureName\":\"签批\",\"id\":10,\"params\":{},\"sortOrder\":10}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:35:29', 17);
INSERT INTO `sys_oper_log`
VALUES (268, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:38\",\"featureAlias\":\"touying\",\"featureName\":\"大屏投影\",\"id\":11,\"params\":{},\"sortOrder\":11}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:35:38', 11);
INSERT INTO `sys_oper_log`
VALUES (269, '会议功能', 1, 'com.ruoyi.system.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:48\",\"featureAlias\":\"tencentmt\",\"featureName\":\"腾讯会议\",\"id\":12,\"params\":{},\"sortOrder\":20}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:35:48', 20);
INSERT INTO `sys_oper_log`
VALUES (270, '会议功能', 2, 'com.ruoyi.system.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:06\",\"featureAlias\":\"huiyikongjian\",\"featureName\":\"会议空间\",\"id\":8,\"params\":{},\"sortOrder\":19,\"updateTime\":\"2026-02-05 14:36:19\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:36:19', 8);
INSERT INTO `sys_oper_log`
VALUES (271, '会议功能', 2, 'com.ruoyi.system.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '研发部门', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#ffffff\",\"createTime\":\"2026-02-05 14:35:06\",\"featureAlias\":\"huiyikongjian\",\"featureName\":\"会议空间\",\"id\":8,\"params\":{},\"sortOrder\":8,\"updateTime\":\"2026-02-05 14:36:29\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 14:36:29', 22);
INSERT INTO `sys_oper_log`
VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/meeting/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"会议列表\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"meeting\",\"perms\":\"ipms:meeting:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:00:28', 26);
INSERT INTO `sys_oper_log`
VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/meeting/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"会议列表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"meeting\",\"perms\":\"ipms:meeting:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:00:33', 20);
INSERT INTO `sys_oper_log`
VALUES (274, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门',
        '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:00:39', 23);
INSERT INTO `sys_oper_log`
VALUES (275, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的面板\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/my\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:24:30', 38);
INSERT INTO `sys_oper_log`
VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/vote/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"投票\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"vote\",\"perms\":\"ipms:vote:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:24:42', 22);
INSERT INTO `sys_oper_log`
VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统设置\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:24:49', 19);
INSERT INTO `sys_oper_log`
VALUES (278, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":116,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"gen\",\"perms\":\"tool:gen:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:24:54', 19);
INSERT INTO `sys_oper_log`
VALUES (279, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/menu/2049', '127.0.0.1', '内网IP', '2049', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 15:25:37', 25);
INSERT INTO `sys_oper_log`
VALUES (280, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"无纸化会议系统\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"mt\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:26:41', 15);
INSERT INTO `sys_oper_log`
VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/vote/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"会议投票\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2050,\"path\":\"vote\",\"perms\":\"ipms:vote:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:27:29', 13);
INSERT INTO `sys_oper_log`
VALUES (282, '登录页', 1, 'com.ruoyi.system.controller.LoginPageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-05 15:29:33\",\"id\":1,\"params\":{},\"subtitle\":\"\",\"title\":\"无纸化会议系统\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:29:33', 31);
INSERT INTO `sys_oper_log`
VALUES (283, '登录页', 2, 'com.ruoyi.system.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/book_20260205153324A001.png\",\"createTime\":\"2026-02-05 15:29:34\",\"id\":1,\"params\":{},\"subtitle\":\"\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-05 15:33:25\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:33:25', 19);
INSERT INTO `sys_oper_log`
VALUES (284, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:34:47', 21);
INSERT INTO `sys_oper_log`
VALUES (285, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/dept/211', '127.0.0.1', '内网IP', '211', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 15:35:00', 21);
INSERT INTO `sys_oper_log`
VALUES (286, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '无纸化会议系统', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 15:53:41', 433);
INSERT INTO `sys_oper_log`
VALUES (287, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 15:53:47', 410);
INSERT INTO `sys_oper_log`
VALUES (288, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/dept/210', '127.0.0.1', '内网IP', '210', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 16:19:35', 35);
INSERT INTO `sys_oper_log`
VALUES (289, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/dept/209', '127.0.0.1', '内网IP', '209', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 16:19:37', 18);
INSERT INTO `sys_oper_log`
VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/room/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"提醒\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"会议室管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"room\",\"perms\":\"ipms:room:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:20:04', 29);
INSERT INTO `sys_oper_log`
VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":100,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:20:34', 22);
INSERT INTO `sys_oper_log`
VALUES (292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:20:45', 22);
INSERT INTO `sys_oper_log`
VALUES (293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知消息\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2050,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:21:14', 26);
INSERT INTO `sys_oper_log`
VALUES (294, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:21:58', 15);
INSERT INTO `sys_oper_log`
VALUES (295, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2026-02-05 15:26:41\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"无纸化会议系统\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"mt\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:23:42', 23);
INSERT INTO `sys_oper_log`
VALUES (296, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/synchDb/sys_user', '127.0.0.1', '内网IP', '{}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:40:41', 194);
INSERT INTO `sys_oper_log`
VALUES (297, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":143,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:40:41\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门ID\",\"columnId\":144,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:40:41\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"姓名\",\"columnId\":146,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:40:41\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"登录名\",\"columnId\":145,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 16:42:48', 164);
INSERT INTO `sys_oper_log`
VALUES (298, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 16:42:56', 525);
INSERT INTO `sys_oper_log`
VALUES (299, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":143,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:42:48\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门ID\",\"columnId\":144,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:42:48\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"姓名\",\"columnId\":146,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 16:42:48\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"登录名\",\"columnId\":145,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 17:52:10', 197);
INSERT INTO `sys_oper_log`
VALUES (300, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 17:52:16', 440);
INSERT INTO `sys_oper_log`
VALUES (301, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"employeeNo\":\"001\",\"nickName\":\"李四\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[2,100],\"status\":\"0\",\"userId\":101,\"userName\":\"lisi\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 19:11:29', 230);
INSERT INTO `sys_oper_log`
VALUES (302, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/user/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 21:08:38', 43);
INSERT INTO `sys_oper_log`
VALUES (303, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 21:08:41', 26);
INSERT INTO `sys_oper_log`
VALUES (304, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"科技有限公司\",\"orgType\":\"0\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:43:15', 31);
INSERT INTO `sys_oper_log`
VALUES (305, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"网络有限公司\",\"orgType\":\"0\",\"params\":{}}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:43:25', 23);
INSERT INTO `sys_oper_log`
VALUES (306, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"开发部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":212}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:43:39', 19);
INSERT INTO `sys_oper_log`
VALUES (307, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dept', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"deptName\":\"运维部门\",\"orgType\":\"1\",\"params\":{},\"parentId\":213}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:43:48', 31);
INSERT INTO `sys_oper_log`
VALUES (308, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":214,\"employeeNo\":\"002\",\"nickName\":\"参会人员2\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[100,2],\"status\":\"0\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:45:14', 162);
INSERT INTO `sys_oper_log`
VALUES (309, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 19:11:29\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"001\",\"loginIp\":\"\",\"nickName\":\"参会人员1\",\"orgId\":100,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"参会人员1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:45:38', 42);
INSERT INTO `sys_oper_log`
VALUES (310, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 19:11:29\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"001\",\"loginIp\":\"\",\"nickName\":\"参会人员1\",\"orgId\":100,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"修改用户\'参会人员2\'失败，登录账号已存在\",\"code\":500}', 0, NULL, '2026-02-05 21:46:03', 4);
INSERT INTO `sys_oper_log`
VALUES (311, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 19:11:29\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"001\",\"loginIp\":\"\",\"nickName\":\"参会人员1\",\"orgId\":100,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"参会人员1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:46:10', 27);
INSERT INTO `sys_oper_log`
VALUES (312, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"employeeNo\":\"003\",\"nickName\":\"参会人员3\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":103,\"userName\":\"参会人员3\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:57:25', 131);
INSERT INTO `sys_oper_log`
VALUES (313, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":143,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 17:52:09\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门ID\",\"columnId\":144,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 17:52:09\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"姓名\",\"columnId\":146,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 17:52:09\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"登录名\",\"columnId\":145,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:58:21', 159);
INSERT INTO `sys_oper_log`
VALUES (314, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 21:58:26', 395);
INSERT INTO `sys_oper_log`
VALUES (315, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":143,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:58:21\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门ID\",\"columnId\":144,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:58:21\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"姓名\",\"columnId\":146,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:58:21\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"登录名\",\"columnId\":145,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 21:59:14', 76);
INSERT INTO `sys_oper_log`
VALUES (316, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 21:59:19', 243);
INSERT INTO `sys_oper_log`
VALUES (317, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"user\",\"className\":\"SysUser\",\"columns\":[{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":143,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:59:14\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门ID\",\"columnId\":144,\"columnName\":\"dept_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:59:14\",\"usableColumn\":false},{\"capJavaField\":\"NickName\",\"columnComment\":\"姓名\",\"columnId\":146,\"columnName\":\"nick_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"checkbox\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"nickName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-02-05 21:59:14\",\"usableColumn\":false},{\"capJavaField\":\"UserName\",\"columnComment\":\"登录名\",\"columnId\":145,\"columnName\":\"user_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 15:53:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":t',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:01:38', 69);
INSERT INTO `sys_oper_log`
VALUES (318, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', NULL, 0, NULL,
        '2026-02-05 22:01:43', 237);
INSERT INTO `sys_oper_log`
VALUES (319, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"employeeNo\":\"004\",\"nickName\":\"参会人员4\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":104,\"userName\":\"参会人员4\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:11:26', 184);
INSERT INTO `sys_oper_log`
VALUES (320, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/defaultAvatar_20260205221223A001.png\",\"createBy\":\"admin\",\"deptId\":100,\"employeeNo\":\"005\",\"nickName\":\"参会人员5\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":105,\"userName\":\"参会人员5\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:12:24', 185);
INSERT INTO `sys_oper_log`
VALUES (321, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/male_20260205222508A002.png\",\"createBy\":\"admin\",\"deptId\":214,\"email\":\"123@qq.com\",\"employeeNo\":\"4444\",\"nickName\":\"王五\",\"orgId\":212,\"params\":{},\"phonenumber\":\"12345678901\",\"position\":\"开发\",\"postIds\":[],\"remark\":\"beizh\",\"roleIds\":[2,100,1],\"sign\":\"/profile/upload/2026/02/05/defaultAvatar_20260205222514A003.png\",\"status\":\"0\",\"unit\":\"开发部门\",\"userId\":106,\"userName\":\"王五\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:25:16', 169);
INSERT INTO `sys_oper_log`
VALUES (322, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205223456A006.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:25:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":214,\"deptName\":\"开发部门\",\"params\":{},\"parentId\":212},\"deptId\":214,\"email\":\"34567@qq.com\",\"employeeNo\":\"5555\",\"loginIp\":\"\",\"nickName\":\"陈留\",\"orgId\":100,\"params\":{},\"phonenumber\":\"33334567890\",\"position\":\"测试\",\"remark\":\"zz\",\"roleIds\":[2],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"系统管理员\",\"roleSort\":1,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/male_20260205223501A007.png\",\"status\":\"0\",\"unit\":\"开发部门\",\"updateBy\":\"admin\",\"userId\":106,\"userName\":\"陈留\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:35:11', 85);
INSERT INTO `sys_oper_log`
VALUES (323, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205223456A006.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:25:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":214,\"deptName\":\"开发部门\",\"params\":{},\"parentId\":212},\"deptId\":213,\"email\":\"111@qq.com\",\"employeeNo\":\"5555\",\"loginIp\":\"\",\"nickName\":\"chen\",\"orgId\":213,\"params\":{},\"phonenumber\":\"11134567890\",\"position\":\"test\",\"remark\":\"11\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/defaultAvatar_20260205222514A003.png\",\"status\":\"0\",\"unit\":\"test\",\"updateBy\":\"admin\",\"userId\":106,\"userName\":\"chen\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:36:14', 25);
INSERT INTO `sys_oper_log`
VALUES (324, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224136A001.png\",\"deptId\":100,\"email\":\"111@qq.com\",\"employeeNo\":\"11111\",\"nickName\":\"111\",\"orgId\":100,\"params\":{},\"phonenumber\":\"111\",\"position\":\"111\",\"postIds\":[],\"remark\":\"111\",\"roleIds\":[2],\"sign\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224138A002.png\",\"status\":\"0\",\"unit\":\"111\",\"userName\":\"111\"}',
        '{\"msg\":\"新增用户\'111\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2026-02-05 22:41:46', 38);
INSERT INTO `sys_oper_log`
VALUES (325, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224136A001.png\",\"deptId\":100,\"email\":\"111@qq.com\",\"employeeNo\":\"11111\",\"nickName\":\"111\",\"orgId\":100,\"params\":{},\"phonenumber\":\"111\",\"position\":\"111\",\"postIds\":[],\"remark\":\"111\",\"roleIds\":[2],\"sign\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224138A002.png\",\"status\":\"0\",\"unit\":\"111\",\"userName\":\"111\"}',
        '{\"msg\":\"新增用户\'111\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2026-02-05 22:42:03', 7);
INSERT INTO `sys_oper_log`
VALUES (326, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224136A001.png\",\"createBy\":\"admin\",\"deptId\":100,\"email\":\"111@qq.com\",\"employeeNo\":\"11111\",\"nickName\":\"111\",\"orgId\":100,\"params\":{},\"phonenumber\":\"111\",\"position\":\"111\",\"postIds\":[],\"remark\":\"111\",\"roleIds\":[2],\"sign\":\"/profile/upload/2026/02/05/defaultAvatar_20260205224138A002.png\",\"status\":\"0\",\"unit\":\"111\",\"userId\":107,\"userName\":\"111\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:42:18', 142);
INSERT INTO `sys_oper_log`
VALUES (327, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205224243A003.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:42:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":212,\"email\":\"222@qq.com\",\"employeeNo\":\"22222\",\"loginIp\":\"\",\"nickName\":\"222\",\"orgId\":212,\"params\":{},\"phonenumber\":\"222\",\"position\":\"222\",\"remark\":\"222\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/female_20260205224247A004.png\",\"status\":\"0\",\"unit\":\"222\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"222\"}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \'/profile/upload/2026/02/05/female_20260205224247A004.png\',\n \' at line 15\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user          SET dept_id = ?,             nick_name = ?,             email = ?,             phonenumber = ?,             sex = ?,             avatar = ?,                          status = ?,                                       update_by = ?,             remark = ?,             position = ?,             ?,             ?,             ?,             ?,             update_time = sysdate()          where user_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \'/profile/upload/2026/02/05/female_20260205224247A004.png\',\n \' at line 15\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'222\',\n            \'/profile/upload/2026/02/05/female_20260205224247A004.png\',\n \' at line 15',
        '2026-02-05 22:42:55', 6796);
INSERT INTO `sys_oper_log`
VALUES (328, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205224243A003.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:42:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":212,\"email\":\"222@qq.com\",\"employeeNo\":\"22222\",\"loginIp\":\"\",\"nickName\":\"222\",\"orgId\":212,\"params\":{},\"phonenumber\":\"222\",\"position\":\"222\",\"remark\":\"222\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/female_20260205224247A004.png\",\"status\":\"0\",\"unit\":\"222\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"222\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:45:21', 2314);
INSERT INTO `sys_oper_log`
VALUES (329, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205224243A003.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:42:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":212,\"deptName\":\"科技有限公司\",\"params\":{},\"parentId\":0},\"deptId\":212,\"email\":\"222@qq.com\",\"employeeNo\":\"22222\",\"loginIp\":\"\",\"nickName\":\"222\",\"orgId\":212,\"params\":{},\"phonenumber\":\"222\",\"position\":\"222\",\"remark\":\"222\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/female_20260205224247A004.png\",\"status\":\"0\",\"unit\":\"222\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"222\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:46:38', 37355);
INSERT INTO `sys_oper_log`
VALUES (330, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"/profile/upload/2026/02/05/female_20260205224243A003.png\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 22:42:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":212,\"deptName\":\"科技有限公司\",\"params\":{},\"parentId\":0},\"deptId\":212,\"email\":\"222@qq.com\",\"employeeNo\":\"22222\",\"loginIp\":\"\",\"nickName\":\"222\",\"orgId\":212,\"params\":{},\"phonenumber\":\"222\",\"position\":\"222\",\"remark\":\"222\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"sign\":\"/profile/upload/2026/02/05/female_20260205224247A004.png\",\"status\":\"0\",\"unit\":\"222\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"222\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:48:08', 3285);
INSERT INTO `sys_oper_log`
VALUES (331, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user/resetPwd', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}',
        0, NULL, '2026-02-05 22:49:39', 227);
INSERT INTO `sys_oper_log`
VALUES (332, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/user/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-05 22:53:34', 25);
INSERT INTO `sys_oper_log`
VALUES (333, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"employeeNo\":\"001\",\"nickName\":\"参会人员1\",\"orgId\":100,\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":108,\"userName\":\"参会人员1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 22:53:55', 170);
INSERT INTO `sys_oper_log`
VALUES (334, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/book_20260205153324A001.png\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2018-2025 RuoYi. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"副标题\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-05 23:04:16\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 23:04:16', 32);
INSERT INTO `sys_oper_log`
VALUES (335, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/book_20260205153324A001.png\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 RuoYi. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"v1.0.0\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-05 23:26:21\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 23:26:21', 31);
INSERT INTO `sys_oper_log`
VALUES (336, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/background_20260205232636A001.jpg\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 RuoYi. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"v1.0.0\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-05 23:26:36\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 23:26:36', 14);
INSERT INTO `sys_oper_log`
VALUES (337, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/background_20260205232636A001.jpg\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 RuoYi. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"无纸化会议系统副标题\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-05 23:57:18\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-05 23:57:18', 18);
INSERT INTO `sys_oper_log`
VALUES (338, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/background_20260205232636A001.jpg\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 Mredust. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"v1.0.0\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-06 00:00:02\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:00:02', 22);
INSERT INTO `sys_oper_log`
VALUES (339, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/background_20260205232636A001.jpg\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 Mredust. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"v1.0.0\",\"title\":\"无纸化会议系统无纸化会议系统\",\"updateTime\":\"2026-02-06 00:13:14\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:13:14', 23);
INSERT INTO `sys_oper_log`
VALUES (340, '登录页', 2, 'com.ruoyi.ipms.controller.LoginPageController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/page', '127.0.0.1', '内网IP',
        '{\"backgroundImage\":\"/profile/upload/2026/02/05/background_20260205232636A001.jpg\",\"createTime\":\"2026-02-05 15:29:34\",\"footer\":\"Copyright © 2025-2030 Mredust. All Rights Reserved.\",\"id\":1,\"params\":{},\"subtitle\":\"v1.0.0\",\"title\":\"无纸化会议系统\",\"updateTime\":\"2026-02-06 00:13:36\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:13:36', 17);
INSERT INTO `sys_oper_log`
VALUES (341, '会议功能', 1, 'com.ruoyi.ipms.controller.MeetingFeatureController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"rgba(249, 249, 249, 1)\",\"createTime\":\"2026-02-06 00:23:48\",\"params\":{}}', NULL, 1,
        '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'color\' at row 1\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\ipms\\MeetingFeatureMapper.xml]\r\n### The error may involve com.ruoyi.ipms.mapper.MeetingFeatureMapper.insertMeetingFeature-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into meeting_feature          ( color,             create_time )           values ( ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'color\' at row 1\n; Data truncation: Data too long for column \'color\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'color\' at row 1',
        '2026-02-06 00:23:48', 58);
INSERT INTO `sys_oper_log`
VALUES (342, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"rgba(17, 17, 17, 1)\",\"createTime\":\"2026-02-05 14:33:08\",\"featureAlias\":\"tongping\",\"featureName\":\"终端同屏\",\"id\":1,\"params\":{},\"sortOrder\":1,\"updateTime\":\"2026-02-06 00:24:40\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:24:40', 11);
INSERT INTO `sys_oper_log`
VALUES (343, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#E11414\",\"createTime\":\"2026-02-05 14:33:08\",\"featureAlias\":\"tongping\",\"featureName\":\"终端同屏\",\"id\":1,\"params\":{},\"sortOrder\":1,\"updateTime\":\"2026-02-06 00:26:53\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:26:53', 19);
INSERT INTO `sys_oper_log`
VALUES (344, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:33:08\",\"featureAlias\":\"tongping\",\"featureName\":\"终端同屏\",\"id\":1,\"params\":{},\"sortOrder\":1,\"updateTime\":\"2026-02-06 00:26:59\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:26:59', 22);
INSERT INTO `sys_oper_log`
VALUES (345, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:04\",\"featureAlias\":\"qiehuan\",\"featureName\":\"切换界面\",\"id\":2,\"params\":{},\"sortOrder\":2,\"updateTime\":\"2026-02-06 00:27:06\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 00:27:06', 18);
INSERT INTO `sys_oper_log`
VALUES (346, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:28\",\"featureAlias\":\"toupiaobiaojue\",\"featureName\":\"投票表决\",\"id\":4,\"params\":{},\"sortOrder\":4,\"updateTime\":\"2026-02-06 11:15:12\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:12', 17);
INSERT INTO `sys_oper_log`
VALUES (347, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:16\",\"featureAlias\":\"huiyipingjia\",\"featureName\":\"会议评价\",\"id\":3,\"params\":{},\"sortOrder\":3,\"updateTime\":\"2026-02-06 11:15:15\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:15', 15);
INSERT INTO `sys_oper_log`
VALUES (348, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:46\",\"featureAlias\":\"tongzhixiaoxi\",\"featureName\":\"通知消息\",\"id\":6,\"params\":{},\"sortOrder\":6,\"updateTime\":\"2026-02-06 11:15:17\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:17', 14);
INSERT INTO `sys_oper_log`
VALUES (349, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:37\",\"featureAlias\":\"huiyifuwu\",\"featureName\":\"会议服务\",\"id\":5,\"params\":{},\"sortOrder\":5,\"updateTime\":\"2026-02-06 11:15:19\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:19', 12);
INSERT INTO `sys_oper_log`
VALUES (350, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:35:48\",\"featureAlias\":\"tencentmt\",\"featureName\":\"腾讯会议\",\"id\":12,\"params\":{},\"sortOrder\":20,\"updateTime\":\"2026-02-06 11:15:22\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:22', 16);
INSERT INTO `sys_oper_log`
VALUES (351, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:35:38\",\"featureAlias\":\"touying\",\"featureName\":\"大屏投影\",\"id\":11,\"params\":{},\"sortOrder\":11,\"updateTime\":\"2026-02-06 11:15:23\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:24', 16);
INSERT INTO `sys_oper_log`
VALUES (352, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:35:29\",\"featureAlias\":\"qianpi\",\"featureName\":\"签批\",\"id\":10,\"params\":{},\"sortOrder\":10,\"updateTime\":\"2026-02-06 11:15:26\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:26', 10);
INSERT INTO `sys_oper_log`
VALUES (353, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:35:16\",\"featureAlias\":\"waibuxinhao\",\"featureName\":\"外部信号\",\"id\":9,\"params\":{},\"sortOrder\":9,\"updateTime\":\"2026-02-06 11:15:29\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:29', 12);
INSERT INTO `sys_oper_log`
VALUES (354, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:35:06\",\"featureAlias\":\"huiyikongjian\",\"featureName\":\"会议空间\",\"id\":8,\"params\":{},\"sortOrder\":8,\"updateTime\":\"2026-02-06 11:15:31\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:31', 9);
INSERT INTO `sys_oper_log`
VALUES (355, '会议功能', 2, 'com.ruoyi.ipms.controller.MeetingFeatureController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/feature', '127.0.0.1', '内网IP',
        '{\"color\":\"#FFFFFF\",\"createTime\":\"2026-02-05 14:34:56\",\"featureAlias\":\"huiyijilu\",\"featureName\":\"会议记录\",\"id\":7,\"params\":{},\"sortOrder\":7,\"updateTime\":\"2026-02-06 11:15:33\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:15:33', 17);
INSERT INTO `sys_oper_log`
VALUES (356, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":99,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:16:24', 61);
INSERT INTO `sys_oper_log`
VALUES (357, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 11:16:30', 29);
INSERT INTO `sys_oper_log`
VALUES (358, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":214,\"deptName\":\"开发部门\",\"params\":{},\"parentId\":212},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":100,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 12:31:43', 58);
INSERT INTO `sys_oper_log`
VALUES (359, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":214,\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":212,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 12:31:53', 36);
INSERT INTO `sys_oper_log`
VALUES (360, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":214,\"deptName\":\"开发部门\",\"params\":{},\"parentId\":212},\"deptId\":215,\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":212,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 13:11:00', 223);
INSERT INTO `sys_oper_log`
VALUES (361, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":215,\"deptName\":\"运维部门\",\"params\":{},\"parentId\":213},\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":212,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 13:15:20', 21);
INSERT INTO `sys_oper_log`
VALUES (362, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"\",\"children\":[],\"deptId\":215,\"deptName\":\"运维部门\",\"params\":{},\"parentId\":213},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":212,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 13:15:26', 23);
INSERT INTO `sys_oper_log`
VALUES (363, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-02-05 21:45:13\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"无纸化会议系统\",\"leader\":\"\",\"params\":{},\"parentId\":0},\"deptId\":100,\"email\":\"\",\"employeeNo\":\"002\",\"loginIp\":\"\",\"nickName\":\"参会人员2\",\"orgId\":100,\"params\":{},\"phonenumber\":\"\",\"roleIds\":[2,100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\"},{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"参会人员2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 13:15:30', 20);
INSERT INTO `sys_oper_log`
VALUES (364, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:01\",\"endTime\":\"2026-02-06\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":1,\"id\":1,\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"startTime\":\"2026-02-06\",\"typeId\":4}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:05:02', 78);
INSERT INTO `sys_oper_log`
VALUES (365, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-06\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,12\",\"hostId\":1,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 14:05:40\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:05:41', 21);
INSERT INTO `sys_oper_log`
VALUES (366, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-06\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,12\",\"hostId\":1,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 14:09:13\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:09:13', 13);
INSERT INTO `sys_oper_log`
VALUES (367, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-06\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,12\",\"hostId\":1,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 14:10:07\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:10:07', 22);
INSERT INTO `sys_oper_log`
VALUES (368, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"createTime\":\"2026-02-06 14:13:26\",\"endTime\":\"2026-02-13\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":1,\"id\":2,\"meetingName\":\"全省人民法庭工作会议\",\"params\":{},\"roomId\":2,\"scope\":\"100\",\"startTime\":\"2026-02-06\",\"typeId\":2}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:13:26', 23);
INSERT INTO `sys_oper_log`
VALUES (369, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"createTime\":\"2026-02-06 14:13:26\",\"endTime\":\"2026-02-05 14:25:04\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":1,\"id\":2,\"meetingName\":\"全省人民法庭工作会议\",\"params\":{},\"roomId\":2,\"scope\":\"100\",\"startTime\":\"2026-02-06 14:24:59\",\"typeId\":2,\"updateTime\":\"2026-02-06 14:25:10\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:25:10', 33);
INSERT INTO `sys_oper_log`
VALUES (370, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-14 10:00:00\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,12\",\"hostId\":1,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06 14:25:15\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 14:25:27\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 14:25:27', 20);
INSERT INTO `sys_oper_log`
VALUES (371, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 15:11:53\",\"endTime\":\"2026-02-06 12:00:00\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":108,\"id\":3,\"meetingName\":\"2025全国石油行业经济形势分析会\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"startTime\":\"2026-02-01 10:00:00\",\"typeId\":5}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:11:53', 98);
INSERT INTO `sys_oper_log`
VALUES (372, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 15:12:33\",\"endTime\":\"2026-02-07 15:12:15\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11\",\"hostId\":108,\"id\":4,\"meetingName\":\"公安厅2025年下半年工作总结\",\"params\":{},\"roomId\":5,\"scope\":\"100\",\"startTime\":\"2026-02-06 15:12:13\",\"typeId\":3}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:12:33', 29);
INSERT INTO `sys_oper_log`
VALUES (373, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 15:13:01\",\"endTime\":\"2026-02-07 00:00:00\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11\",\"hostId\":108,\"id\":5,\"meetingName\":\"全市法院重点工作推进会\",\"params\":{},\"roomId\":3,\"scope\":\"100\",\"startTime\":\"2026-02-06 15:12:48\",\"typeId\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:13:01', 16);
INSERT INTO `sys_oper_log`
VALUES (374, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-14 10:00:00\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,12\",\"hostId\":108,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06 14:25:15\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 15:13:09\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:13:09', 24);
INSERT INTO `sys_oper_log`
VALUES (375, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:13:26\",\"endTime\":\"2026-02-05 14:25:04\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":108,\"id\":2,\"meetingName\":\"全省人民法庭工作会议\",\"params\":{},\"roomId\":2,\"scope\":\"100\",\"startTime\":\"2026-02-06 14:24:59\",\"typeId\":2,\"updateTime\":\"2026-02-06 15:13:18\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:13:18', 20);
INSERT INTO `sys_oper_log`
VALUES (376, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dict/type', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"dictName\":\"会议状态\",\"dictType\":\"mt_status\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:21:45', 45);
INSERT INTO `sys_oper_log`
VALUES (377, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已结束\",\"dictSort\":0,\"dictType\":\"mt_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:22:07', 35);
INSERT INTO `sys_oper_log`
VALUES (378, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":1,\"dictType\":\"mt_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:22:23', 20);
INSERT INTO `sys_oper_log`
VALUES (379, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2026-02-06 15:22:07\",\"default\":false,\"dictCode\":113,\"dictLabel\":\"已结束\",\"dictSort\":2,\"dictType\":\"mt_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:22:30', 15);
INSERT INTO `sys_oper_log`
VALUES (380, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未发布\",\"dictSort\":0,\"dictType\":\"mt_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:22:36', 21);
INSERT INTO `sys_oper_log`
VALUES (381, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2026-02-06 15:22:22\",\"default\":false,\"dictCode\":114,\"dictLabel\":\"进行中\",\"dictSort\":1,\"dictType\":\"mt_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:22:47', 16);
INSERT INTO `sys_oper_log`
VALUES (382, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2026-02-06 15:22:36\",\"default\":false,\"dictCode\":115,\"dictLabel\":\"未发布\",\"dictSort\":0,\"dictType\":\"mt_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:23:12', 22);
INSERT INTO `sys_oper_log`
VALUES (383, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/dict/data', '127.0.0.1', '内网IP',
        '{\"createBy\":\"admin\",\"createTime\":\"2026-02-06 15:22:07\",\"default\":false,\"dictCode\":113,\"dictLabel\":\"已结束\",\"dictSort\":2,\"dictType\":\"mt_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:23:17', 26);
INSERT INTO `sys_oper_log`
VALUES (384, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/synchDb/meeting', '127.0.0.1', '内网IP', '{}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:26:07', 106);
INSERT INTO `sys_oper_log`
VALUES (385, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"meeting\",\"className\":\"Meeting\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-02-06 15:26:07\",\"usableColumn\":false},{\"capJavaField\":\"Scope\",\"columnComment\":\"所属范围\",\"columnId\":28,\"columnName\":\"scope\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"scope\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-02-06 15:26:07\",\"usableColumn\":false},{\"capJavaField\":\"MeetingName\",\"columnComment\":\"会议名称\",\"columnId\":29,\"columnName\":\"meeting_name\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"meetingName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-02-06 15:26:07\",\"usableColumn\":false},{\"capJavaField\":\"Subtitle\",\"columnComment\":\"副标题\",\"columnId\":30,\"columnName\":\"subtitle\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-04 21:54:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:26:46', 90);
INSERT INTO `sys_oper_log`
VALUES (386, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"meeting\"}', NULL, 0, NULL,
        '2026-02-06 15:26:51', 496);
INSERT INTO `sys_oper_log`
VALUES (387, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":100,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:39:11', 53);
INSERT INTO `sys_oper_log`
VALUES (388, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/role', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"createTime\":\"2026-02-05 11:06:51\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2007,2008,2009,2010,2011,2012,1,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,2025,2026,2027,2028,2029,2030,2019,2020,2021,2022,2023,2024,2031,2032,2033,2034,2035,2036,2001,2002,2003,2004,2005,2006,105,1025,1026,1027,1028,1029,102,1012,1013,1014,1015,106,1030,1031,1032,1033,1034,101,1007,1008,1009,1010,1011,2050,107,1035,1036,1037,1038,2043,2044,2045,2046,2047,2048,116,1055,1056,1057,1058,1059,1060],\"params\":{},\"roleId\":100,\"roleKey\":\"bc-admin\",\"roleName\":\"后台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:39:24', 74);
INSERT INTO `sys_oper_log`
VALUES (389, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":1,\"createTime\":\"2026-02-06 15:46:49\",\"id\":1,\"params\":{},\"showSwitch\":1,\"voteMode\":\"0\",\"voteTitle\":\"电脑采购\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:46:49', 32);
INSERT INTO `sys_oper_log`
VALUES (390, '投票', 2, 'com.ruoyi.ipms.controller.VoteController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":1,\"createTime\":\"2026-02-06 15:46:50\",\"id\":1,\"params\":{},\"remark\":\"5000一台\",\"showSwitch\":1,\"updateTime\":\"2026-02-06 15:57:14\",\"voteMode\":\"0\",\"voteTitle\":\"电脑采购\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 15:57:14', 13);
INSERT INTO `sys_oper_log`
VALUES (391, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"createTime\":\"2026-02-06 14:05:02\",\"endTime\":\"2026-02-14 10:00:00\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11\",\"hostId\":108,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06 14:25:15\",\"status\":0,\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 16:08:33\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:08:33', 52);
INSERT INTO `sys_oper_log`
VALUES (392, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议信息\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"path\":\"mt-info\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:10:23', 26);
INSERT INTO `sys_oper_log`
VALUES (393, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"参会人员\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2050,\"path\":\"mt-join-user\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:10:55', 15);
INSERT INTO `sys_oper_log`
VALUES (394, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议议程\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":2050,\"path\":\"mt-agenda\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:11:53', 25);
INSERT INTO `sys_oper_log`
VALUES (395, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2025-06-24 22:47:50\",\"icon\":\"提醒\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知消息\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2050,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:12:07', 16);
INSERT INTO `sys_oper_log`
VALUES (396, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议资料\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":2050,\"path\":\"mt-file\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:12:33', 23);
INSERT INTO `sys_oper_log`
VALUES (397, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会议纪要\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":2050,\"path\":\"mt-minutes\",\"status\":\"0\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:13:02', 28);
INSERT INTO `sys_oper_log`
VALUES (398, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/vote/index\",\"createTime\":\"2026-02-05 11:27:45\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"会议投票\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2050,\"path\":\"vote\",\"perms\":\"ipms:vote:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:13:34', 22);
INSERT INTO `sys_oper_log`
VALUES (399, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/system/menu/2054', '127.0.0.1', '内网IP', '2054', '{\"msg\":\"操作成功\",\"code\":200}', 0,
        NULL, '2026-02-06 16:53:15', 30);
INSERT INTO `sys_oper_log`
VALUES (400, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '无纸化会议系统', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"meeting_material\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:53:22', 132);
INSERT INTO `sys_oper_log`
VALUES (401, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"material\",\"className\":\"MeetingMaterial\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":169,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 16:53:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileName\",\"columnComment\":\"文件名称\",\"columnId\":170,\"columnName\":\"file_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 16:53:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"fileName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileType\",\"columnComment\":\"文件类型\",\"columnId\":171,\"columnName\":\"file_type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 16:53:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"fileType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FileSize\",\"columnComment\":\"文件大小(KB)\",\"columnId\":172,\"columnName\":\"file_size\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 16:53:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isR',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:54:48', 90);
INSERT INTO `sys_oper_log`
VALUES (402, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"meeting_material\"}', NULL, 0,
        NULL, '2026-02-06 16:54:54', 282);
INSERT INTO `sys_oper_log`
VALUES (403, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/material/index\",\"createTime\":\"2026-02-06 16:58:05\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2056,\"menuName\":\"会议资料\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2050,\"path\":\"material\",\"perms\":\"ipms:material:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 16:58:42', 48);
INSERT INTO `sys_oper_log`
VALUES (404, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传文件不能为空\",\"code\":500}', 0,
        NULL, '2026-02-06 17:19:21', 5);
INSERT INTO `sys_oper_log`
VALUES (405, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传文件不能为空\",\"code\":500}', 0,
        NULL, '2026-02-06 17:21:37', 16);
INSERT INTO `sys_oper_log`
VALUES (406, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传文件不能为空\",\"code\":500}', 0,
        NULL, '2026-02-06 17:21:39', 0);
INSERT INTO `sys_oper_log`
VALUES (407, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传文件不能为空\",\"code\":500}', 0,
        NULL, '2026-02-06 17:21:55', 1);
INSERT INTO `sys_oper_log`
VALUES (408, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '', '{\"msg\":\"上传文件不能为空\",\"code\":500}', 0,
        NULL, '2026-02-06 17:23:07', 35474);
INSERT INTO `sys_oper_log`
VALUES (409, '会议资料', 1, 'com.ruoyi.ipms.controller.MeetingMaterialController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/material', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"createTime\":\"2026-02-06 17:24:07\",\"fileName\":\"新建 DOCX 文档.docx\",\"fileSize\":0.00,\"fileSort\":0,\"fileType\":\"docx\",\"id\":1,\"openDownload\":\"http://localhost:4040/profile/upload/2026/02/06/新建 DOCX 文档_20260206172407A001.docx\",\"params\":{}}}',
        0, NULL, '2026-02-06 17:24:08', 6576);
INSERT INTO `sys_oper_log`
VALUES (410, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin',
        '无纸化会议系统', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '',
        '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/02/06/255e773109ee403f922afc1b974a882b.png\",\"code\":200}',
        0, NULL, '2026-02-06 18:02:49', 22);
INSERT INTO `sys_oper_log`
VALUES (411, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/user/profile', '127.0.0.1', '内网IP',
        '{\"admin\":false,\"email\":\"admin@163.com\",\"nickName\":\"系统管理员\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 18:03:09', 24);
INSERT INTO `sys_oper_log`
VALUES (412, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-06 19:49:56\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 19:49:56', 39);
INSERT INTO `sys_oper_log`
VALUES (413, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":1,\"updateTime\":\"2026-02-06 19:50:03\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 19:50:03', 18);
INSERT INTO `sys_oper_log`
VALUES (414, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-06 19:50:10\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 19:50:10', 21);
INSERT INTO `sys_oper_log`
VALUES (415, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":0,\"updateTime\":\"2026-02-06 19:50:12\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 19:50:12', 10);
INSERT INTO `sys_oper_log`
VALUES (416, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-06 22:27:21\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:27:21', 31);
INSERT INTO `sys_oper_log`
VALUES (417, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"status\":1,\"updateTime\":\"2026-02-06 22:27:32\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:27:32', 20);
INSERT INTO `sys_oper_log`
VALUES (418, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":108,\"endTime\":\"2026-02-14 10:00:00\",\"featureSelect\":\"1,2,3,4,5,7,9,10,11,8\",\"hostId\":102,\"id\":1,\"logo\":\"/profile/upload/2026/02/06/ui_20260206140534A001.png\",\"meetingName\":\"省人大第八次会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/06/login-bg-admin_20260206140538A002.jpg\",\"startTime\":\"2026-02-06 14:25:15\",\"subtitle\":\"副标题测试\",\"typeId\":4,\"updateTime\":\"2026-02-06 22:28:51\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:28:51', 17);
INSERT INTO `sys_oper_log`
VALUES (419, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"createTime\":\"2026-02-06 22:29:28\",\"endTime\":\"2026-02-21 00:00:00\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11,12\",\"hostId\":1,\"id\":6,\"meetingName\":\"测试会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"startTime\":\"2026-02-06 22:29:13\",\"subtitle\":\"测试会议副标题\",\"typeId\":3}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:29:28', 29);
INSERT INTO `sys_oper_log`
VALUES (420, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"endTime\":\"2026-02-21 00:00:00\",\"featureSelect\":\"1,2,3,4,6,7,8,9,10,11,5\",\"hostId\":1,\"id\":6,\"meetingName\":\"测试会议2\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"startTime\":\"2026-02-06 22:29:13\",\"subtitle\":\"测试会议副标题2\",\"typeId\":3,\"updateTime\":\"2026-02-06 22:29:47\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:29:47', 13);
INSERT INTO `sys_oper_log`
VALUES (421, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"endTime\":\"2026-02-21 00:00:00\",\"featureSelect\":\"1,2,3,4,6,7,8,9,10,11,5\",\"hostId\":1,\"id\":6,\"meetingName\":\"测试会议2\",\"params\":{},\"roomId\":2,\"scope\":\"100\",\"startTime\":\"2026-02-06 22:29:13\",\"subtitle\":\"测试会议副标题2\",\"typeId\":4,\"updateTime\":\"2026-02-06 22:29:57\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:29:57', 16);
INSERT INTO `sys_oper_log`
VALUES (422, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '无纸化会议系统', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"image\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:33:14', 118);
INSERT INTO `sys_oper_log`
VALUES (423, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"image\",\"className\":\"Image\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":176,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 22:33:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Url\",\"columnComment\":\"链接\",\"columnId\":177,\"columnName\":\"url\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 22:33:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"url\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"类型\",\"columnId\":178,\"columnName\":\"type\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 22:33:14\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":179,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2026-02-06 22:33:14\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\"',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:33:55', 59);
INSERT INTO `sys_oper_log`
VALUES (424, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"image\"}', NULL, 0, NULL,
        '2026-02-06 22:34:00', 387);
INSERT INTO `sys_oper_log`
VALUES (425, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/image/index\",\"createTime\":\"2026-02-06 22:34:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2062,\"menuName\":\"图片管理\",\"menuType\":\"C\",\"orderNum\":97,\"params\":{},\"parentId\":1,\"path\":\"image\",\"perms\":\"ipms:image:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 22:35:34', 68);
INSERT INTO `sys_oper_log`
VALUES (426, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:36:58\",\"id\":1,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/1_20260206233655A002.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:36:58', 73);
INSERT INTO `sys_oper_log`
VALUES (427, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:05\",\"id\":2,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/2_20260206233803A003.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:05', 13);
INSERT INTO `sys_oper_log`
VALUES (428, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:18\",\"id\":3,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/3_20260206233813A004.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:18', 520);
INSERT INTO `sys_oper_log`
VALUES (429, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:23\",\"id\":4,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/4_20260206233822A005.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:24', 18);
INSERT INTO `sys_oper_log`
VALUES (430, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:29\",\"id\":5,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/5_20260206233828A006.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:29', 18);
INSERT INTO `sys_oper_log`
VALUES (431, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:38\",\"id\":6,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/6_20260206233836A007.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:38', 11);
INSERT INTO `sys_oper_log`
VALUES (432, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:45\",\"id\":7,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/7_20260206233843A008.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:45', 11);
INSERT INTO `sys_oper_log`
VALUES (433, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:38:53\",\"id\":8,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/8_20260206233852A009.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:38:53', 22);
INSERT INTO `sys_oper_log`
VALUES (434, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:39:00\",\"id\":9,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/9_20260206233857A010.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:39:00', 18);
INSERT INTO `sys_oper_log`
VALUES (435, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:39:07\",\"id\":10,\"isSystem\":0,\"params\":{},\"type\":\"pad\",\"url\":\"/profile/upload/2026/02/06/10_20260206233906A011.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:39:07', 20);
INSERT INTO `sys_oper_log`
VALUES (436, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:10\",\"id\":11,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/1_20260206234008A012.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:10', 20);
INSERT INTO `sys_oper_log`
VALUES (437, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:22\",\"id\":12,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/2_20260206234019A013.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:22', 17);
INSERT INTO `sys_oper_log`
VALUES (438, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:28\",\"id\":13,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/3_20260206234026A014.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:28', 18);
INSERT INTO `sys_oper_log`
VALUES (439, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:35\",\"id\":14,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/4_20260206234032A015.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:35', 19);
INSERT INTO `sys_oper_log`
VALUES (440, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:42\",\"id\":15,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/6_20260206234040A016.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:42', 21);
INSERT INTO `sys_oper_log`
VALUES (441, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:50\",\"id\":16,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/7_20260206234048A017.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:50', 14);
INSERT INTO `sys_oper_log`
VALUES (442, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:40:58\",\"id\":17,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/8_20260206234056A018.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:40:58', 18);
INSERT INTO `sys_oper_log`
VALUES (443, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:05\",\"id\":18,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/9_20260206234103A019.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:05', 19);
INSERT INTO `sys_oper_log`
VALUES (444, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:11\",\"id\":19,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/background_01_20260206234109A020.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:11', 19);
INSERT INTO `sys_oper_log`
VALUES (445, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:16\",\"id\":20,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/background_02_20260206234115A021.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:17', 128);
INSERT INTO `sys_oper_log`
VALUES (446, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:24\",\"id\":21,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/background_03_20260206234122A022.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:24', 19);
INSERT INTO `sys_oper_log`
VALUES (447, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:30\",\"id\":22,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/background_04_20260206234129A023.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:30', 21);
INSERT INTO `sys_oper_log`
VALUES (448, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:41:37\",\"id\":23,\"isSystem\":0,\"params\":{},\"type\":\"web\",\"url\":\"/profile/upload/2026/02/06/background_05_20260206234136A024.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:41:38', 19);
INSERT INTO `sys_oper_log`
VALUES (449, '图片', 1, 'com.ruoyi.ipms.controller.ImageController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/image', '127.0.0.1', '内网IP',
        '{\"createTime\":\"2026-02-06 23:43:06\",\"id\":24,\"isSystem\":0,\"params\":{},\"type\":\"other\",\"url\":\"/profile/upload/2026/02/06/it-bg2_20260206234304A025.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:43:06', 20);
INSERT INTO `sys_oper_log`
VALUES (450, '投票', 2, 'com.ruoyi.ipms.controller.VoteController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-06 15:46:50\",\"id\":1,\"params\":{},\"remark\":\"5000一台\",\"showSwitch\":1,\"updateTime\":\"2026-02-06 23:44:19\",\"voteMode\":\"0\",\"voteTitle\":\"电脑采购\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:44:19', 36);
INSERT INTO `sys_oper_log`
VALUES (451, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-06 23:44:43\",\"id\":2,\"params\":{},\"showSwitch\":1,\"voteMode\":\"1\",\"voteTitle\":\"测试投票二\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:44:43', 20);
INSERT INTO `sys_oper_log`
VALUES (452, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"component\":\"ipms/image/index\",\"createTime\":\"2026-02-06 22:34:42\",\"icon\":\"图片\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2062,\"menuName\":\"图片管理\",\"menuType\":\"C\",\"orderNum\":97,\"params\":{},\"parentId\":1,\"path\":\"image\",\"perms\":\"ipms:image:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:46:35', 25);
INSERT INTO `sys_oper_log`
VALUES (453, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2026-02-05 15:26:41\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"无纸化会议系统\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"mt\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-06 23:46:42', 14);
INSERT INTO `sys_oper_log`
VALUES (454, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 10:11:13\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 10:11:13', 46);
INSERT INTO `sys_oper_log`
VALUES (455, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"status\":1,\"updateTime\":\"2026-02-07 10:11:21\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 10:11:21', 18);
INSERT INTO `sys_oper_log`
VALUES (456, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 10:11:31\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 10:11:31', 23);
INSERT INTO `sys_oper_log`
VALUES (457, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"endTime\":\"2026-02-21 00:00:00\",\"featureSelect\":\"1,2,3,4,6,7,8,9,10,11,5\",\"hostId\":1,\"id\":6,\"meetingName\":\"测试会议2\",\"params\":{},\"roomId\":2,\"scope\":\"100\",\"seatChart\":\"/profile/upload/2026/02/07/book_20260207101251A026.png\",\"startTime\":\"2026-02-06 22:29:13\",\"subtitle\":\"测试会议副标题2\",\"typeId\":4,\"updateTime\":\"2026-02-07 10:12:52\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 10:12:52', 21);
INSERT INTO `sys_oper_log`
VALUES (458, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/system/menu', '127.0.0.1', '内网IP',
        '{\"children\":[],\"createTime\":\"2026-02-05 15:26:41\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2050,\"menuName\":\"无纸化会议系统\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"mt\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 10:56:52', 26);
INSERT INTO `sys_oper_log`
VALUES (459, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"status\":0,\"updateTime\":\"2026-02-07 11:02:05\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 11:02:05', 29);
INSERT INTO `sys_oper_log`
VALUES (460, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '无纸化会议系统', '/tool/gen/importTable', '127.0.0.1', '内网IP',
        '{\"tables\":\"meeting_user_rel,meeting_slogan\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 11:27:27', 91);
INSERT INTO `sys_oper_log`
VALUES (461, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin',
        '无纸化会议系统', '/tool/gen/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 11:27:43', 29);
INSERT INTO `sys_oper_log`
VALUES (462, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin',
        '无纸化会议系统', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"meeting_agenda\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 11:27:49', 30);
INSERT INTO `sys_oper_log`
VALUES (463, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"rel\",\"className\":\"MeetingUserRel\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":190,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MeetingId\",\"columnComment\":\"会议ID\",\"columnId\":191,\"columnName\":\"meeting_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"meetingId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserIds\",\"columnComment\":\"用户id列表（JSON数组格式）\",\"columnId\":192,\"columnName\":\"user_ids\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userIds\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":19,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"Mredust\",\"functionName\":\"会议-参会人员关联\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"ipms\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.ipms\",\"params\":{},\"sub\":false,\"tableComment\":\"会议-参会人员关联表\",\"tableId\":19,\"tableName\":\"meeting_user_rel\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 11:28:22', 76);
INSERT INTO `sys_oper_log`
VALUES (464, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"slogan\",\"className\":\"MeetingSlogan\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":181,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"WelcomeText\",\"columnComment\":\"欢迎语\",\"columnId\":182,\"columnName\":\"welcome_text\",\"columnType\":\"varchar(500)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"welcomeText\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MainTitleFont\",\"columnComment\":\"主标题字体\",\"columnId\":183,\"columnName\":\"main_title_font\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mainTitleFont\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MainTitleColor\",\"columnComment\":\"主标题颜色\",\"columnId\":184,\"columnName\":\"main_title_color\",\"columnType\":\"varchar(7)\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 11:28:41', 45);
INSERT INTO `sys_oper_log`
VALUES (465, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/tool/gen', '127.0.0.1', '内网IP',
        '{\"businessName\":\"agenda\",\"className\":\"MeetingAgenda\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":193,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TextJson\",\"columnComment\":\"议程JSON数据\",\"columnId\":194,\"columnName\":\"text_json\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2026-02-07 11:27:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"textJson\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":20,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"Mredust\",\"functionName\":\"会议议程\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"ipms\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.ipms\",\"params\":{},\"sub\":false,\"tableComment\":\"会议议程表\",\"tableId\":20,\"tableName\":\"meeting_agenda\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 11:28:59', 34);
INSERT INTO `sys_oper_log`
VALUES (466, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin',
        '无纸化会议系统', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP',
        '{\"tables\":\"meeting_agenda,meeting_slogan,meeting_user_rel\"}', NULL, 0, NULL, '2026-02-07 11:29:08', 462);
INSERT INTO `sys_oper_log`
VALUES (467, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"padBgUrl\":\"/profile/upload/2026/02/06/3_20260206233813A004.jpg\",\"params\":{},\"updateTime\":\"2026-02-07 12:22:19\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:22:19', 55);
INSERT INTO `sys_oper_log`
VALUES (468, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"updateTime\":\"2026-02-07 12:22:28\",\"webBgUrl\":\"/profile/upload/2026/02/06/3_20260206234026A014.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:22:28', 19);
INSERT INTO `sys_oper_log`
VALUES (469, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"padBgUrl\":\"/profile/upload/2026/02/06/7_20260206233843A008.jpg\",\"params\":{},\"updateTime\":\"2026-02-07 12:22:44\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:22:44', 11);
INSERT INTO `sys_oper_log`
VALUES (470, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"updateTime\":\"2026-02-07 12:22:47\",\"webBgUrl\":\"/profile/upload/2026/02/06/background_02_20260206234115A021.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:22:47', 19);
INSERT INTO `sys_oper_log`
VALUES (471, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":6,\"params\":{},\"updateTime\":\"2026-02-07 12:22:48\",\"webBgUrl\":\"/profile/upload/2026/02/06/6_20260206234040A016.jpg\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:22:48', 11);
INSERT INTO `sys_oper_log`
VALUES (472, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"assistantId\":1,\"createTime\":\"2026-02-07 12:25:41\",\"endTime\":\"2026-02-08 00:00:00\",\"featureSelect\":\"1,2,3,4,5,6,7,8,9,10,11\",\"hostId\":1,\"id\":7,\"meetingName\":\"测试会议\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"sloganId\":1,\"startTime\":\"2026-02-07 12:25:29\",\"typeId\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:25:41', 35);
INSERT INTO `sys_oper_log`
VALUES (473, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"padBgUrl\":\"/profile/upload/2026/02/06/3_20260206233813A004.jpg\",\"params\":{},\"updateTime\":\"2026-02-07 12:27:40\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:27:40', 13);
INSERT INTO `sys_oper_log`
VALUES (474, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"updateTime\":\"2026-02-07 12:27:41\",\"webBgUrl\":\"/profile/upload/2026/02/06/3_20260206234026A014.png\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:27:41', 10);
INSERT INTO `sys_oper_log`
VALUES (475, '会议-参会人员关联', 1, 'com.ruoyi.ipms.controller.MeetingUserRelController.add()', 'POST', 1, 'admin',
        '无纸化会议系统', '/ipms/rel', '127.0.0.1', '内网IP',
        '{\"id\":1,\"meetingId\":7,\"params\":{},\"userIds\":\"[1,102,103,104,105,106,107,108]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:30:15', 25);
INSERT INTO `sys_oper_log`
VALUES (476, '会议-参会人员关联', 2, 'com.ruoyi.ipms.controller.MeetingUserRelController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/rel', '127.0.0.1', '内网IP',
        '{\"id\":1,\"meetingId\":7,\"params\":{},\"userIds\":\"[103,104,105,106,107,108]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:30:24', 21);
INSERT INTO `sys_oper_log`
VALUES (477, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 12:41:26\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:41:26', 39);
INSERT INTO `sys_oper_log`
VALUES (478, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":1,\"updateTime\":\"2026-02-07 12:41:29\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:41:29', 114);
INSERT INTO `sys_oper_log`
VALUES (479, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 12:41:30\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:41:31', 31);
INSERT INTO `sys_oper_log`
VALUES (480, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":0,\"updateTime\":\"2026-02-07 12:41:32\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 12:41:32', 17);
INSERT INTO `sys_oper_log`
VALUES (481, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 14:03:23\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:03:23', 49);
INSERT INTO `sys_oper_log`
VALUES (482, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":1,\"updateTime\":\"2026-02-07 14:03:24\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:03:24', 13);
INSERT INTO `sys_oper_log`
VALUES (483, '会议', 2, 'com.ruoyi.ipms.controller.MeetingController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"id\":7,\"params\":{},\"status\":2,\"updateTime\":\"2026-02-07 14:03:25\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:03:25', 21);
INSERT INTO `sys_oper_log`
VALUES (484, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":1,\"createTime\":\"2026-02-07 14:03:51\",\"id\":3,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"0\",\"voteRes\":\"{}\",\"voteTitle\":\"投票模式1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:03:51', 34);
INSERT INTO `sys_oper_log`
VALUES (485, '投票', 2, 'com.ruoyi.ipms.controller.VoteController.edit()', 'PUT', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:03:51\",\"id\":3,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"updateTime\":\"2026-02-07 14:03:58\",\"voteMode\":\"0\",\"voteRes\":\"{}\",\"voteTitle\":\"投票模式1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:03:58', 24);
INSERT INTO `sys_oper_log`
VALUES (486, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:04:31\",\"id\":4,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"1\",\"voteRes\":\"{\\\"赞成\\\":0,\\\"反对\\\":0,\\\"弃权\\\":0}\",\"voteTitle\":\"投票模式2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:04:31', 39);
INSERT INTO `sys_oper_log`
VALUES (487, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:05:00\",\"id\":5,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"2\",\"voteRes\":\"{\\\"赞成\\\":0,\\\"反对\\\":0}\",\"voteTitle\":\"投票自定义\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:05:00', 32);
INSERT INTO `sys_oper_log`
VALUES (488, '投票', 3, 'com.ruoyi.ipms.controller.VoteController.remove()', 'DELETE', 1, 'admin', '无纸化会议系统',
        '/ipms/vote/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 14:35:21', 52);
INSERT INTO `sys_oper_log`
VALUES (489, '投票', 3, 'com.ruoyi.ipms.controller.VoteController.remove()', 'DELETE', 1, 'admin', '无纸化会议系统',
        '/ipms/vote/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 14:35:23', 41);
INSERT INTO `sys_oper_log`
VALUES (490, '投票', 3, 'com.ruoyi.ipms.controller.VoteController.remove()', 'DELETE', 1, 'admin', '无纸化会议系统',
        '/ipms/vote/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 14:35:24', 25);
INSERT INTO `sys_oper_log`
VALUES (491, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:35:31\",\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"0\",\"voteRes\":\"{}\"}',
        NULL, 1,
        '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'vote_title\' doesn\'t have a default value\r\n### The error may exist in file [F:\\order\\智能无纸化会议系统\\ipms\\backend-init\\target\\classes\\mapper\\ipms\\VoteMapper.xml]\r\n### The error may involve com.ruoyi.ipms.mapper.VoteMapper.insertVote-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into vote          ( vote_res,             vote_mode,             show_switch,             anonymous_switch,                          create_time )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'vote_title\' doesn\'t have a default value\n; Field \'vote_title\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'vote_title\' doesn\'t have a default value',
        '2026-02-07 14:35:31', 21);
INSERT INTO `sys_oper_log`
VALUES (492, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:36:40\",\"id\":6,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"0\",\"voteRes\":\"{}\",\"voteTitle\":\"测试投票1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:36:40', 32);
INSERT INTO `sys_oper_log`
VALUES (493, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:37:01\",\"id\":7,\"meetingId\":7,\"params\":{},\"showSwitch\":1,\"voteMode\":\"1\",\"voteRes\":\"{\\\"赞成\\\":0,\\\"反对\\\":0,\\\"弃权\\\":0}\",\"voteTitle\":\"2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:37:01', 34);
INSERT INTO `sys_oper_log`
VALUES (494, '会议', 3, 'com.ruoyi.ipms.controller.MeetingController.remove()', 'DELETE', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting/7', '127.0.0.1', '内网IP', '[7]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL,
        '2026-02-07 14:37:31', 14);
INSERT INTO `sys_oper_log`
VALUES (495, '会议', 1, 'com.ruoyi.ipms.controller.MeetingController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/meeting', '127.0.0.1', '内网IP',
        '{\"agendaId\":1,\"createTime\":\"2026-02-07 14:37:57\",\"endTime\":\"2026-02-08 00:00:00\",\"featureSelect\":\"\",\"hostId\":1,\"id\":8,\"meetingName\":\"测试\",\"params\":{},\"roomId\":1,\"scope\":\"100\",\"sloganId\":2,\"startTime\":\"2026-02-07 14:37:46\",\"typeId\":1}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:37:57', 56);
INSERT INTO `sys_oper_log`
VALUES (496, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"\\\",\\\"mainFile\\\":\\\"\\\",\\\"mainFileName\\\":\\\"\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:38:14', 37);
INSERT INTO `sys_oper_log`
VALUES (497, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"测试议题名称\\\",\\\"mainFile\\\":\\\"\\\",\\\"mainFileName\\\":\\\"\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:38:33', 10);
INSERT INTO `sys_oper_log`
VALUES (498, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"测试议题名称\\\",\\\"mainFile\\\":\\\"/profile/upload/2026/02/07/测试文档_20260207143834A001.docx\\\",\\\"mainFileName\\\":\\\"测试文档.docx\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:38:35', 18);
INSERT INTO `sys_oper_log`
VALUES (499, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"测试议题名称\\\",\\\"mainFile\\\":\\\"/profile/upload/2026/02/07/测试文档_20260207143834A001.docx\\\",\\\"mainFileName\\\":\\\"测试文档.docx\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[{\\\"key\\\":\\\"extra_1_1770446467853\\\",\\\"label\\\":\\\"自定义列\\\",\\\"value\\\":\\\"测试列\\\"}]},{\\\"topicNo\\\":2,\\\"topicName\\\":\\\"测试行\\\",\\\"mainFile\\\":\\\"\\\",\\\"mainFileName\\\":\\\"\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[{\\\"key\\\":\\\"extra_1_1770446467853\\\",\\\"label\\\":\\\"自定义列\\\",\\\"value\\\":\\\"\\\"}]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:41:29', 13);
INSERT INTO `sys_oper_log`
VALUES (500, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"测试议题名称\\\",\\\"mainFile\\\":\\\"/profile/upload/2026/02/07/测试文档_20260207143834A001.docx\\\",\\\"mainFileName\\\":\\\"测试文档.docx\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:42:18', 21);
INSERT INTO `sys_oper_log`
VALUES (501, '会议议程', 2, 'com.ruoyi.ipms.controller.MeetingAgendaController.edit()', 'PUT', 1, 'admin',
        '无纸化会议系统', '/ipms/agenda', '127.0.0.1', '内网IP',
        '{\"id\":1,\"params\":{},\"textJson\":\"[{\\\"topicNo\\\":1,\\\"topicName\\\":\\\"测试议题名称\\\",\\\"mainFile\\\":\\\"/profile/upload/2026/02/07/测试文档_20260207143834A001.docx\\\",\\\"mainFileName\\\":\\\"测试文档.docx\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]},{\\\"topicNo\\\":2,\\\"topicName\\\":\\\"\\\",\\\"mainFile\\\":\\\"\\\",\\\"mainFileName\\\":\\\"\\\",\\\"attachmentIds\\\":[],\\\"memberIds\\\":[],\\\"ext_col\\\":[]}]\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:45:09', 23);
INSERT INTO `sys_oper_log`
VALUES (502, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:47:39\",\"id\":8,\"meetingId\":8,\"params\":{},\"showSwitch\":1,\"voteMode\":\"0\",\"voteRes\":\"{}\",\"voteTitle\":\"1\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:47:39', 32);
INSERT INTO `sys_oper_log`
VALUES (503, '投票', 1, 'com.ruoyi.ipms.controller.VoteController.add()', 'POST', 1, 'admin', '无纸化会议系统',
        '/ipms/vote', '127.0.0.1', '内网IP',
        '{\"anonymousSwitch\":0,\"createTime\":\"2026-02-07 14:47:46\",\"id\":9,\"meetingId\":8,\"params\":{},\"showSwitch\":1,\"voteMode\":\"1\",\"voteRes\":\"{\\\"赞成\\\":0,\\\"反对\\\":0,\\\"弃权\\\":0}\",\"voteTitle\":\"2\"}',
        '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-02-07 14:47:46', 33);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `post_id`     bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '岗位名称',
    `post_sort`   int                                                           NOT NULL COMMENT '显示顺序',
    `status`      char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '状态（0正常 1停用）',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time` datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time` datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '部门信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`             bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `role_name`           varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名称',
    `role_key`            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
    `role_sort`           int                                                           NOT NULL COMMENT '显示顺序',
    `data_scope`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
    `menu_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
    `dept_check_strictly` tinyint(1)                                                    NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
    `status`              char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '角色状态（0正常 1停用）',
    `del_flag`            char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `create_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`         datetime                                                      NULL DEFAULT NULL COMMENT '创建时间',
    `update_by`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`         datetime                                                      NULL DEFAULT NULL COMMENT '更新时间',
    `remark`              varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 101
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '系统管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-06-24 22:47:50', '', NULL, '超级管理员');
INSERT INTO `sys_role`
VALUES (2, '普通用户', 'user', 3, '2', 1, 1, '0', '0', 'admin', '2025-06-24 22:47:50', 'admin', '2026-02-05 11:07:26',
        '普通用户');
INSERT INTO `sys_role`
VALUES (100, '后台管理员', 'bc-admin', 2, '1', 1, 1, '0', '0', 'admin', '2026-02-05 11:06:51', 'admin',
        '2026-02-06 15:39:24', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `dept_id` bigint NOT NULL COMMENT '部门ID',
    PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色和单位关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept`
VALUES (2, 100);
INSERT INTO `sys_role_dept`
VALUES (2, 101);
INSERT INTO `sys_role_dept`
VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `role_id` bigint NOT NULL COMMENT '角色ID',
    `menu_id` bigint NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu`
VALUES (2, 1);
INSERT INTO `sys_role_menu`
VALUES (2, 100);
INSERT INTO `sys_role_menu`
VALUES (2, 101);
INSERT INTO `sys_role_menu`
VALUES (2, 102);
INSERT INTO `sys_role_menu`
VALUES (2, 103);
INSERT INTO `sys_role_menu`
VALUES (2, 104);
INSERT INTO `sys_role_menu`
VALUES (2, 105);
INSERT INTO `sys_role_menu`
VALUES (2, 106);
INSERT INTO `sys_role_menu`
VALUES (2, 107);
INSERT INTO `sys_role_menu`
VALUES (2, 116);
INSERT INTO `sys_role_menu`
VALUES (2, 1000);
INSERT INTO `sys_role_menu`
VALUES (2, 1001);
INSERT INTO `sys_role_menu`
VALUES (2, 1002);
INSERT INTO `sys_role_menu`
VALUES (2, 1003);
INSERT INTO `sys_role_menu`
VALUES (2, 1004);
INSERT INTO `sys_role_menu`
VALUES (2, 1005);
INSERT INTO `sys_role_menu`
VALUES (2, 1006);
INSERT INTO `sys_role_menu`
VALUES (2, 1007);
INSERT INTO `sys_role_menu`
VALUES (2, 1008);
INSERT INTO `sys_role_menu`
VALUES (2, 1009);
INSERT INTO `sys_role_menu`
VALUES (2, 1010);
INSERT INTO `sys_role_menu`
VALUES (2, 1011);
INSERT INTO `sys_role_menu`
VALUES (2, 1012);
INSERT INTO `sys_role_menu`
VALUES (2, 1013);
INSERT INTO `sys_role_menu`
VALUES (2, 1014);
INSERT INTO `sys_role_menu`
VALUES (2, 1015);
INSERT INTO `sys_role_menu`
VALUES (2, 1016);
INSERT INTO `sys_role_menu`
VALUES (2, 1017);
INSERT INTO `sys_role_menu`
VALUES (2, 1018);
INSERT INTO `sys_role_menu`
VALUES (2, 1019);
INSERT INTO `sys_role_menu`
VALUES (2, 1020);
INSERT INTO `sys_role_menu`
VALUES (2, 1021);
INSERT INTO `sys_role_menu`
VALUES (2, 1022);
INSERT INTO `sys_role_menu`
VALUES (2, 1023);
INSERT INTO `sys_role_menu`
VALUES (2, 1024);
INSERT INTO `sys_role_menu`
VALUES (2, 1025);
INSERT INTO `sys_role_menu`
VALUES (2, 1026);
INSERT INTO `sys_role_menu`
VALUES (2, 1027);
INSERT INTO `sys_role_menu`
VALUES (2, 1028);
INSERT INTO `sys_role_menu`
VALUES (2, 1029);
INSERT INTO `sys_role_menu`
VALUES (2, 1030);
INSERT INTO `sys_role_menu`
VALUES (2, 1031);
INSERT INTO `sys_role_menu`
VALUES (2, 1032);
INSERT INTO `sys_role_menu`
VALUES (2, 1033);
INSERT INTO `sys_role_menu`
VALUES (2, 1034);
INSERT INTO `sys_role_menu`
VALUES (2, 1035);
INSERT INTO `sys_role_menu`
VALUES (2, 1036);
INSERT INTO `sys_role_menu`
VALUES (2, 1037);
INSERT INTO `sys_role_menu`
VALUES (2, 1038);
INSERT INTO `sys_role_menu`
VALUES (2, 1039);
INSERT INTO `sys_role_menu`
VALUES (2, 1040);
INSERT INTO `sys_role_menu`
VALUES (2, 1041);
INSERT INTO `sys_role_menu`
VALUES (2, 1042);
INSERT INTO `sys_role_menu`
VALUES (2, 1043);
INSERT INTO `sys_role_menu`
VALUES (2, 1044);
INSERT INTO `sys_role_menu`
VALUES (2, 1045);
INSERT INTO `sys_role_menu`
VALUES (2, 1055);
INSERT INTO `sys_role_menu`
VALUES (2, 1056);
INSERT INTO `sys_role_menu`
VALUES (2, 1057);
INSERT INTO `sys_role_menu`
VALUES (2, 1058);
INSERT INTO `sys_role_menu`
VALUES (2, 1059);
INSERT INTO `sys_role_menu`
VALUES (2, 1060);
INSERT INTO `sys_role_menu`
VALUES (100, 1);
INSERT INTO `sys_role_menu`
VALUES (100, 100);
INSERT INTO `sys_role_menu`
VALUES (100, 101);
INSERT INTO `sys_role_menu`
VALUES (100, 102);
INSERT INTO `sys_role_menu`
VALUES (100, 103);
INSERT INTO `sys_role_menu`
VALUES (100, 105);
INSERT INTO `sys_role_menu`
VALUES (100, 106);
INSERT INTO `sys_role_menu`
VALUES (100, 107);
INSERT INTO `sys_role_menu`
VALUES (100, 116);
INSERT INTO `sys_role_menu`
VALUES (100, 1000);
INSERT INTO `sys_role_menu`
VALUES (100, 1001);
INSERT INTO `sys_role_menu`
VALUES (100, 1002);
INSERT INTO `sys_role_menu`
VALUES (100, 1003);
INSERT INTO `sys_role_menu`
VALUES (100, 1004);
INSERT INTO `sys_role_menu`
VALUES (100, 1005);
INSERT INTO `sys_role_menu`
VALUES (100, 1006);
INSERT INTO `sys_role_menu`
VALUES (100, 1007);
INSERT INTO `sys_role_menu`
VALUES (100, 1008);
INSERT INTO `sys_role_menu`
VALUES (100, 1009);
INSERT INTO `sys_role_menu`
VALUES (100, 1010);
INSERT INTO `sys_role_menu`
VALUES (100, 1011);
INSERT INTO `sys_role_menu`
VALUES (100, 1012);
INSERT INTO `sys_role_menu`
VALUES (100, 1013);
INSERT INTO `sys_role_menu`
VALUES (100, 1014);
INSERT INTO `sys_role_menu`
VALUES (100, 1015);
INSERT INTO `sys_role_menu`
VALUES (100, 1016);
INSERT INTO `sys_role_menu`
VALUES (100, 1017);
INSERT INTO `sys_role_menu`
VALUES (100, 1018);
INSERT INTO `sys_role_menu`
VALUES (100, 1019);
INSERT INTO `sys_role_menu`
VALUES (100, 1025);
INSERT INTO `sys_role_menu`
VALUES (100, 1026);
INSERT INTO `sys_role_menu`
VALUES (100, 1027);
INSERT INTO `sys_role_menu`
VALUES (100, 1028);
INSERT INTO `sys_role_menu`
VALUES (100, 1029);
INSERT INTO `sys_role_menu`
VALUES (100, 1030);
INSERT INTO `sys_role_menu`
VALUES (100, 1031);
INSERT INTO `sys_role_menu`
VALUES (100, 1032);
INSERT INTO `sys_role_menu`
VALUES (100, 1033);
INSERT INTO `sys_role_menu`
VALUES (100, 1034);
INSERT INTO `sys_role_menu`
VALUES (100, 1035);
INSERT INTO `sys_role_menu`
VALUES (100, 1036);
INSERT INTO `sys_role_menu`
VALUES (100, 1037);
INSERT INTO `sys_role_menu`
VALUES (100, 1038);
INSERT INTO `sys_role_menu`
VALUES (100, 1055);
INSERT INTO `sys_role_menu`
VALUES (100, 1056);
INSERT INTO `sys_role_menu`
VALUES (100, 1057);
INSERT INTO `sys_role_menu`
VALUES (100, 1058);
INSERT INTO `sys_role_menu`
VALUES (100, 1059);
INSERT INTO `sys_role_menu`
VALUES (100, 1060);
INSERT INTO `sys_role_menu`
VALUES (100, 2001);
INSERT INTO `sys_role_menu`
VALUES (100, 2002);
INSERT INTO `sys_role_menu`
VALUES (100, 2003);
INSERT INTO `sys_role_menu`
VALUES (100, 2004);
INSERT INTO `sys_role_menu`
VALUES (100, 2005);
INSERT INTO `sys_role_menu`
VALUES (100, 2006);
INSERT INTO `sys_role_menu`
VALUES (100, 2007);
INSERT INTO `sys_role_menu`
VALUES (100, 2008);
INSERT INTO `sys_role_menu`
VALUES (100, 2009);
INSERT INTO `sys_role_menu`
VALUES (100, 2010);
INSERT INTO `sys_role_menu`
VALUES (100, 2011);
INSERT INTO `sys_role_menu`
VALUES (100, 2012);
INSERT INTO `sys_role_menu`
VALUES (100, 2019);
INSERT INTO `sys_role_menu`
VALUES (100, 2020);
INSERT INTO `sys_role_menu`
VALUES (100, 2021);
INSERT INTO `sys_role_menu`
VALUES (100, 2022);
INSERT INTO `sys_role_menu`
VALUES (100, 2023);
INSERT INTO `sys_role_menu`
VALUES (100, 2024);
INSERT INTO `sys_role_menu`
VALUES (100, 2025);
INSERT INTO `sys_role_menu`
VALUES (100, 2026);
INSERT INTO `sys_role_menu`
VALUES (100, 2027);
INSERT INTO `sys_role_menu`
VALUES (100, 2028);
INSERT INTO `sys_role_menu`
VALUES (100, 2029);
INSERT INTO `sys_role_menu`
VALUES (100, 2030);
INSERT INTO `sys_role_menu`
VALUES (100, 2031);
INSERT INTO `sys_role_menu`
VALUES (100, 2032);
INSERT INTO `sys_role_menu`
VALUES (100, 2033);
INSERT INTO `sys_role_menu`
VALUES (100, 2034);
INSERT INTO `sys_role_menu`
VALUES (100, 2035);
INSERT INTO `sys_role_menu`
VALUES (100, 2036);
INSERT INTO `sys_role_menu`
VALUES (100, 2043);
INSERT INTO `sys_role_menu`
VALUES (100, 2044);
INSERT INTO `sys_role_menu`
VALUES (100, 2045);
INSERT INTO `sys_role_menu`
VALUES (100, 2046);
INSERT INTO `sys_role_menu`
VALUES (100, 2047);
INSERT INTO `sys_role_menu`
VALUES (100, 2048);
INSERT INTO `sys_role_menu`
VALUES (100, 2050);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`         bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `dept_id`         bigint                                                        NULL     DEFAULT NULL COMMENT '所属部门ID',
    `nick_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '姓名',
    `user_name`       varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '登录名',
    `password`        varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
    `position`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '职务',
    `email`           varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '邮箱',
    `phonenumber`     varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '电话',
    `unit`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '单位',
    `employee_no`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '工号',
    `org_id`          bigint                                                        NOT NULL COMMENT '所属单位ID',
    `sex`             char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL     DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '头像地址',
    `sign`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '签名',
    `status`          char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL     DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
    `del_flag`        char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NULL     DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
    `login_ip`        varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT '' COMMENT '最后登录IP',
    `login_date`      datetime                                                      NULL     DEFAULT NULL COMMENT '最后登录时间',
    `pwd_update_date` datetime                                                      NULL     DEFAULT NULL COMMENT '密码最后更新时间',
    `user_type`       varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci   NULL     DEFAULT '00' COMMENT '用户类型（00系统用户）',
    `create_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '创建者',
    `create_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '创建时间',
    `update_by`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL     DEFAULT '' COMMENT '更新者',
    `update_time`     datetime                                                      NULL     DEFAULT NULL COMMENT '更新时间',
    `remark`          varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL     DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 109
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user`
VALUES (1, 100, '系统管理员', 'admin', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', NULL,
        'admin@163.com', '15888888888', NULL, NULL, 0, '0',
        '/profile/avatar/2026/02/06/255e773109ee403f922afc1b974a882b.png', NULL, '0', '0', '127.0.0.1',
        '2026-02-07 15:24:27', '2025-06-24 22:47:50', '00', 'admin', '2025-06-24 22:47:50', '', '2026-02-07 15:24:27',
        '管理员');
INSERT INTO `sys_user`
VALUES (102, 100, '参会人员2', '参会人员2', '$2a$10$ufwzDWDUGgHD5e1griHDo.2DJOPUEyXNZ/ayh6V5F0GjgoNnSFzJ.', NULL, '',
        '', NULL, '002', 100, '0', '', NULL, '0', '0', '', NULL, NULL, '00', 'admin', '2026-02-05 21:45:13', 'admin',
        '2026-02-06 13:15:30', NULL);
INSERT INTO `sys_user`
VALUES (103, 100, '参会人员3', '参会人员3', '$2a$10$nJXBS1zz5GUBstkgERM1Q.I6TKGuv1L9b5jHg1r7e/gGuxOQPRXrm', NULL, '',
        '', NULL, '003', 100, '0', '', NULL, '0', '0', '', NULL, NULL, '00', 'admin', '2026-02-05 21:57:25', '', NULL,
        NULL);
INSERT INTO `sys_user`
VALUES (104, 100, '参会人员4', '参会人员4', '$2a$10$epN9pVRXq22f/T18ZH9My.7khHSIiBAch061rqDwGla2W8ufuvOri', NULL, '',
        '', NULL, '004', 100, '0', '', NULL, '0', '0', '', NULL, NULL, '00', 'admin', '2026-02-05 22:11:26', '', NULL,
        NULL);
INSERT INTO `sys_user`
VALUES (105, 100, '参会人员5', '参会人员5', '$2a$10$FZ7dG4k/VbUlTPluF/cuW./5ounVHlpUVpiJJfCfE.y5aTR5VyX4S', NULL, '',
        '', NULL, '005', 100, '0', '/profile/upload/2026/02/05/defaultAvatar_20260205221223A001.png', NULL, '0', '0',
        '', NULL, NULL, '00', 'admin', '2026-02-05 22:12:24', '', NULL, NULL);
INSERT INTO `sys_user`
VALUES (106, 213, 'chen', '王五', '$2a$10$3gt.fJZ/uLMm/QQIl04BGOpX7Xs5bkc/B6hjPQaaK4mLqiX6dSqiC', 'test', '211@qq.com',
        '11134567890', '开发部门', '4444', 212, '0', '/profile/upload/2026/02/05/female_20260205223456A006.png',
        '/profile/upload/2026/02/05/defaultAvatar_20260205222514A003.png', '0', '0', '', NULL, NULL, '00', 'admin',
        '2026-02-05 22:25:16', 'admin', '2026-02-05 22:36:14', '11');
INSERT INTO `sys_user`
VALUES (107, 212, '222', '222', '$2a$10$X.9/zsUG6oisG.KqsVD55.X56gH5WoF4rUJNIrBG7huib/Cwr2pQK', '222', '222@qq.com',
        '222', '222', '22222', 212, '0', '/profile/upload/2026/02/05/female_20260205224243A003.png',
        '/profile/upload/2026/02/05/female_20260205224247A004.png', '0', '0', '127.0.0.1', '2026-02-05 22:48:28', NULL,
        '00', 'admin', '2026-02-05 22:42:18', 'admin', '2026-02-05 22:48:28', '222');
INSERT INTO `sys_user`
VALUES (108, 100, '参会人员1', '参会人员1', '$2a$10$QlVW1czFNS4WC696PBcfpeL7.g2bx0q6AD9nNOolk2Y7xo3CUhZte', NULL, '',
        '', NULL, '001', 100, '0', '', NULL, '0', '0', '', NULL, NULL, '00', 'admin', '2026-02-05 22:53:55', '', NULL,
        NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `post_id` bigint NOT NULL COMMENT '岗位ID',
    PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户与部门关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_id` bigint NOT NULL COMMENT '用户ID',
    `role_id` bigint NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role`
VALUES (1, 1);
INSERT INTO `sys_user_role`
VALUES (102, 2);
INSERT INTO `sys_user_role`
VALUES (102, 100);
INSERT INTO `sys_user_role`
VALUES (104, 2);
INSERT INTO `sys_user_role`
VALUES (105, 2);
INSERT INTO `sys_user_role`
VALUES (106, 2);
INSERT INTO `sys_user_role`
VALUES (106, 100);
INSERT INTO `sys_user_role`
VALUES (107, 2);
INSERT INTO `sys_user_role`
VALUES (107, 100);
INSERT INTO `sys_user_role`
VALUES (108, 2);

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote`
(
    `id`               int                                                           NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `vote_title`       varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '投票主题',
    `agenda_id`        int                                                           NULL DEFAULT NULL COMMENT '关联议程主题',
    `vote_mode`        varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '投票模式',
    `show_switch`      tinyint(1)                                                    NULL DEFAULT 1 COMMENT '投票显示开关：0-关闭，1-开启',
    `anonymous_switch` tinyint(1)                                                    NULL DEFAULT 0 COMMENT '投票匿名开关：0-关闭，1-开启',
    `remark`           varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `create_time`      datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      datetime                                                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `vote_res`         text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '投票结果json',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '投票表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vote
-- ----------------------------
INSERT INTO `vote`
VALUES (6, '测试投票1', NULL, '0', 1, 0, NULL, '2026-02-07 14:36:40', '2026-02-07 14:36:40', '{}');
INSERT INTO `vote`
VALUES (7, '2', NULL, '1', 1, 0, NULL, '2026-02-07 14:37:01', '2026-02-07 14:37:01',
        '{\"赞成\":0,\"反对\":0,\"弃权\":0}');
INSERT INTO `vote`
VALUES (8, '1', NULL, '0', 1, 0, NULL, '2026-02-07 14:47:39', '2026-02-07 14:47:39', '{}');
INSERT INTO `vote`
VALUES (9, '2', NULL, '1', 1, 0, NULL, '2026-02-07 14:47:47', '2026-02-07 14:47:46',
        '{\"赞成\":0,\"反对\":0,\"弃权\":0}');

SET FOREIGN_KEY_CHECKS = 1;

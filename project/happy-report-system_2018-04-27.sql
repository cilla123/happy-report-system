# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11)
# Database: happy-report-system
# Generation Time: 2018-04-27 14:32:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table system_ajax
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_ajax`;

CREATE TABLE `system_ajax` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_id` int(11) NOT NULL COMMENT '所属系统ID',
  `name` varchar(255) NOT NULL COMMENT '访问的ajaxUrl',
  `method` varchar(10) DEFAULT '' COMMENT '资源请求方式',
  `duration` int(11) NOT NULL COMMENT 'AJAX响应时间 单位：ms',
  `decoded_body_size` int(11) NOT NULL DEFAULT '0' COMMENT '返回字段大小  单位：B',
  `call_url` varchar(255) DEFAULT NULL COMMENT '调用页面的URL',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `querydata` varchar(255) DEFAULT NULL COMMENT 'ajax 请求参数',
  `create_time` bigint(11) NOT NULL COMMENT '调用时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_environment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_environment`;

CREATE TABLE `system_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id 自增',
  `system_id` int(11) DEFAULT NULL COMMENT '所属系统',
  `url` varchar(255) DEFAULT NULL COMMENT '访问页面的url',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `browser` varchar(20) DEFAULT NULL COMMENT '浏览器名称',
  `borwser_version` varchar(20) DEFAULT NULL COMMENT '浏览器版本',
  `system` varchar(20) DEFAULT NULL COMMENT '操作系统',
  `system_version` varchar(20) DEFAULT '' COMMENT '系统版本',
  `ip` varchar(20) DEFAULT NULL COMMENT '访问者IP',
  `isp` varchar(20) DEFAULT NULL COMMENT '运营商',
  `county` varchar(20) DEFAULT NULL COMMENT '国家',
  `province` varchar(30) DEFAULT '' COMMENT '省',
  `city` varchar(30) DEFAULT NULL COMMENT '市',
  `create_time` bigint(11) NOT NULL COMMENT '用户访问时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_error
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_error`;

CREATE TABLE `system_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_id` int(11) NOT NULL COMMENT '系统名称',
  `msg` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `user_agent` tinytext COMMENT '用户浏览器信息',
  `category` varchar(20) DEFAULT '' COMMENT '错误类型',
  `page_url` varchar(255) DEFAULT NULL COMMENT '访问的页面',
  `resource_url` varchar(255) DEFAULT NULL COMMENT '错误资源URL',
  `target` varchar(10) DEFAULT NULL COMMENT '资源类型',
  `type` varchar(20) DEFAULT NULL COMMENT '错误类型',
  `status` varchar(10) DEFAULT NULL COMMENT 'HTTP状态码',
  `text` varchar(50) DEFAULT NULL COMMENT '资源错误提示',
  `col` varchar(20) DEFAULT NULL COMMENT 'js错误列号',
  `line` varchar(20) DEFAULT NULL COMMENT 'js错误行号',
  `querydata` varchar(255) DEFAULT NULL COMMENT 'http请求参数',
  `method` varchar(10) DEFAULT '' COMMENT '资源请求方式',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url',
  `create_time` bigint(11) NOT NULL COMMENT '报错时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_pages`;

CREATE TABLE `system_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_id` int(11) NOT NULL COMMENT '所属系统id',
  `url` varchar(255) NOT NULL COMMENT 'url域名',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `load_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面完全加载时间 单位：ms',
  `dns_time` int(11) NOT NULL DEFAULT '0' COMMENT 'dns解析时间 单位：ms',
  `tcp_time` int(11) NOT NULL DEFAULT '0' COMMENT 'TCP连接时间',
  `dom_time` int(11) NOT NULL COMMENT 'DOM构建时间 单位：ms',
  `resource_time` int(11) NOT NULL DEFAULT '0' COMMENT '资源加载耗时 单位：ms',
  `white_time` int(11) NOT NULL DEFAULT '0' COMMENT '白屏时间 单位：ms',
  `pre_url` varchar(255) DEFAULT NULL COMMENT '用户访问的上一个页面，本页面来源',
  `redirect_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面重定向时间',
  `unload_time` int(11) NOT NULL DEFAULT '0' COMMENT 'unload 时间',
  `request_time` int(11) NOT NULL DEFAULT '0' COMMENT 'request请求耗时',
  `analysis_dom_time` int(11) NOT NULL DEFAULT '0' COMMENT '解析dom耗时',
  `ready_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面准备时间',
  `create_time` bigint(11) NOT NULL COMMENT '访问页面时间',
  `update_time` bigint(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_project`;

CREATE TABLE `system_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_domain` varchar(50) NOT NULL COMMENT '系统 域名',
  `system_name` varchar(20) NOT NULL COMMENT '系统名称',
  `script` tinytext COMMENT '获取页面统计脚本',
  `is_use` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要统计  0：是  1：否',
  `slow_page_time` tinyint(2) NOT NULL DEFAULT '8' COMMENT '页面加载页面阀值  单位：ms',
  `slow_js_time` tinyint(2) NOT NULL DEFAULT '2' COMMENT 'js慢资源阀值 单位：ms',
  `slow_css_time` tinyint(2) NOT NULL DEFAULT '1' COMMENT '慢加载css资源阀值  单位：ms',
  `slow_img_time` tinyint(2) NOT NULL DEFAULT '2' COMMENT '慢图片加载资源阀值  单位:ms',
  `slow_ajax_time` tinyint(2) NOT NULL DEFAULT '2' COMMENT 'AJAX加载阀值',
  `app_id` varchar(64) NOT NULL COMMENT '系统appId标识',
  `user_id` int(11) NOT NULL COMMENT '应用所属用户ID',
  `is_statisi_pages` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否统计页面性能信息  0：是   1：否',
  `is_statisi_ajax` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否统计页面Ajax性能资源 0：是  1：否',
  `is_statisi_resource` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否统计页面加载资源性能信息 0：是    1：否',
  `is_statisi_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存储用户系统信息资源信息',
  `is_statisi_error` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上报页面错误信息',
  `create_time` bigint(11) DEFAULT NULL COMMENT '系统新增时间',
  `update_time` bigint(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_slowpages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_slowpages`;

CREATE TABLE `system_slowpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_id` int(11) NOT NULL COMMENT '所属系统id',
  `url` varchar(255) NOT NULL COMMENT 'url域名',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `load_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面完全加载时间 单位：ms',
  `dns_time` int(11) NOT NULL DEFAULT '0' COMMENT 'dns解析时间 单位：ms',
  `tcp_time` int(11) NOT NULL DEFAULT '0' COMMENT 'TCP连接时间',
  `dom_time` int(11) NOT NULL COMMENT 'DOM构建时间 单位：ms',
  `resource_time` int(11) NOT NULL DEFAULT '0' COMMENT '资源加载耗时 单位：ms',
  `white_time` int(11) NOT NULL DEFAULT '0' COMMENT '白屏时间 单位：ms',
  `pre_url` varchar(255) DEFAULT NULL COMMENT '用户访问的上一个页面，本页面来源',
  `redirect_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面重定向时间',
  `unload_time` int(11) NOT NULL DEFAULT '0' COMMENT 'unload 时间',
  `request_time` int(11) NOT NULL DEFAULT '0' COMMENT 'request请求耗时',
  `analysis_dom_time` int(11) NOT NULL DEFAULT '0' COMMENT '解析dom耗时',
  `ready_time` int(11) NOT NULL DEFAULT '0' COMMENT '页面准备时间',
  `create_time` bigint(11) NOT NULL COMMENT '访问页面时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_slowresources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_slowresources`;

CREATE TABLE `system_slowresources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `system_id` int(11) NOT NULL COMMENT '所属系统ID',
  `name` varchar(255) NOT NULL COMMENT '资源Url',
  `duration` int(11) NOT NULL COMMENT 'AJAX响应时间 单位：ms',
  `decoded_body_size` int(11) NOT NULL DEFAULT '0' COMMENT '返回字段大小  单位：B',
  `call_url` varchar(255) DEFAULT NULL COMMENT '调用页面的URL',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `method` varchar(10) DEFAULT NULL COMMENT '资源请求方式 GET ||  POST',
  `querydata` varchar(255) DEFAULT NULL COMMENT 'ajax get 请求的参数',
  `create_time` bigint(11) NOT NULL COMMENT '调用时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_sources`;

CREATE TABLE `system_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增键',
  `system_id` int(11) NOT NULL COMMENT '所属系统ID',
  `call_url` varchar(255) NOT NULL COMMENT '访问页面url ID',
  `resource_datas` text NOT NULL COMMENT '页面所有加载资源json字符串',
  `mark_page` varchar(64) DEFAULT NULL COMMENT '所有资源页面统一标识 html img css js 用户系统信息等',
  `mark_user` varchar(64) DEFAULT NULL COMMENT '统一某一时间段用户标识',
  `create_time` bigint(11) NOT NULL COMMENT '数据新增时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table system_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(300) DEFAULT '' COMMENT '用户头像',
  `phone` varchar(20) DEFAULT '' COMMENT '用户电话',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT '用户秘钥',
  `is_user` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否禁用（0：正常，1：禁用）',
  `level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户等级（0：管理员，1：普通用户）',
  `create_time` bigint(11) NOT NULL COMMENT '创建时间',
  `update_time` bigint(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user` DISABLE KEYS */;

INSERT INTO `system_user` (`id`, `username`, `password`, `avatar`, `phone`, `token`, `is_user`, `level`, `create_time`, `update_time`)
VALUES
	(1,'cilla123','8975',NULL,NULL,'',0,0,0,0);

/*!40000 ALTER TABLE `system_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

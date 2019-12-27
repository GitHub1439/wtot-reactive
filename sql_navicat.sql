/*
Navicat MySQL Data Transfer

Source Server         : 本地2
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : cms122

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-22 16:41:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for allwww_admin
-- ----------------------------
DROP TABLE IF EXISTS `allwww_admin`;
CREATE TABLE `allwww_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_admin
-- ----------------------------
INSERT INTO `allwww_admin` VALUES ('1', 'admin', '149434f3577e47085ceb6131eb7e9d55', '1', 'XP79vj', '', '1513840923', '82321006@qq.com', '', '', '');

-- ----------------------------
-- Table structure for allwww_admin_panel
-- ----------------------------
DROP TABLE IF EXISTS `allwww_admin_panel`;
CREATE TABLE `allwww_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `allwww_admin_role`;
CREATE TABLE `allwww_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_admin_role
-- ----------------------------
INSERT INTO `allwww_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `allwww_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `allwww_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `allwww_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `allwww_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `allwww_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

-- ----------------------------
-- Table structure for allwww_admin_role_priv
-- ----------------------------
DROP TABLE IF EXISTS `allwww_admin_role_priv`;
CREATE TABLE `allwww_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_attachment
-- ----------------------------
DROP TABLE IF EXISTS `allwww_attachment`;
CREATE TABLE `allwww_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_attachment
-- ----------------------------
INSERT INTO `allwww_attachment` VALUES ('12', 'kefu', '0', 'ewm_wap.jpg', '2017/0602/20170602110443531.jpg', '17587', 'jpg', '1', '0', '0', '1', '1496372683', '127.0.0.1', '1', '3ce44150b5522f01e2fa23b60156ebd0', '1');

-- ----------------------------
-- Table structure for allwww_attachment_index
-- ----------------------------
DROP TABLE IF EXISTS `allwww_attachment_index`;
CREATE TABLE `allwww_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_attachment_index
-- ----------------------------
INSERT INTO `allwww_attachment_index` VALUES ('link-5', '12');

-- ----------------------------
-- Table structure for allwww_badword
-- ----------------------------
DROP TABLE IF EXISTS `allwww_badword`;
CREATE TABLE `allwww_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_badword
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_block
-- ----------------------------
DROP TABLE IF EXISTS `allwww_block`;
CREATE TABLE `allwww_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_block
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_block_history
-- ----------------------------
DROP TABLE IF EXISTS `allwww_block_history`;
CREATE TABLE `allwww_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_block_priv
-- ----------------------------
DROP TABLE IF EXISTS `allwww_block_priv`;
CREATE TABLE `allwww_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_cache
-- ----------------------------
DROP TABLE IF EXISTS `allwww_cache`;
CREATE TABLE `allwww_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_cache
-- ----------------------------
INSERT INTO `allwww_cache` VALUES ('mood_program.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'凡高网络后台管理系统\',\n    \'iimage\' => \'\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://localhost/\',\n    \'taocan\' => \'0\',\n    \'site_title\' => \'凡高网络后台管理系统\',\n    \'keywords\' => \'凡高网络 后台 管理系统 后台管理系统\',\n    \'description\' => \'凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"10\"}\',\n    \'uuid\' => \'2c63f97b-d4fa-11e3-8d48-001fc6c932f3\',\n    \'sy_date\' => \'2017/03/30\',\n    \'isshiyong\' => \'0\',\n    \'url\' => \'http://localhost/\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `allwww_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `allwww_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n  31 => \n  array (\n    \'urlruleid\' => \'31\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html\',\n    \'example\' => \'news/china/index.html\',\n  ),\n  32 => \n  array (\n    \'urlruleid\' => \'32\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$id}.html|{$categorydir}{$catdir}/{$id}_{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n  31 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html\',\n  32 => \'{$categorydir}{$catdir}/{$id}.html|{$categorydir}{$catdir}/{$id}_{$page}.html\',\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'enablcodecheck\\\' => \\\'0\\\',\n  \\\'mobile_checktype\\\' => \\\'0\\\',\n  \\\'user_sendsms_title\\\' => \\\'\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'0\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'array (\n  \\\'enablehits\\\' => \\\'0\\\',\n  \\\'ext\\\' => \\\'\\\',\n  \\\'maxsize\\\' => \\\'\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2014-05-06\',\n    \'updatedate\' => \'2014-05-06\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2014-05-06\',\n    \'updatedate\' => \'2014-05-06\',\n  ),\n  \'customfield\' => \n  array (\n    \'module\' => \'customfield\',\n    \'name\' => \'自定义变量\',\n    \'url\' => \'customfield/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'frontLon\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2015-08-01\',\n    \'updatedate\' => \'2015-08-01\',\n  ),\n  \'mobile\' => \n  array (\n    \'module\' => \'mobile\',\n    \'name\' => \'手机模块\',\n    \'url\' => \'mobile/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2016-09-19\',\n    \'updatedate\' => \'2016-09-19\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'1\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'1\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_2.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_3.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_11.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('type_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_12.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('category_items_13.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('type_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('vote.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('link.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `allwww_cache` VALUES ('poster.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'enablehits\' => \'0\',\n    \'ext\' => \'\',\n    \'maxsize\' => \'\',\n  ),\n);\n?>');

-- ----------------------------
-- Table structure for allwww_category
-- ----------------------------
DROP TABLE IF EXISTS `allwww_category`;
CREATE TABLE `allwww_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `catname_en` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `wap_image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `iswapmenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_category_index` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `catgory_lianjie` int(10) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_category
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_category_priv
-- ----------------------------
DROP TABLE IF EXISTS `allwww_category_priv`;
CREATE TABLE `allwww_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_cnzzip
-- ----------------------------
DROP TABLE IF EXISTS `allwww_cnzzip`;
CREATE TABLE `allwww_cnzzip` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `ips` int(100) unsigned NOT NULL DEFAULT '0',
  `pvs` int(100) unsigned NOT NULL DEFAULT '0',
  `h` int(100) unsigned NOT NULL DEFAULT '0',
  `d` int(100) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `updatetime` (`updatetime`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_cnzzip
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_cnzzip_conut
-- ----------------------------
DROP TABLE IF EXISTS `allwww_cnzzip_conut`;
CREATE TABLE `allwww_cnzzip_conut` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `ips` int(100) unsigned NOT NULL DEFAULT '0',
  `pvs` int(100) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_cnzzip_conut
-- ----------------------------
INSERT INTO `allwww_cnzzip_conut` VALUES ('1', '0', '0');

-- ----------------------------
-- Table structure for allwww_collection_content
-- ----------------------------
DROP TABLE IF EXISTS `allwww_collection_content`;
CREATE TABLE `allwww_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_collection_content
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_collection_history
-- ----------------------------
DROP TABLE IF EXISTS `allwww_collection_history`;
CREATE TABLE `allwww_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_collection_node
-- ----------------------------
DROP TABLE IF EXISTS `allwww_collection_node`;
CREATE TABLE `allwww_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_collection_node
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_collection_program
-- ----------------------------
DROP TABLE IF EXISTS `allwww_collection_program`;
CREATE TABLE `allwww_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_collection_program
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_content_check
-- ----------------------------
DROP TABLE IF EXISTS `allwww_content_check`;
CREATE TABLE `allwww_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_copyfrom
-- ----------------------------
DROP TABLE IF EXISTS `allwww_copyfrom`;
CREATE TABLE `allwww_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_customfield
-- ----------------------------
DROP TABLE IF EXISTS `allwww_customfield`;
CREATE TABLE `allwww_customfield` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` char(50) NOT NULL,
  `name` char(30) NOT NULL,
  `val` text NOT NULL,
  `conf` char(255) NOT NULL,
  `listorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pos` (`name`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_customfield
-- ----------------------------
INSERT INTO `allwww_customfield` VALUES ('2', '0', '1', '推广代码', '', '', 'array (\n  \'status\' => \'1\',\n)', '1');
INSERT INTO `allwww_customfield` VALUES ('7', '2', '1', '百度商桥', 'seo_baidu', '', 'array (\n  \'status\' => \'1\',\n  \'textarea\' => \'1\',\n)', '0');
INSERT INTO `allwww_customfield` VALUES ('9', '2', '1', '统计代码', 'seo_tongji', '', 'array (\n  \'status\' => \'1\',\n  \'textarea\' => \'1\',\n)', '0');
INSERT INTO `allwww_customfield` VALUES ('10', '2', '1', '360商桥', 'seo_360', '', 'array (\n  \'status\' => \'1\',\n  \'textarea\' => \'1\',\n)', '0');
INSERT INTO `allwww_customfield` VALUES ('11', '0', '1', '联系方式', '', '', 'array (\n  \'status\' => \'1\',\n)', '0');

-- ----------------------------
-- Table structure for allwww_datacall
-- ----------------------------
DROP TABLE IF EXISTS `allwww_datacall`;
CREATE TABLE `allwww_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_dbsource
-- ----------------------------
DROP TABLE IF EXISTS `allwww_dbsource`;
CREATE TABLE `allwww_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_download
-- ----------------------------
DROP TABLE IF EXISTS `allwww_download`;
CREATE TABLE `allwww_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_download
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_download_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_download_data`;
CREATE TABLE `allwww_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_download_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_downservers
-- ----------------------------
DROP TABLE IF EXISTS `allwww_downservers`;
CREATE TABLE `allwww_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_extend_setting
-- ----------------------------
DROP TABLE IF EXISTS `allwww_extend_setting`;
CREATE TABLE `allwww_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_favorite
-- ----------------------------
DROP TABLE IF EXISTS `allwww_favorite`;
CREATE TABLE `allwww_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_hits
-- ----------------------------
DROP TABLE IF EXISTS `allwww_hits`;
CREATE TABLE `allwww_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_hits
-- ----------------------------
INSERT INTO `allwww_hits` VALUES ('c-1-1', '7', '6', '0', '6', '6', '6', '1465291924');
INSERT INTO `allwww_hits` VALUES ('c-1-2', '7', '0', '0', '0', '0', '0', '1465287842');
INSERT INTO `allwww_hits` VALUES ('c-1-3', '7', '0', '0', '0', '0', '0', '1465295424');
INSERT INTO `allwww_hits` VALUES ('c-1-4', '7', '0', '0', '0', '0', '0', '1465300054');
INSERT INTO `allwww_hits` VALUES ('c-1-5', '7', '0', '0', '0', '0', '0', '1465300190');
INSERT INTO `allwww_hits` VALUES ('c-1-6', '7', '0', '0', '0', '0', '0', '1465300545');
INSERT INTO `allwww_hits` VALUES ('c-1-7', '7', '0', '0', '0', '0', '0', '1465359156');
INSERT INTO `allwww_hits` VALUES ('c-1-8', '7', '0', '0', '0', '0', '0', '1465359203');

-- ----------------------------
-- Table structure for allwww_ipbanned
-- ----------------------------
DROP TABLE IF EXISTS `allwww_ipbanned`;
CREATE TABLE `allwww_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_keylink
-- ----------------------------
DROP TABLE IF EXISTS `allwww_keylink`;
CREATE TABLE `allwww_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_keyword
-- ----------------------------
DROP TABLE IF EXISTS `allwww_keyword`;
CREATE TABLE `allwww_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_keyword
-- ----------------------------
INSERT INTO `allwww_keyword` VALUES ('1', '1', '凡高', 'fangao', '6', '0');
INSERT INTO `allwww_keyword` VALUES ('2', '1', '后台', 'houtai', '6', '0');
INSERT INTO `allwww_keyword` VALUES ('3', '1', '模式', 'moshi', '6', '0');
INSERT INTO `allwww_keyword` VALUES ('4', '1', '11111111', '11111111', '5', '0');
INSERT INTO `allwww_keyword` VALUES ('5', '1', '3333333333333', '3333333333333', '1', '0');
INSERT INTO `allwww_keyword` VALUES ('6', '1', '333333333333', '333333333333', '2', '0');
INSERT INTO `allwww_keyword` VALUES ('7', '1', '33333333', '33333333', '5', '0');
INSERT INTO `allwww_keyword` VALUES ('8', '1', '4444444444', '4444444444', '1', '0');
INSERT INTO `allwww_keyword` VALUES ('9', '1', '22222222222', '22222222222', '2', '0');
INSERT INTO `allwww_keyword` VALUES ('10', '1', '55555555555555', '55555555555555', '4', '0');
INSERT INTO `allwww_keyword` VALUES ('11', '1', '测试', 'ceshi', '1', '0');

-- ----------------------------
-- Table structure for allwww_keyword_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_keyword_data`;
CREATE TABLE `allwww_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_keyword_data
-- ----------------------------
INSERT INTO `allwww_keyword_data` VALUES ('1', '1', '1', '1-1');
INSERT INTO `allwww_keyword_data` VALUES ('2', '2', '1', '1-1');
INSERT INTO `allwww_keyword_data` VALUES ('3', '3', '1', '1-1');
INSERT INTO `allwww_keyword_data` VALUES ('4', '4', '1', '2-1');
INSERT INTO `allwww_keyword_data` VALUES ('5', '5', '1', '3-1');
INSERT INTO `allwww_keyword_data` VALUES ('6', '6', '1', '4-1');
INSERT INTO `allwww_keyword_data` VALUES ('7', '7', '1', '5-1');
INSERT INTO `allwww_keyword_data` VALUES ('8', '8', '1', '6-1');
INSERT INTO `allwww_keyword_data` VALUES ('9', '9', '1', '7-1');
INSERT INTO `allwww_keyword_data` VALUES ('10', '10', '1', '8-1');
INSERT INTO `allwww_keyword_data` VALUES ('11', '11', '1', '9-1');

-- ----------------------------
-- Table structure for allwww_linkage
-- ----------------------------
DROP TABLE IF EXISTS `allwww_linkage`;
CREATE TABLE `allwww_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_linkage
-- ----------------------------
INSERT INTO `allwww_linkage` VALUES ('1', '中国', '1', '0', '0', '', '0', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2', '北京市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3', '上海市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('4', '天津市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('5', '重庆市', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('6', '河北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('7', '山西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('8', '内蒙古', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('9', '辽宁省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('10', '吉林省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('11', '黑龙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('12', '江苏省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('13', '浙江省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('14', '安徽省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('15', '福建省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('16', '江西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('17', '山东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('18', '河南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('19', '湖北省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('20', '湖南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('21', '广东省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('22', '广西', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('23', '海南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('24', '四川省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('25', '贵州省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('26', '云南省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('27', '西藏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('28', '陕西省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('29', '甘肃省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('30', '青海省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('31', '宁夏', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('32', '新疆', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('33', '台湾省', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('34', '香港', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('35', '澳门', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('36', '东城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('37', '西城区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('38', '崇文区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('39', '宣武区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('40', '朝阳区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('41', '石景山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('42', '海淀区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('43', '门头沟区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('44', '房山区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('45', '通州区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('46', '顺义区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('47', '昌平区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('48', '大兴区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('49', '怀柔区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('50', '平谷区', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('51', '密云县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('52', '延庆县', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('53', '黄浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('54', '卢湾区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('55', '徐汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('56', '长宁区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('57', '静安区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('58', '普陀区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('59', '闸北区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('60', '虹口区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('61', '杨浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('62', '闵行区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('63', '宝山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('64', '嘉定区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('65', '浦东新区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('66', '金山区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('67', '松江区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('68', '青浦区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('69', '南汇区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('70', '奉贤区', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('71', '崇明县', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('72', '和平区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('73', '河东区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('74', '河西区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('75', '南开区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('76', '河北区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('77', '红桥区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('78', '塘沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('79', '汉沽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('80', '大港区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('81', '东丽区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('82', '西青区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('83', '津南区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('84', '北辰区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('85', '武清区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('86', '宝坻区', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('87', '宁河县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('88', '静海县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('89', '蓟县', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('90', '万州区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('91', '涪陵区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('92', '渝中区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('93', '大渡口区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('94', '江北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('95', '沙坪坝区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('96', '九龙坡区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('97', '南岸区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('98', '北碚区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('99', '万盛区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('100', '双桥区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('101', '渝北区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('102', '巴南区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('103', '黔江区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('104', '长寿区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('105', '綦江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('106', '潼南县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('107', '铜梁县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('108', '大足县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('109', '荣昌县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('110', '璧山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('111', '梁平县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('112', '城口县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('113', '丰都县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('114', '垫江县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('115', '武隆县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('116', '忠县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('117', '开县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('118', '云阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('119', '奉节县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('120', '巫山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('121', '巫溪县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('122', '石柱县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('123', '秀山县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('124', '酉阳县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('125', '彭水县', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('126', '江津区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('127', '合川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('128', '永川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('129', '南川区', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('130', '石家庄市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('131', '唐山市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('132', '秦皇岛市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('133', '邯郸市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('134', '邢台市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('135', '保定市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('136', '张家口市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('137', '承德市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('138', '沧州市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('139', '廊坊市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('140', '衡水市', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('141', '太原市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('142', '大同市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('143', '阳泉市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('144', '长治市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('145', '晋城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('146', '朔州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('147', '晋中市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('148', '运城市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('149', '忻州市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('150', '临汾市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('151', '吕梁市', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('152', '呼和浩特市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('153', '包头市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('154', '乌海市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('155', '赤峰市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('156', '通辽市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('157', '鄂尔多斯市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('158', '呼伦贝尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('159', '巴彦淖尔市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('160', '乌兰察布市', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('161', '兴安盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('162', '锡林郭勒盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('163', '阿拉善盟', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('164', '沈阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('165', '大连市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('166', '鞍山市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('167', '抚顺市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('168', '本溪市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('169', '丹东市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('170', '锦州市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('171', '营口市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('172', '阜新市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('173', '辽阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('174', '盘锦市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('175', '铁岭市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('176', '朝阳市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('177', '葫芦岛市', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('178', '长春市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('179', '吉林市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('180', '四平市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('181', '辽源市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('182', '通化市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('183', '白山市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('184', '松原市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('185', '白城市', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('186', '延边', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('187', '哈尔滨市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('188', '齐齐哈尔市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('189', '鸡西市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('190', '鹤岗市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('191', '双鸭山市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('192', '大庆市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('193', '伊春市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('194', '佳木斯市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('195', '七台河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('196', '牡丹江市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('197', '黑河市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('198', '绥化市', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('199', '大兴安岭地区', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('200', '南京市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('201', '无锡市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('202', '徐州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('203', '常州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('204', '苏州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('205', '南通市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('206', '连云港市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('207', '淮安市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('208', '盐城市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('209', '扬州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('210', '镇江市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('211', '泰州市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('212', '宿迁市', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('213', '杭州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('214', '宁波市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('215', '温州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('216', '嘉兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('217', '湖州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('218', '绍兴市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('219', '金华市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('220', '衢州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('221', '舟山市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('222', '台州市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('223', '丽水市', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('224', '合肥市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('225', '芜湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('226', '蚌埠市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('227', '淮南市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('228', '马鞍山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('229', '淮北市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('230', '铜陵市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('231', '安庆市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('232', '黄山市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('233', '滁州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('234', '阜阳市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('235', '宿州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('236', '巢湖市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('237', '六安市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('238', '亳州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('239', '池州市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('240', '宣城市', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('241', '福州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('242', '厦门市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('243', '莆田市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('244', '三明市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('245', '泉州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('246', '漳州市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('247', '南平市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('248', '龙岩市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('249', '宁德市', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('250', '南昌市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('251', '景德镇市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('252', '萍乡市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('253', '九江市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('254', '新余市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('255', '鹰潭市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('256', '赣州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('257', '吉安市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('258', '宜春市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('259', '抚州市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('260', '上饶市', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('261', '济南市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('262', '青岛市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('263', '淄博市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('264', '枣庄市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('265', '东营市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('266', '烟台市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('267', '潍坊市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('268', '济宁市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('269', '泰安市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('270', '威海市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('271', '日照市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('272', '莱芜市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('273', '临沂市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('274', '德州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('275', '聊城市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('276', '滨州市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('277', '荷泽市', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('278', '郑州市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('279', '开封市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('280', '洛阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('281', '平顶山市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('282', '安阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('283', '鹤壁市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('284', '新乡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('285', '焦作市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('286', '濮阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('287', '许昌市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('288', '漯河市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('289', '三门峡市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('290', '南阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('291', '商丘市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('292', '信阳市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('293', '周口市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('294', '驻马店市', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('295', '武汉市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('296', '黄石市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('297', '十堰市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('298', '宜昌市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('299', '襄樊市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('300', '鄂州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('301', '荆门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('302', '孝感市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('303', '荆州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('304', '黄冈市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('305', '咸宁市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('306', '随州市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('307', '恩施土家族苗族自治州', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('308', '仙桃市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('309', '潜江市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('310', '天门市', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('311', '神农架林区', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('312', '长沙市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('313', '株洲市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('314', '湘潭市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('315', '衡阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('316', '邵阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('317', '岳阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('318', '常德市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('319', '张家界市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('320', '益阳市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('321', '郴州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('322', '永州市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('323', '怀化市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('324', '娄底市', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('325', '湘西土家族苗族自治州', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('326', '广州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('327', '韶关市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('328', '深圳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('329', '珠海市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('330', '汕头市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('331', '佛山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('332', '江门市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('333', '湛江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('334', '茂名市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('335', '肇庆市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('336', '惠州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('337', '梅州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('338', '汕尾市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('339', '河源市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('340', '阳江市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('341', '清远市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('342', '东莞市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('343', '中山市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('344', '潮州市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('345', '揭阳市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('346', '云浮市', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('347', '南宁市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('348', '柳州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('349', '桂林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('350', '梧州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('351', '北海市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('352', '防城港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('353', '钦州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('354', '贵港市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('355', '玉林市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('356', '百色市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('357', '贺州市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('358', '河池市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('359', '来宾市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('360', '崇左市', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('361', '海口市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('362', '三亚市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('363', '五指山市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('364', '琼海市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('365', '儋州市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('366', '文昌市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('367', '万宁市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('368', '东方市', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('369', '定安县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('370', '屯昌县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('371', '澄迈县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('372', '临高县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('373', '白沙黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('374', '昌江黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('375', '乐东黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('376', '陵水黎族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('377', '保亭黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('378', '琼中黎族苗族自治县', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('379', '西沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('380', '南沙群岛', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('381', '中沙群岛的岛礁及其海域', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('382', '成都市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('383', '自贡市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('384', '攀枝花市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('385', '泸州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('386', '德阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('387', '绵阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('388', '广元市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('389', '遂宁市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('390', '内江市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('391', '乐山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('392', '南充市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('393', '眉山市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('394', '宜宾市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('395', '广安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('396', '达州市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('397', '雅安市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('398', '巴中市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('399', '资阳市', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('400', '阿坝州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('401', '甘孜州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('402', '凉山州', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('403', '贵阳市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('404', '六盘水市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('405', '遵义市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('406', '安顺市', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('407', '铜仁地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('408', '黔西南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('409', '毕节地区', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('410', '黔东南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('411', '黔南州', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('412', '昆明市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('413', '曲靖市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('414', '玉溪市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('415', '保山市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('416', '昭通市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('417', '丽江市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('418', '思茅市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('419', '临沧市', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('420', '楚雄州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('421', '红河州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('422', '文山州', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('423', '西双版纳', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('424', '大理', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('425', '德宏', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('426', '怒江', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('427', '迪庆', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('428', '拉萨市', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('429', '昌都', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('430', '山南', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('431', '日喀则', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('432', '那曲', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('433', '阿里', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('434', '林芝', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('435', '西安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('436', '铜川市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('437', '宝鸡市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('438', '咸阳市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('439', '渭南市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('440', '延安市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('441', '汉中市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('442', '榆林市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('443', '安康市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('444', '商洛市', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('445', '兰州市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('446', '嘉峪关市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('447', '金昌市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('448', '白银市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('449', '天水市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('450', '武威市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('451', '张掖市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('452', '平凉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('453', '酒泉市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('454', '庆阳市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('455', '定西市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('456', '陇南市', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('457', '临夏州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('458', '甘州', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('459', '西宁市', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('460', '海东地区', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('461', '海州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('462', '黄南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('463', '海南州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('464', '果洛州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('465', '玉树州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('466', '海西州', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('467', '银川市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('468', '石嘴山市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('469', '吴忠市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('470', '固原市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('471', '中卫市', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('472', '乌鲁木齐市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('473', '克拉玛依市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('474', '吐鲁番地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('475', '哈密地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('476', '昌吉州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('477', '博尔州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('478', '巴音郭楞州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('479', '阿克苏地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('480', '克孜勒苏柯尔克孜自治州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('481', '喀什地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('482', '和田地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('483', '伊犁州', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('484', '塔城地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('485', '阿勒泰地区', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('486', '石河子市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('487', '阿拉尔市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('488', '图木舒克市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('489', '五家渠市', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('490', '台北市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('491', '高雄市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('492', '基隆市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('493', '新竹市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('494', '台中市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('495', '嘉义市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('496', '台南市', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('497', '台北县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('498', '桃园县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('499', '新竹县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('500', '苗栗县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('501', '台中县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('502', '彰化县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('503', '南投县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('504', '云林县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('505', '嘉义县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('506', '台南县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('507', '高雄县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('508', '屏东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('509', '宜兰县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('510', '花莲县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('511', '台东县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('512', '澎湖县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('513', '金门县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('514', '连江县', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('515', '中西区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('516', '东区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('517', '南区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('518', '湾仔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('519', '九龙城区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('520', '观塘区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('521', '深水埗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('522', '黄大仙区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('523', '油尖旺区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('524', '离岛区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('525', '葵青区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('526', '北区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('527', '西贡区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('528', '沙田区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('529', '大埔区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('530', '荃湾区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('531', '屯门区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('532', '元朗区', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('533', '花地玛堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('534', '市圣安多尼堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('535', '大堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('536', '望德堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('537', '风顺堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('538', '嘉模堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('539', '圣方济各堂区', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('540', '长安区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('541', '桥东区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('542', '桥西区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('543', '新华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('544', '井陉矿区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('545', '裕华区', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('546', '井陉县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('547', '正定县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('548', '栾城县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('549', '行唐县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('550', '灵寿县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('551', '高邑县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('552', '深泽县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('553', '赞皇县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('554', '无极县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('555', '平山县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('556', '元氏县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('557', '赵县', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('558', '辛集市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('559', '藁城市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('560', '晋州市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('561', '新乐市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('562', '鹿泉市', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('563', '路南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('564', '路北区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('565', '古冶区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('566', '开平区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('567', '丰南区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('568', '丰润区', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('569', '滦县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('570', '滦南县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('571', '乐亭县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('572', '迁西县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('573', '玉田县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('574', '唐海县', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('575', '遵化市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('576', '迁安市', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('577', '海港区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('578', '山海关区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('579', '北戴河区', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('580', '青龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('581', '昌黎县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('582', '抚宁县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('583', '卢龙县', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('584', '邯山区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('585', '丛台区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('586', '复兴区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('587', '峰峰矿区', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('588', '邯郸县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('589', '临漳县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('590', '成安县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('591', '大名县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('592', '涉县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('593', '磁县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('594', '肥乡县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('595', '永年县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('596', '邱县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('597', '鸡泽县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('598', '广平县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('599', '馆陶县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('600', '魏县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('601', '曲周县', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('602', '武安市', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('603', '桥东区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('604', '桥西区', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('605', '邢台县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('606', '临城县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('607', '内丘县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('608', '柏乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('609', '隆尧县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('610', '任县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('611', '南和县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('612', '宁晋县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('613', '巨鹿县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('614', '新河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('615', '广宗县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('616', '平乡县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('617', '威县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('618', '清河县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('619', '临西县', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('620', '南宫市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('621', '沙河市', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('622', '新市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('623', '北市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('624', '南市区', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('625', '满城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('626', '清苑县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('627', '涞水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('628', '阜平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('629', '徐水县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('630', '定兴县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('631', '唐县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('632', '高阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('633', '容城县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('634', '涞源县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('635', '望都县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('636', '安新县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('637', '易县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('638', '曲阳县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('639', '蠡县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('640', '顺平县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('641', '博野县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('642', '雄县', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('643', '涿州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('644', '定州市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('645', '安国市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('646', '高碑店市', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('647', '桥东区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('648', '桥西区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('649', '宣化区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('650', '下花园区', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('651', '宣化县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('652', '张北县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('653', '康保县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('654', '沽源县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('655', '尚义县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('656', '蔚县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('657', '阳原县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('658', '怀安县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('659', '万全县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('660', '怀来县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('661', '涿鹿县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('662', '赤城县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('663', '崇礼县', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('664', '双桥区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('665', '双滦区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('666', '鹰手营子矿区', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('667', '承德县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('668', '兴隆县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('669', '平泉县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('670', '滦平县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('671', '隆化县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('672', '丰宁县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('673', '宽城县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('674', '围场县', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('675', '新华区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('676', '运河区', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('677', '沧县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('678', '青县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('679', '东光县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('680', '海兴县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('681', '盐山县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('682', '肃宁县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('683', '南皮县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('684', '吴桥县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('685', '献县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('686', '孟村县', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('687', '泊头市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('688', '任丘市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('689', '黄骅市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('690', '河间市', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('691', '安次区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('692', '广阳区', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('693', '固安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('694', '永清县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('695', '香河县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('696', '大城县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('697', '文安县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('698', '大厂县', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('699', '霸州市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('700', '三河市', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('701', '桃城区', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('702', '枣强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('703', '武邑县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('704', '武强县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('705', '饶阳县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('706', '安平县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('707', '故城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('708', '景县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('709', '阜城县', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('710', '冀州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('711', '深州市', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('712', '小店区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('713', '迎泽区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('714', '杏花岭区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('715', '尖草坪区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('716', '万柏林区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('717', '晋源区', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('718', '清徐县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('719', '阳曲县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('720', '娄烦县', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('721', '古交市', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('722', '城区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('723', '矿区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('724', '南郊区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('725', '新荣区', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('726', '阳高县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('727', '天镇县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('728', '广灵县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('729', '灵丘县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('730', '浑源县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('731', '左云县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('732', '大同县', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('733', '城区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('734', '矿区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('735', '郊区', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('736', '平定县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('737', '盂县', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('738', '城区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('739', '郊区', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('740', '长治县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('741', '襄垣县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('742', '屯留县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('743', '平顺县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('744', '黎城县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('745', '壶关县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('746', '长子县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('747', '武乡县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('748', '沁县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('749', '沁源县', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('750', '潞城市', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('751', '城区', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('752', '沁水县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('753', '阳城县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('754', '陵川县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('755', '泽州县', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('756', '高平市', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('757', '朔城区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('758', '平鲁区', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('759', '山阴县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('760', '应县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('761', '右玉县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('762', '怀仁县', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('763', '榆次区', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('764', '榆社县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('765', '左权县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('766', '和顺县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('767', '昔阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('768', '寿阳县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('769', '太谷县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('770', '祁县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('771', '平遥县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('772', '灵石县', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('773', '介休市', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('774', '盐湖区', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('775', '临猗县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('776', '万荣县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('777', '闻喜县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('778', '稷山县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('779', '新绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('780', '绛县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('781', '垣曲县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('782', '夏县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('783', '平陆县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('784', '芮城县', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('785', '永济市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('786', '河津市', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('787', '忻府区', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('788', '定襄县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('789', '五台县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('790', '代县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('791', '繁峙县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('792', '宁武县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('793', '静乐县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('794', '神池县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('795', '五寨县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('796', '岢岚县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('797', '河曲县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('798', '保德县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('799', '偏关县', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('800', '原平市', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('801', '尧都区', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('802', '曲沃县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('803', '翼城县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('804', '襄汾县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('805', '洪洞县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('806', '古县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('807', '安泽县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('808', '浮山县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('809', '吉县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('810', '乡宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('811', '大宁县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('812', '隰县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('813', '永和县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('814', '蒲县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('815', '汾西县', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('816', '侯马市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('817', '霍州市', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('818', '离石区', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('819', '文水县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('820', '交城县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('821', '兴县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('822', '临县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('823', '柳林县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('824', '石楼县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('825', '岚县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('826', '方山县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('827', '中阳县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('828', '交口县', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('829', '孝义市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('830', '汾阳市', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('831', '新城区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('832', '回民区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('833', '玉泉区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('834', '赛罕区', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('835', '土默特左旗', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('836', '托克托县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('837', '和林格尔县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('838', '清水河县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('839', '武川县', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('840', '东河区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('841', '昆都仑区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('842', '青山区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('843', '石拐区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('844', '白云矿区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('845', '九原区', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('846', '土默特右旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('847', '固阳县', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('848', '达尔罕茂明安联合旗', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('849', '海勃湾区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('850', '海南区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('851', '乌达区', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('852', '红山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('853', '元宝山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('854', '松山区', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('855', '阿鲁科尔沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('856', '巴林左旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('857', '巴林右旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('858', '林西县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('859', '克什克腾旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('860', '翁牛特旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('861', '喀喇沁旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('862', '宁城县', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('863', '敖汉旗', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('864', '科尔沁区', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('865', '科尔沁左翼中旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('866', '科尔沁左翼后旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('867', '开鲁县', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('868', '库伦旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('869', '奈曼旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('870', '扎鲁特旗', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('871', '霍林郭勒市', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('872', '东胜区', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('873', '达拉特旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('874', '准格尔旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('875', '鄂托克前旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('876', '鄂托克旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('877', '杭锦旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('878', '乌审旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('879', '伊金霍洛旗', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('880', '海拉尔区', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('881', '阿荣旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('882', '莫力达瓦达斡尔族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('883', '鄂伦春自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('884', '鄂温克族自治旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('885', '陈巴尔虎旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('886', '新巴尔虎左旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('887', '新巴尔虎右旗', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('888', '满洲里市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('889', '牙克石市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('890', '扎兰屯市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('891', '额尔古纳市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('892', '根河市', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('893', '临河区', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('894', '五原县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('895', '磴口县', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('896', '乌拉特前旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('897', '乌拉特中旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('898', '乌拉特后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('899', '杭锦后旗', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('900', '集宁区', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('901', '卓资县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('902', '化德县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('903', '商都县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('904', '兴和县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('905', '凉城县', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('906', '察哈尔右翼前旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('907', '察哈尔右翼中旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('908', '察哈尔右翼后旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('909', '四子王旗', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('910', '丰镇市', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('911', '乌兰浩特市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('912', '阿尔山市', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('913', '科尔沁右翼前旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('914', '科尔沁右翼中旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('915', '扎赉特旗', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('916', '突泉县', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('917', '二连浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('918', '锡林浩特市', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('919', '阿巴嘎旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('920', '苏尼特左旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('921', '苏尼特右旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('922', '东乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('923', '西乌珠穆沁旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('924', '太仆寺旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('925', '镶黄旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('926', '正镶白旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('927', '正蓝旗', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('928', '多伦县', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('929', '阿拉善左旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('930', '阿拉善右旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('931', '额济纳旗', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('932', '和平区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('933', '沈河区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('934', '大东区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('935', '皇姑区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('936', '铁西区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('937', '苏家屯区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('938', '东陵区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('939', '新城子区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('940', '于洪区', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('941', '辽中县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('942', '康平县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('943', '法库县', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('944', '新民市', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('945', '中山区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('946', '西岗区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('947', '沙河口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('948', '甘井子区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('949', '旅顺口区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('950', '金州区', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('951', '长海县', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('952', '瓦房店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('953', '普兰店市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('954', '庄河市', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('955', '铁东区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('956', '铁西区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('957', '立山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('958', '千山区', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('959', '台安县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('960', '岫岩满族自治县', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('961', '海城市', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('962', '新抚区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('963', '东洲区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('964', '望花区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('965', '顺城区', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('966', '抚顺县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('967', '新宾满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('968', '清原满族自治县', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('969', '平山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('970', '溪湖区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('971', '明山区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('972', '南芬区', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('973', '本溪满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('974', '桓仁满族自治县', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('975', '元宝区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('976', '振兴区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('977', '振安区', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('978', '宽甸满族自治县', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('979', '东港市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('980', '凤城市', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('981', '古塔区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('982', '凌河区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('983', '太和区', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('984', '黑山县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('985', '义县', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('986', '凌海市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('987', '北镇市', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('988', '站前区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('989', '西市区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('990', '鲅鱼圈区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('991', '老边区', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('992', '盖州市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('993', '大石桥市', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('994', '海州区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('995', '新邱区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('996', '太平区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('997', '清河门区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('998', '细河区', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('999', '阜新蒙古族自治县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1000', '彰武县', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1001', '白塔区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1002', '文圣区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1003', '宏伟区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1004', '弓长岭区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1005', '太子河区', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1006', '辽阳县', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1007', '灯塔市', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1008', '双台子区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1009', '兴隆台区', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1010', '大洼县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1011', '盘山县', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1012', '银州区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1013', '清河区', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1014', '铁岭县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1015', '西丰县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1016', '昌图县', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1017', '调兵山市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1018', '开原市', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1019', '双塔区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1020', '龙城区', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1021', '朝阳县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1022', '建平县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1023', '喀喇沁左翼蒙古族自治县', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1024', '北票市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1025', '凌源市', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1026', '连山区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1027', '龙港区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1028', '南票区', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1029', '绥中县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1030', '建昌县', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1031', '兴城市', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1032', '南关区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1033', '宽城区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1034', '朝阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1035', '二道区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1036', '绿园区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1037', '双阳区', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1038', '农安县', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1039', '九台市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1040', '榆树市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1041', '德惠市', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1042', '昌邑区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1043', '龙潭区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1044', '船营区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1045', '丰满区', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1046', '永吉县', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1047', '蛟河市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1048', '桦甸市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1049', '舒兰市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1050', '磐石市', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1051', '铁西区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1052', '铁东区', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1053', '梨树县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1054', '伊通满族自治县', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1055', '公主岭市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1056', '双辽市', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1057', '龙山区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1058', '西安区', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1059', '东丰县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1060', '东辽县', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1061', '东昌区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1062', '二道江区', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1063', '通化县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1064', '辉南县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1065', '柳河县', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1066', '梅河口市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1067', '集安市', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1068', '八道江区', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1069', '抚松县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1070', '靖宇县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1071', '长白朝鲜族自治县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1072', '江源县', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1073', '临江市', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1074', '宁江区', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1075', '前郭尔罗斯蒙古族自治县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1076', '长岭县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1077', '乾安县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1078', '扶余县', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1079', '洮北区', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1080', '镇赉县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1081', '通榆县', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1082', '洮南市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1083', '大安市', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1084', '延吉市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1085', '图们市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1086', '敦化市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1087', '珲春市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1088', '龙井市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1089', '和龙市', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1090', '汪清县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1091', '安图县', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1092', '道里区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1093', '南岗区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1094', '道外区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1095', '香坊区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1096', '动力区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1097', '平房区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1098', '松北区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1099', '呼兰区', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1100', '依兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1101', '方正县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1102', '宾县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1103', '巴彦县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1104', '木兰县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1105', '通河县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1106', '延寿县', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1107', '阿城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1108', '双城市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1109', '尚志市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1110', '五常市', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1111', '龙沙区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1112', '建华区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1113', '铁锋区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1114', '昂昂溪区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1115', '富拉尔基区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1116', '碾子山区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1117', '梅里斯达斡尔族区', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1118', '龙江县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1119', '依安县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1120', '泰来县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1121', '甘南县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1122', '富裕县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1123', '克山县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1124', '克东县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1125', '拜泉县', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1126', '讷河市', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1127', '鸡冠区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1128', '恒山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1129', '滴道区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1130', '梨树区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1131', '城子河区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1132', '麻山区', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1133', '鸡东县', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1134', '虎林市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1135', '密山市', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1136', '向阳区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1137', '工农区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1138', '南山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1139', '兴安区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1140', '东山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1141', '兴山区', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1142', '萝北县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1143', '绥滨县', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1144', '尖山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1145', '岭东区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1146', '四方台区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1147', '宝山区', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1148', '集贤县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1149', '友谊县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1150', '宝清县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1151', '饶河县', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1152', '萨尔图区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1153', '龙凤区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1154', '让胡路区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1155', '红岗区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1156', '大同区', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1157', '肇州县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1158', '肇源县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1159', '林甸县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1160', '杜尔伯特蒙古族自治县', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1161', '伊春区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1162', '南岔区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1163', '友好区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1164', '西林区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1165', '翠峦区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1166', '新青区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1167', '美溪区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1168', '金山屯区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1169', '五营区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1170', '乌马河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1171', '汤旺河区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1172', '带岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1173', '乌伊岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1174', '红星区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1175', '上甘岭区', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1176', '嘉荫县', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1177', '铁力市', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1178', '永红区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1179', '向阳区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1180', '前进区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1181', '东风区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1182', '郊区', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1183', '桦南县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1184', '桦川县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1185', '汤原县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1186', '抚远县', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1187', '同江市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1188', '富锦市', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1189', '新兴区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1190', '桃山区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1191', '茄子河区', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1192', '勃利县', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1193', '东安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1194', '阳明区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1195', '爱民区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1196', '西安区', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1197', '东宁县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1198', '林口县', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1199', '绥芬河市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1200', '海林市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1201', '宁安市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1202', '穆棱市', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1203', '爱辉区', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1204', '嫩江县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1205', '逊克县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1206', '孙吴县', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1207', '北安市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1208', '五大连池市', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1209', '北林区', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1210', '望奎县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1211', '兰西县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1212', '青冈县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1213', '庆安县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1214', '明水县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1215', '绥棱县', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1216', '安达市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1217', '肇东市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1218', '海伦市', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1219', '呼玛县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1220', '塔河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1221', '漠河县', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1222', '玄武区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1223', '白下区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1224', '秦淮区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1225', '建邺区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1226', '鼓楼区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1227', '下关区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1228', '浦口区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1229', '栖霞区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1230', '雨花台区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1231', '江宁区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1232', '六合区', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1233', '溧水县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1234', '高淳县', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1235', '崇安区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1236', '南长区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1237', '北塘区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1238', '锡山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1239', '惠山区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1240', '滨湖区', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1241', '江阴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1242', '宜兴市', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1243', '鼓楼区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1244', '云龙区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1245', '九里区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1246', '贾汪区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1247', '泉山区', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1248', '丰县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1249', '沛县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1250', '铜山县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1251', '睢宁县', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1252', '新沂市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1253', '邳州市', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1254', '天宁区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1255', '钟楼区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1256', '戚墅堰区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1257', '新北区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1258', '武进区', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1259', '溧阳市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1260', '金坛市', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1261', '沧浪区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1262', '平江区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1263', '金阊区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1264', '虎丘区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1265', '吴中区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1266', '相城区', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1267', '常熟市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1268', '张家港市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1269', '昆山市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1270', '吴江市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1271', '太仓市', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1272', '崇川区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1273', '港闸区', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1274', '海安县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1275', '如东县', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1276', '启东市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1277', '如皋市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1278', '通州市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1279', '海门市', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1280', '连云区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1281', '新浦区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1282', '海州区', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1283', '赣榆县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1284', '东海县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1285', '灌云县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1286', '灌南县', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1287', '清河区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1288', '楚州区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1289', '淮阴区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1290', '清浦区', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1291', '涟水县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1292', '洪泽县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1293', '盱眙县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1294', '金湖县', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1295', '亭湖区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1296', '盐都区', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1297', '响水县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1298', '滨海县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1299', '阜宁县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1300', '射阳县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1301', '建湖县', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1302', '东台市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1303', '大丰市', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1304', '广陵区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1305', '邗江区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1306', '维扬区', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1307', '宝应县', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1308', '仪征市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1309', '高邮市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1310', '江都市', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1311', '京口区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1312', '润州区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1313', '丹徒区', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1314', '丹阳市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1315', '扬中市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1316', '句容市', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1317', '海陵区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1318', '高港区', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1319', '兴化市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1320', '靖江市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1321', '泰兴市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1322', '姜堰市', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1323', '宿城区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1324', '宿豫区', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1325', '沭阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1326', '泗阳县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1327', '泗洪县', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1328', '上城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1329', '下城区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1330', '江干区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1331', '拱墅区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1332', '西湖区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1333', '滨江区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1334', '萧山区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1335', '余杭区', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1336', '桐庐县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1337', '淳安县', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1338', '建德市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1339', '富阳市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1340', '临安市', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1341', '海曙区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1342', '江东区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1343', '江北区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1344', '北仑区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1345', '镇海区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1346', '鄞州区', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1347', '象山县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1348', '宁海县', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1349', '余姚市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1350', '慈溪市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1351', '奉化市', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1352', '鹿城区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1353', '龙湾区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1354', '瓯海区', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1355', '洞头县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1356', '永嘉县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1357', '平阳县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1358', '苍南县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1359', '文成县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1360', '泰顺县', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1361', '瑞安市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1362', '乐清市', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1363', '秀城区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1364', '秀洲区', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1365', '嘉善县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1366', '海盐县', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1367', '海宁市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1368', '平湖市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1369', '桐乡市', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1370', '吴兴区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1371', '南浔区', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1372', '德清县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1373', '长兴县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1374', '安吉县', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1375', '越城区', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1376', '绍兴县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1377', '新昌县', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1378', '诸暨市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1379', '上虞市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1380', '嵊州市', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1381', '婺城区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1382', '金东区', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1383', '武义县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1384', '浦江县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1385', '磐安县', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1386', '兰溪市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1387', '义乌市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1388', '东阳市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1389', '永康市', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1390', '柯城区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1391', '衢江区', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1392', '常山县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1393', '开化县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1394', '龙游县', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1395', '江山市', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1396', '定海区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1397', '普陀区', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1398', '岱山县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1399', '嵊泗县', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1400', '椒江区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1401', '黄岩区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1402', '路桥区', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1403', '玉环县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1404', '三门县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1405', '天台县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1406', '仙居县', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1407', '温岭市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1408', '临海市', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1409', '莲都区', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1410', '青田县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1411', '缙云县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1412', '遂昌县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1413', '松阳县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1414', '云和县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1415', '庆元县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1416', '景宁畲族自治县', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1417', '龙泉市', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1418', '瑶海区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1419', '庐阳区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1420', '蜀山区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1421', '包河区', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1422', '长丰县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1423', '肥东县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1424', '肥西县', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1425', '镜湖区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1426', '弋江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1427', '鸠江区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1428', '三山区', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1429', '芜湖县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1430', '繁昌县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1431', '南陵县', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1432', '龙子湖区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1433', '蚌山区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1434', '禹会区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1435', '淮上区', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1436', '怀远县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1437', '五河县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1438', '固镇县', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1439', '大通区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1440', '田家庵区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1441', '谢家集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1442', '八公山区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1443', '潘集区', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1444', '凤台县', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1445', '金家庄区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1446', '花山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1447', '雨山区', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1448', '当涂县', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1449', '杜集区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1450', '相山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1451', '烈山区', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1452', '濉溪县', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1453', '铜官山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1454', '狮子山区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1455', '郊区', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1456', '铜陵县', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1457', '迎江区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1458', '大观区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1459', '宜秀区', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1460', '怀宁县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1461', '枞阳县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1462', '潜山县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1463', '太湖县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1464', '宿松县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1465', '望江县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1466', '岳西县', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1467', '桐城市', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1468', '屯溪区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1469', '黄山区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1470', '徽州区', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1471', '歙县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1472', '休宁县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1473', '黟县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1474', '祁门县', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1475', '琅琊区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1476', '南谯区', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1477', '来安县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1478', '全椒县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1479', '定远县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1480', '凤阳县', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1481', '天长市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1482', '明光市', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1483', '颍州区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1484', '颍东区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1485', '颍泉区', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1486', '临泉县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1487', '太和县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1488', '阜南县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1489', '颍上县', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1490', '界首市', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1491', '埇桥区', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1492', '砀山县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1493', '萧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1494', '灵璧县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1495', '泗县', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1496', '居巢区', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1497', '庐江县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1498', '无为县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1499', '含山县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1500', '和县', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1501', '金安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1502', '裕安区', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1503', '寿县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1504', '霍邱县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1505', '舒城县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1506', '金寨县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1507', '霍山县', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1508', '谯城区', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1509', '涡阳县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1510', '蒙城县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1511', '利辛县', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1512', '贵池区', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1513', '东至县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1514', '石台县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1515', '青阳县', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1516', '宣州区', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1517', '郎溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1518', '广德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1519', '泾县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1520', '绩溪县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1521', '旌德县', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1522', '宁国市', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1523', '鼓楼区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1524', '台江区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1525', '仓山区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1526', '马尾区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1527', '晋安区', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1528', '闽侯县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1529', '连江县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1530', '罗源县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1531', '闽清县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1532', '永泰县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1533', '平潭县', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1534', '福清市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1535', '长乐市', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1536', '思明区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1537', '海沧区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1538', '湖里区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1539', '集美区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1540', '同安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1541', '翔安区', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1542', '城厢区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1543', '涵江区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1544', '荔城区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1545', '秀屿区', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1546', '仙游县', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1547', '梅列区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1548', '三元区', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1549', '明溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1550', '清流县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1551', '宁化县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1552', '大田县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1553', '尤溪县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1554', '沙县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1555', '将乐县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1556', '泰宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1557', '建宁县', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1558', '永安市', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1559', '鲤城区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1560', '丰泽区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1561', '洛江区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1562', '泉港区', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1563', '惠安县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1564', '安溪县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1565', '永春县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1566', '德化县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1567', '金门县', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1568', '石狮市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1569', '晋江市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1570', '南安市', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1571', '芗城区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1572', '龙文区', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1573', '云霄县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1574', '漳浦县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1575', '诏安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1576', '长泰县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1577', '东山县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1578', '南靖县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1579', '平和县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1580', '华安县', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1581', '龙海市', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1582', '延平区', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1583', '顺昌县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1584', '浦城县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1585', '光泽县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1586', '松溪县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1587', '政和县', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1588', '邵武市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1589', '武夷山市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1590', '建瓯市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1591', '建阳市', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1592', '新罗区', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1593', '长汀县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1594', '永定县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1595', '上杭县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1596', '武平县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1597', '连城县', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1598', '漳平市', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1599', '蕉城区', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1600', '霞浦县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1601', '古田县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1602', '屏南县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1603', '寿宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1604', '周宁县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1605', '柘荣县', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1606', '福安市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1607', '福鼎市', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1608', '东湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1609', '西湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1610', '青云谱区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1611', '湾里区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1612', '青山湖区', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1613', '南昌县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1614', '新建县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1615', '安义县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1616', '进贤县', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1617', '昌江区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1618', '珠山区', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1619', '浮梁县', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1620', '乐平市', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1621', '安源区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1622', '湘东区', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1623', '莲花县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1624', '上栗县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1625', '芦溪县', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1626', '庐山区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1627', '浔阳区', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1628', '九江县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1629', '武宁县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1630', '修水县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1631', '永修县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1632', '德安县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1633', '星子县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1634', '都昌县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1635', '湖口县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1636', '彭泽县', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1637', '瑞昌市', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1638', '渝水区', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1639', '分宜县', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1640', '月湖区', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1641', '余江县', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1642', '贵溪市', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1643', '章贡区', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1644', '赣县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1645', '信丰县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1646', '大余县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1647', '上犹县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1648', '崇义县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1649', '安远县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1650', '龙南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1651', '定南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1652', '全南县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1653', '宁都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1654', '于都县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1655', '兴国县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1656', '会昌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1657', '寻乌县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1658', '石城县', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1659', '瑞金市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1660', '南康市', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1661', '吉州区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1662', '青原区', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1663', '吉安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1664', '吉水县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1665', '峡江县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1666', '新干县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1667', '永丰县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1668', '泰和县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1669', '遂川县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1670', '万安县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1671', '安福县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1672', '永新县', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1673', '井冈山市', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1674', '袁州区', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1675', '奉新县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1676', '万载县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1677', '上高县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1678', '宜丰县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1679', '靖安县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1680', '铜鼓县', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1681', '丰城市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1682', '樟树市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1683', '高安市', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1684', '临川区', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1685', '南城县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1686', '黎川县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1687', '南丰县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1688', '崇仁县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1689', '乐安县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1690', '宜黄县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1691', '金溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1692', '资溪县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1693', '东乡县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1694', '广昌县', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1695', '信州区', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1696', '上饶县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1697', '广丰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1698', '玉山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1699', '铅山县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1700', '横峰县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1701', '弋阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1702', '余干县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1703', '鄱阳县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1704', '万年县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1705', '婺源县', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1706', '德兴市', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1707', '历下区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1708', '市中区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1709', '槐荫区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1710', '天桥区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1711', '历城区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1712', '长清区', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1713', '平阴县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1714', '济阳县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1715', '商河县', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1716', '章丘市', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1717', '市南区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1718', '市北区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1719', '四方区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1720', '黄岛区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1721', '崂山区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1722', '李沧区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1723', '城阳区', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1724', '胶州市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1725', '即墨市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1726', '平度市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1727', '胶南市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1728', '莱西市', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1729', '淄川区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1730', '张店区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1731', '博山区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1732', '临淄区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1733', '周村区', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1734', '桓台县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1735', '高青县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1736', '沂源县', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1737', '市中区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1738', '薛城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1739', '峄城区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1740', '台儿庄区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1741', '山亭区', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1742', '滕州市', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1743', '东营区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1744', '河口区', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1745', '垦利县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1746', '利津县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1747', '广饶县', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1748', '芝罘区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1749', '福山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1750', '牟平区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1751', '莱山区', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1752', '长岛县', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1753', '龙口市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1754', '莱阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1755', '莱州市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1756', '蓬莱市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1757', '招远市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1758', '栖霞市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1759', '海阳市', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1760', '潍城区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1761', '寒亭区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1762', '坊子区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1763', '奎文区', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1764', '临朐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1765', '昌乐县', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1766', '青州市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1767', '诸城市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1768', '寿光市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1769', '安丘市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1770', '高密市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1771', '昌邑市', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1772', '市中区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1773', '任城区', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1774', '微山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1775', '鱼台县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1776', '金乡县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1777', '嘉祥县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1778', '汶上县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1779', '泗水县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1780', '梁山县', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1781', '曲阜市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1782', '兖州市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1783', '邹城市', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1784', '泰山区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1785', '岱岳区', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1786', '宁阳县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1787', '东平县', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1788', '新泰市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1789', '肥城市', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1790', '环翠区', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1791', '文登市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1792', '荣成市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1793', '乳山市', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1794', '东港区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1795', '岚山区', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1796', '五莲县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1797', '莒县', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1798', '莱城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1799', '钢城区', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1800', '兰山区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1801', '罗庄区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1802', '河东区', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1803', '沂南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1804', '郯城县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1805', '沂水县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1806', '苍山县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1807', '费县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1808', '平邑县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1809', '莒南县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1810', '蒙阴县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1811', '临沭县', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1812', '德城区', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1813', '陵县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1814', '宁津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1815', '庆云县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1816', '临邑县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1817', '齐河县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1818', '平原县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1819', '夏津县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1820', '武城县', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1821', '乐陵市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1822', '禹城市', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1823', '东昌府区', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1824', '阳谷县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1825', '莘县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1826', '茌平县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1827', '东阿县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1828', '冠县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1829', '高唐县', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1830', '临清市', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1831', '滨城区', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1832', '惠民县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1833', '阳信县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1834', '无棣县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1835', '沾化县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1836', '博兴县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1837', '邹平县', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1838', '牡丹区', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1839', '曹县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1840', '单县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1841', '成武县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1842', '巨野县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1843', '郓城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1844', '鄄城县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1845', '定陶县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1846', '东明县', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1847', '中原区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1848', '二七区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1849', '管城回族区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1850', '金水区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1851', '上街区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1852', '惠济区', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1853', '中牟县', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1854', '巩义市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1855', '荥阳市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1856', '新密市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1857', '新郑市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1858', '登封市', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1859', '龙亭区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1860', '顺河回族区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1861', '鼓楼区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1862', '禹王台区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1863', '金明区', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1864', '杞县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1865', '通许县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1866', '尉氏县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1867', '开封县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1868', '兰考县', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1869', '老城区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1870', '西工区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1871', '廛河回族区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1872', '涧西区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1873', '吉利区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1874', '洛龙区', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1875', '孟津县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1876', '新安县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1877', '栾川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1878', '嵩县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1879', '汝阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1880', '宜阳县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1881', '洛宁县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1882', '伊川县', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1883', '偃师市', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1884', '新华区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1885', '卫东区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1886', '石龙区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1887', '湛河区', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1888', '宝丰县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1889', '叶县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1890', '鲁山县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1891', '郏县', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1892', '舞钢市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1893', '汝州市', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1894', '文峰区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1895', '北关区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1896', '殷都区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1897', '龙安区', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1898', '安阳县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1899', '汤阴县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1900', '滑县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1901', '内黄县', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1902', '林州市', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1903', '鹤山区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1904', '山城区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1905', '淇滨区', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1906', '浚县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1907', '淇县', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1908', '红旗区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1909', '卫滨区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1910', '凤泉区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1911', '牧野区', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1912', '新乡县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1913', '获嘉县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1914', '原阳县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1915', '延津县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1916', '封丘县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1917', '长垣县', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1918', '卫辉市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1919', '辉县市', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1920', '解放区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1921', '中站区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1922', '马村区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1923', '山阳区', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1924', '修武县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1925', '博爱县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1926', '武陟县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1927', '温县', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1928', '济源市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1929', '沁阳市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1930', '孟州市', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1931', '华龙区', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1932', '清丰县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1933', '南乐县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1934', '范县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1935', '台前县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1936', '濮阳县', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1937', '魏都区', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1938', '许昌县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1939', '鄢陵县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1940', '襄城县', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1941', '禹州市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1942', '长葛市', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1943', '源汇区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1944', '郾城区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1945', '召陵区', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1946', '舞阳县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1947', '临颍县', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1948', '湖滨区', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1949', '渑池县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1950', '陕县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1951', '卢氏县', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1952', '义马市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1953', '灵宝市', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1954', '宛城区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1955', '卧龙区', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1956', '南召县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1957', '方城县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1958', '西峡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1959', '镇平县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1960', '内乡县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1961', '淅川县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1962', '社旗县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1963', '唐河县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1964', '新野县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1965', '桐柏县', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1966', '邓州市', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1967', '梁园区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1968', '睢阳区', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1969', '民权县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1970', '睢县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1971', '宁陵县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1972', '柘城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1973', '虞城县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1974', '夏邑县', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1975', '永城市', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1976', '浉河区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1977', '平桥区', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1978', '罗山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1979', '光山县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1980', '新县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1981', '商城县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1982', '固始县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1983', '潢川县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1984', '淮滨县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1985', '息县', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1986', '川汇区', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1987', '扶沟县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1988', '西华县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1989', '商水县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1990', '沈丘县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1991', '郸城县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1992', '淮阳县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1993', '太康县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1994', '鹿邑县', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1995', '项城市', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1996', '驿城区', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1997', '西平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1998', '上蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('1999', '平舆县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2000', '正阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2001', '确山县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2002', '泌阳县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2003', '汝南县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2004', '遂平县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2005', '新蔡县', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2006', '江岸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2007', '江汉区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2008', '硚口区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2009', '汉阳区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2010', '武昌区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2011', '青山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2012', '洪山区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2013', '东西湖区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2014', '汉南区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2015', '蔡甸区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2016', '江夏区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2017', '黄陂区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2018', '新洲区', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2019', '黄石港区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2020', '西塞山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2021', '下陆区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2022', '铁山区', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2023', '阳新县', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2024', '大冶市', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2025', '茅箭区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2026', '张湾区', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2027', '郧县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2028', '郧西县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2029', '竹山县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2030', '竹溪县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2031', '房县', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2032', '丹江口市', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2033', '西陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2034', '伍家岗区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2035', '点军区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2036', '猇亭区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2037', '夷陵区', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2038', '远安县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2039', '兴山县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2040', '秭归县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2041', '长阳土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2042', '五峰土家族自治县', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2043', '宜都市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2044', '当阳市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2045', '枝江市', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2046', '襄城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2047', '樊城区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2048', '襄阳区', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2049', '南漳县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2050', '谷城县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2051', '保康县', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2052', '老河口市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2053', '枣阳市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2054', '宜城市', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2055', '梁子湖区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2056', '华容区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2057', '鄂城区', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2058', '东宝区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2059', '掇刀区', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2060', '京山县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2061', '沙洋县', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2062', '钟祥市', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2063', '孝南区', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2064', '孝昌县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2065', '大悟县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2066', '云梦县', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2067', '应城市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2068', '安陆市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2069', '汉川市', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2070', '沙市区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2071', '荆州区', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2072', '公安县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2073', '监利县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2074', '江陵县', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2075', '石首市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2076', '洪湖市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2077', '松滋市', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2078', '黄州区', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2079', '团风县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2080', '红安县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2081', '罗田县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2082', '英山县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2083', '浠水县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2084', '蕲春县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2085', '黄梅县', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2086', '麻城市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2087', '武穴市', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2088', '咸安区', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2089', '嘉鱼县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2090', '通城县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2091', '崇阳县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2092', '通山县', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2093', '赤壁市', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2094', '曾都区', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2095', '广水市', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2096', '恩施市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2097', '利川市', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2098', '建始县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2099', '巴东县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2100', '宣恩县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2101', '咸丰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2102', '来凤县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2103', '鹤峰县', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2104', '芙蓉区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2105', '天心区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2106', '岳麓区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2107', '开福区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2108', '雨花区', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2109', '长沙县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2110', '望城县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2111', '宁乡县', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2112', '浏阳市', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2113', '荷塘区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2114', '芦淞区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2115', '石峰区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2116', '天元区', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2117', '株洲县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2118', '攸县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2119', '茶陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2120', '炎陵县', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2121', '醴陵市', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2122', '雨湖区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2123', '岳塘区', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2124', '湘潭县', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2125', '湘乡市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2126', '韶山市', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2127', '珠晖区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2128', '雁峰区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2129', '石鼓区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2130', '蒸湘区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2131', '南岳区', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2132', '衡阳县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2133', '衡南县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2134', '衡山县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2135', '衡东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2136', '祁东县', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2137', '耒阳市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2138', '常宁市', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2139', '双清区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2140', '大祥区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2141', '北塔区', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2142', '邵东县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2143', '新邵县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2144', '邵阳县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2145', '隆回县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2146', '洞口县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2147', '绥宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2148', '新宁县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2149', '城步苗族自治县', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2150', '武冈市', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2151', '岳阳楼区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2152', '云溪区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2153', '君山区', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2154', '岳阳县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2155', '华容县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2156', '湘阴县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2157', '平江县', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2158', '汨罗市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2159', '临湘市', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2160', '武陵区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2161', '鼎城区', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2162', '安乡县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2163', '汉寿县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2164', '澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2165', '临澧县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2166', '桃源县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2167', '石门县', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2168', '津市市', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2169', '永定区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2170', '武陵源区', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2171', '慈利县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2172', '桑植县', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2173', '资阳区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2174', '赫山区', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2175', '南县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2176', '桃江县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2177', '安化县', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2178', '沅江市', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2179', '北湖区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2180', '苏仙区', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2181', '桂阳县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2182', '宜章县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2183', '永兴县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2184', '嘉禾县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2185', '临武县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2186', '汝城县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2187', '桂东县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2188', '安仁县', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2189', '资兴市', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2190', '零陵区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2191', '冷水滩区', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2192', '祁阳县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2193', '东安县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2194', '双牌县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2195', '道县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2196', '江永县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2197', '宁远县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2198', '蓝山县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2199', '新田县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2200', '江华瑶族自治县', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2201', '鹤城区', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2202', '中方县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2203', '沅陵县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2204', '辰溪县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2205', '溆浦县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2206', '会同县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2207', '麻阳苗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2208', '新晃侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2209', '芷江侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2210', '靖州苗族侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2211', '通道侗族自治县', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2212', '洪江市', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2213', '娄星区', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2214', '双峰县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2215', '新化县', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2216', '冷水江市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2217', '涟源市', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2218', '吉首市', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2219', '泸溪县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2220', '凤凰县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2221', '花垣县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2222', '保靖县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2223', '古丈县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2224', '永顺县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2225', '龙山县', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2226', '荔湾区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2227', '越秀区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2228', '海珠区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2229', '天河区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2230', '白云区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2231', '黄埔区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2232', '番禺区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2233', '花都区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2234', '南沙区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2235', '萝岗区', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2236', '增城市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2237', '从化市', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2238', '武江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2239', '浈江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2240', '曲江区', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2241', '始兴县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2242', '仁化县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2243', '翁源县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2244', '乳源瑶族自治县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2245', '新丰县', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2246', '乐昌市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2247', '南雄市', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2248', '罗湖区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2249', '福田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2250', '南山区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2251', '宝安区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2252', '龙岗区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2253', '盐田区', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2254', '香洲区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2255', '斗门区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2256', '金湾区', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2257', '龙湖区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2258', '金平区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2259', '濠江区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2260', '潮阳区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2261', '潮南区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2262', '澄海区', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2263', '南澳县', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2264', '禅城区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2265', '南海区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2266', '顺德区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2267', '三水区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2268', '高明区', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2269', '蓬江区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2270', '江海区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2271', '新会区', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2272', '台山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2273', '开平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2274', '鹤山市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2275', '恩平市', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2276', '赤坎区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2277', '霞山区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2278', '坡头区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2279', '麻章区', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2280', '遂溪县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2281', '徐闻县', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2282', '廉江市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2283', '雷州市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2284', '吴川市', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2285', '茂南区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2286', '茂港区', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2287', '电白县', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2288', '高州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2289', '化州市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2290', '信宜市', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2291', '端州区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2292', '鼎湖区', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2293', '广宁县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2294', '怀集县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2295', '封开县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2296', '德庆县', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2297', '高要市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2298', '四会市', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2299', '惠城区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2300', '惠阳区', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2301', '博罗县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2302', '惠东县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2303', '龙门县', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2304', '梅江区', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2305', '梅县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2306', '大埔县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2307', '丰顺县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2308', '五华县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2309', '平远县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2310', '蕉岭县', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2311', '兴宁市', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2312', '城区', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2313', '海丰县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2314', '陆河县', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2315', '陆丰市', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2316', '源城区', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2317', '紫金县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2318', '龙川县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2319', '连平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2320', '和平县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2321', '东源县', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2322', '江城区', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2323', '阳西县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2324', '阳东县', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2325', '阳春市', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2326', '清城区', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2327', '佛冈县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2328', '阳山县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2329', '连山壮族瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2330', '连南瑶族自治县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2331', '清新县', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2332', '英德市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2333', '连州市', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2334', '湘桥区', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2335', '潮安县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2336', '饶平县', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2337', '榕城区', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2338', '揭东县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2339', '揭西县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2340', '惠来县', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2341', '普宁市', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2342', '云城区', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2343', '新兴县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2344', '郁南县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2345', '云安县', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2346', '罗定市', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2347', '兴宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2348', '青秀区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2349', '江南区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2350', '西乡塘区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2351', '良庆区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2352', '邕宁区', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2353', '武鸣县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2354', '隆安县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2355', '马山县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2356', '上林县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2357', '宾阳县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2358', '横县', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2359', '城中区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2360', '鱼峰区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2361', '柳南区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2362', '柳北区', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2363', '柳江县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2364', '柳城县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2365', '鹿寨县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2366', '融安县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2367', '融水苗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2368', '三江侗族自治县', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2369', '秀峰区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2370', '叠彩区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2371', '象山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2372', '七星区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2373', '雁山区', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2374', '阳朔县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2375', '临桂县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2376', '灵川县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2377', '全州县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2378', '兴安县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2379', '永福县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2380', '灌阳县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2381', '龙胜各族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2382', '资源县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2383', '平乐县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2384', '荔蒲县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2385', '恭城瑶族自治县', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2386', '万秀区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2387', '蝶山区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2388', '长洲区', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2389', '苍梧县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2390', '藤县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2391', '蒙山县', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2392', '岑溪市', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2393', '海城区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2394', '银海区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2395', '铁山港区', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2396', '合浦县', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2397', '港口区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2398', '防城区', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2399', '上思县', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2400', '东兴市', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2401', '钦南区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2402', '钦北区', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2403', '灵山县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2404', '浦北县', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2405', '港北区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2406', '港南区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2407', '覃塘区', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2408', '平南县', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2409', '桂平市', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2410', '玉州区', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2411', '容县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2412', '陆川县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2413', '博白县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2414', '兴业县', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2415', '北流市', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2416', '右江区', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2417', '田阳县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2418', '田东县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2419', '平果县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2420', '德保县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2421', '靖西县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2422', '那坡县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2423', '凌云县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2424', '乐业县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2425', '田林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2426', '西林县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2427', '隆林各族自治县', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2428', '八步区', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2429', '昭平县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2430', '钟山县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2431', '富川瑶族自治县', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2432', '金城江区', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2433', '南丹县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2434', '天峨县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2435', '凤山县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2436', '东兰县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2437', '罗城仫佬族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2438', '环江毛南族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2439', '巴马瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2440', '都安瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2441', '大化瑶族自治县', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2442', '宜州市', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2443', '兴宾区', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2444', '忻城县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2445', '象州县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2446', '武宣县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2447', '金秀瑶族自治县', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2448', '合山市', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2449', '江洲区', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2450', '扶绥县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2451', '宁明县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2452', '龙州县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2453', '大新县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2454', '天等县', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2455', '凭祥市', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2456', '秀英区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2457', '龙华区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2458', '琼山区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2459', '美兰区', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2460', '锦江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2461', '青羊区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2462', '金牛区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2463', '武侯区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2464', '成华区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2465', '龙泉驿区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2466', '青白江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2467', '新都区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2468', '温江区', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2469', '金堂县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2470', '双流县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2471', '郫县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2472', '大邑县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2473', '蒲江县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2474', '新津县', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2475', '都江堰市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2476', '彭州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2477', '邛崃市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2478', '崇州市', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2479', '自流井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2480', '贡井区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2481', '大安区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2482', '沿滩区', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2483', '荣县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2484', '富顺县', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2485', '东区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2486', '西区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2487', '仁和区', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2488', '米易县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2489', '盐边县', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2490', '江阳区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2491', '纳溪区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2492', '龙马潭区', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2493', '泸县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2494', '合江县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2495', '叙永县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2496', '古蔺县', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2497', '旌阳区', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2498', '中江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2499', '罗江县', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2500', '广汉市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2501', '什邡市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2502', '绵竹市', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2503', '涪城区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2504', '游仙区', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2505', '三台县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2506', '盐亭县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2507', '安县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2508', '梓潼县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2509', '北川羌族自治县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2510', '平武县', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2511', '江油市', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2512', '市中区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2513', '元坝区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2514', '朝天区', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2515', '旺苍县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2516', '青川县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2517', '剑阁县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2518', '苍溪县', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2519', '船山区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2520', '安居区', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2521', '蓬溪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2522', '射洪县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2523', '大英县', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2524', '市中区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2525', '东兴区', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2526', '威远县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2527', '资中县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2528', '隆昌县', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2529', '市中区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2530', '沙湾区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2531', '五通桥区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2532', '金口河区', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2533', '犍为县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2534', '井研县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2535', '夹江县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2536', '沐川县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2537', '峨边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2538', '马边彝族自治县', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2539', '峨眉山市', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2540', '顺庆区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2541', '高坪区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2542', '嘉陵区', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2543', '南部县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2544', '营山县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2545', '蓬安县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2546', '仪陇县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2547', '西充县', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2548', '阆中市', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2549', '东坡区', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2550', '仁寿县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2551', '彭山县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2552', '洪雅县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2553', '丹棱县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2554', '青神县', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2555', '翠屏区', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2556', '宜宾县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2557', '南溪县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2558', '江安县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2559', '长宁县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2560', '高县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2561', '珙县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2562', '筠连县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2563', '兴文县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2564', '屏山县', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2565', '广安区', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2566', '岳池县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2567', '武胜县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2568', '邻水县', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2569', '华蓥市', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2570', '通川区', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2571', '达县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2572', '宣汉县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2573', '开江县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2574', '大竹县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2575', '渠县', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2576', '万源市', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2577', '雨城区', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2578', '名山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2579', '荥经县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2580', '汉源县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2581', '石棉县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2582', '天全县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2583', '芦山县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2584', '宝兴县', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2585', '巴州区', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2586', '通江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2587', '南江县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2588', '平昌县', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2589', '雁江区', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2590', '安岳县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2591', '乐至县', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2592', '简阳市', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2593', '汶川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2594', '理县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2595', '茂县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2596', '松潘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2597', '九寨沟县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2598', '金川县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2599', '小金县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2600', '黑水县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2601', '马尔康县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2602', '壤塘县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2603', '阿坝县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2604', '若尔盖县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2605', '红原县', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2606', '康定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2607', '泸定县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2608', '丹巴县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2609', '九龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2610', '雅江县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2611', '道孚县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2612', '炉霍县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2613', '甘孜县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2614', '新龙县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2615', '德格县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2616', '白玉县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2617', '石渠县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2618', '色达县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2619', '理塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2620', '巴塘县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2621', '乡城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2622', '稻城县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2623', '得荣县', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2624', '西昌市', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2625', '木里藏族自治县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2626', '盐源县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2627', '德昌县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2628', '会理县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2629', '会东县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2630', '宁南县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2631', '普格县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2632', '布拖县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2633', '金阳县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2634', '昭觉县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2635', '喜德县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2636', '冕宁县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2637', '越西县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2638', '甘洛县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2639', '美姑县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2640', '雷波县', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2641', '南明区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2642', '云岩区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2643', '花溪区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2644', '乌当区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2645', '白云区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2646', '小河区', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2647', '开阳县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2648', '息烽县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2649', '修文县', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2650', '清镇市', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2651', '钟山区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2652', '六枝特区', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2653', '水城县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2654', '盘县', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2655', '红花岗区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2656', '汇川区', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2657', '遵义县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2658', '桐梓县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2659', '绥阳县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2660', '正安县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2661', '道真仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2662', '务川仡佬族苗族自治县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2663', '凤冈县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2664', '湄潭县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2665', '余庆县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2666', '习水县', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2667', '赤水市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2668', '仁怀市', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2669', '西秀区', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2670', '平坝县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2671', '普定县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2672', '镇宁布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2673', '关岭布依族苗族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2674', '紫云苗族布依族自治县', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2675', '铜仁市', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2676', '江口县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2677', '玉屏侗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2678', '石阡县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2679', '思南县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2680', '印江土家族苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2681', '德江县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2682', '沿河土家族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2683', '松桃苗族自治县', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2684', '万山特区', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2685', '兴义市', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2686', '兴仁县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2687', '普安县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2688', '晴隆县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2689', '贞丰县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2690', '望谟县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2691', '册亨县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2692', '安龙县', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2693', '毕节市', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2694', '大方县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2695', '黔西县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2696', '金沙县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2697', '织金县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2698', '纳雍县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2699', '威宁彝族回族苗族自治县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2700', '赫章县', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2701', '凯里市', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2702', '黄平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2703', '施秉县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2704', '三穗县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2705', '镇远县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2706', '岑巩县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2707', '天柱县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2708', '锦屏县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2709', '剑河县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2710', '台江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2711', '黎平县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2712', '榕江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2713', '从江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2714', '雷山县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2715', '麻江县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2716', '丹寨县', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2717', '都匀市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2718', '福泉市', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2719', '荔波县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2720', '贵定县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2721', '瓮安县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2722', '独山县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2723', '平塘县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2724', '罗甸县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2725', '长顺县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2726', '龙里县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2727', '惠水县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2728', '三都水族自治县', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2729', '五华区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2730', '盘龙区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2731', '官渡区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2732', '西山区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2733', '东川区', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2734', '呈贡县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2735', '晋宁县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2736', '富民县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2737', '宜良县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2738', '石林彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2739', '嵩明县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2740', '禄劝彝族苗族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2741', '寻甸回族彝族自治县', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2742', '安宁市', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2743', '麒麟区', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2744', '马龙县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2745', '陆良县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2746', '师宗县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2747', '罗平县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2748', '富源县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2749', '会泽县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2750', '沾益县', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2751', '宣威市', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2752', '红塔区', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2753', '江川县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2754', '澄江县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2755', '通海县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2756', '华宁县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2757', '易门县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2758', '峨山彝族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2759', '新平彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2760', '元江哈尼族彝族傣族自治县', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2761', '隆阳区', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2762', '施甸县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2763', '腾冲县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2764', '龙陵县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2765', '昌宁县', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2766', '昭阳区', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2767', '鲁甸县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2768', '巧家县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2769', '盐津县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2770', '大关县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2771', '永善县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2772', '绥江县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2773', '镇雄县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2774', '彝良县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2775', '威信县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2776', '水富县', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2777', '古城区', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2778', '玉龙纳西族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2779', '永胜县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2780', '华坪县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2781', '宁蒗彝族自治县', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2782', '翠云区', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2783', '普洱哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2784', '墨江哈尼族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2785', '景东彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2786', '景谷傣族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2787', '镇沅彝族哈尼族拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2788', '江城哈尼族彝族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2789', '孟连傣族拉祜族佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2790', '澜沧拉祜族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2791', '西盟佤族自治县', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2792', '临翔区', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2793', '凤庆县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2794', '云县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2795', '永德县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2796', '镇康县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2797', '双江拉祜族佤族布朗族傣族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2798', '耿马傣族佤族自治县', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2799', '沧源佤族自治县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2800', '楚雄市', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2801', '双柏县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2802', '牟定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2803', '南华县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2804', '姚安县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2805', '大姚县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2806', '永仁县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2807', '元谋县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2808', '武定县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2809', '禄丰县', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2810', '个旧市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2811', '开远市', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2812', '蒙自县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2813', '屏边苗族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2814', '建水县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2815', '石屏县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2816', '弥勒县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2817', '泸西县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2818', '元阳县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2819', '红河县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2820', '金平苗族瑶族傣族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2821', '绿春县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2822', '河口瑶族自治县', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2823', '文山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2824', '砚山县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2825', '西畴县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2826', '麻栗坡县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2827', '马关县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2828', '丘北县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2829', '广南县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2830', '富宁县', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2831', '景洪市', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2832', '勐海县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2833', '勐腊县', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2834', '大理市', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2835', '漾濞彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2836', '祥云县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2837', '宾川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2838', '弥渡县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2839', '南涧彝族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2840', '巍山彝族回族自治县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2841', '永平县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2842', '云龙县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2843', '洱源县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2844', '剑川县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2845', '鹤庆县', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2846', '瑞丽市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2847', '潞西市', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2848', '梁河县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2849', '盈江县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2850', '陇川县', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2851', '泸水县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2852', '福贡县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2853', '贡山独龙族怒族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2854', '兰坪白族普米族自治县', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2855', '香格里拉县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2856', '德钦县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2857', '维西傈僳族自治县', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2858', '城关区', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2859', '林周县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2860', '当雄县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2861', '尼木县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2862', '曲水县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2863', '堆龙德庆县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2864', '达孜县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2865', '墨竹工卡县', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2866', '昌都县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2867', '江达县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2868', '贡觉县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2869', '类乌齐县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2870', '丁青县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2871', '察雅县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2872', '八宿县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2873', '左贡县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2874', '芒康县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2875', '洛隆县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2876', '边坝县', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2877', '乃东县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2878', '扎囊县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2879', '贡嘎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2880', '桑日县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2881', '琼结县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2882', '曲松县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2883', '措美县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2884', '洛扎县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2885', '加查县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2886', '隆子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2887', '错那县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2888', '浪卡子县', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2889', '日喀则市', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2890', '南木林县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2891', '江孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2892', '定日县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2893', '萨迦县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2894', '拉孜县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2895', '昂仁县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2896', '谢通门县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2897', '白朗县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2898', '仁布县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2899', '康马县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2900', '定结县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2901', '仲巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2902', '亚东县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2903', '吉隆县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2904', '聂拉木县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2905', '萨嘎县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2906', '岗巴县', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2907', '那曲县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2908', '嘉黎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2909', '比如县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2910', '聂荣县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2911', '安多县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2912', '申扎县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2913', '索县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2914', '班戈县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2915', '巴青县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2916', '尼玛县', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2917', '普兰县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2918', '札达县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2919', '噶尔县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2920', '日土县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2921', '革吉县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2922', '改则县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2923', '措勤县', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2924', '林芝县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2925', '工布江达县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2926', '米林县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2927', '墨脱县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2928', '波密县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2929', '察隅县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2930', '朗县', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2931', '新城区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2932', '碑林区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2933', '莲湖区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2934', '灞桥区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2935', '未央区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2936', '雁塔区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2937', '阎良区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2938', '临潼区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2939', '长安区', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2940', '蓝田县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2941', '周至县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2942', '户县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2943', '高陵县', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2944', '王益区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2945', '印台区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2946', '耀州区', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2947', '宜君县', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2948', '渭滨区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2949', '金台区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2950', '陈仓区', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2951', '凤翔县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2952', '岐山县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2953', '扶风县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2954', '眉县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2955', '陇县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2956', '千阳县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2957', '麟游县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2958', '凤县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2959', '太白县', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2960', '秦都区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2961', '杨凌区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2962', '渭城区', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2963', '三原县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2964', '泾阳县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2965', '乾县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2966', '礼泉县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2967', '永寿县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2968', '彬县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2969', '长武县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2970', '旬邑县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2971', '淳化县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2972', '武功县', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2973', '兴平市', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2974', '临渭区', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2975', '华县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2976', '潼关县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2977', '大荔县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2978', '合阳县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2979', '澄城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2980', '蒲城县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2981', '白水县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2982', '富平县', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2983', '韩城市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2984', '华阴市', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2985', '宝塔区', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2986', '延长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2987', '延川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2988', '子长县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2989', '安塞县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2990', '志丹县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2991', '吴起县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2992', '甘泉县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2993', '富县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2994', '洛川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2995', '宜川县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2996', '黄龙县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2997', '黄陵县', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2998', '汉台区', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('2999', '南郑县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3000', '城固县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3001', '洋县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3002', '西乡县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3003', '勉县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3004', '宁强县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3005', '略阳县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3006', '镇巴县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3007', '留坝县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3008', '佛坪县', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3009', '榆阳区', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3010', '神木县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3011', '府谷县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3012', '横山县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3013', '靖边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3014', '定边县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3015', '绥德县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3016', '米脂县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3017', '佳县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3018', '吴堡县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3019', '清涧县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3020', '子洲县', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3021', '汉滨区', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3022', '汉阴县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3023', '石泉县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3024', '宁陕县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3025', '紫阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3026', '岚皋县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3027', '平利县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3028', '镇坪县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3029', '旬阳县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3030', '白河县', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3031', '商州区', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3032', '洛南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3033', '丹凤县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3034', '商南县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3035', '山阳县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3036', '镇安县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3037', '柞水县', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3038', '城关区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3039', '七里河区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3040', '西固区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3041', '安宁区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3042', '红古区', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3043', '永登县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3044', '皋兰县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3045', '榆中县', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3046', '金川区', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3047', '永昌县', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3048', '白银区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3049', '平川区', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3050', '靖远县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3051', '会宁县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3052', '景泰县', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3053', '秦城区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3054', '北道区', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3055', '清水县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3056', '秦安县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3057', '甘谷县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3058', '武山县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3059', '张家川回族自治县', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3060', '凉州区', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3061', '民勤县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3062', '古浪县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3063', '天祝藏族自治县', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3064', '甘州区', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3065', '肃南裕固族自治县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3066', '民乐县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3067', '临泽县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3068', '高台县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3069', '山丹县', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3070', '崆峒区', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3071', '泾川县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3072', '灵台县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3073', '崇信县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3074', '华亭县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3075', '庄浪县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3076', '静宁县', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3077', '肃州区', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3078', '金塔县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3079', '瓜州县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3080', '肃北蒙古族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3081', '阿克塞哈萨克族自治县', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3082', '玉门市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3083', '敦煌市', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3084', '西峰区', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3085', '庆城县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3086', '环县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3087', '华池县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3088', '合水县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3089', '正宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3090', '宁县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3091', '镇原县', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3092', '安定区', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3093', '通渭县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3094', '陇西县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3095', '渭源县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3096', '临洮县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3097', '漳县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3098', '岷县', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3099', '武都区', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3100', '成县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3101', '文县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3102', '宕昌县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3103', '康县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3104', '西和县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3105', '礼县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3106', '徽县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3107', '两当县', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3108', '临夏市', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3109', '临夏县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3110', '康乐县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3111', '永靖县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3112', '广河县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3113', '和政县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3114', '东乡族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3115', '积石山保安族东乡族撒拉族自治县', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3116', '合作市', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3117', '临潭县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3118', '卓尼县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3119', '舟曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3120', '迭部县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3121', '玛曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3122', '碌曲县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3123', '夏河县', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3124', '城东区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3125', '城中区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3126', '城西区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3127', '城北区', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3128', '大通回族土族自治县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3129', '湟中县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3130', '湟源县', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3131', '平安县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3132', '民和回族土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3133', '乐都县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3134', '互助土族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3135', '化隆回族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3136', '循化撒拉族自治县', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3137', '门源回族自治县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3138', '祁连县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3139', '海晏县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3140', '刚察县', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3141', '同仁县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3142', '尖扎县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3143', '泽库县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3144', '河南蒙古族自治县', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3145', '共和县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3146', '同德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3147', '贵德县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3148', '兴海县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3149', '贵南县', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3150', '玛沁县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3151', '班玛县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3152', '甘德县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3153', '达日县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3154', '久治县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3155', '玛多县', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3156', '玉树县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3157', '杂多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3158', '称多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3159', '治多县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3160', '囊谦县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3161', '曲麻莱县', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3162', '格尔木市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3163', '德令哈市', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3164', '乌兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3165', '都兰县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3166', '天峻县', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3167', '兴庆区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3168', '西夏区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3169', '金凤区', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3170', '永宁县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3171', '贺兰县', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3172', '灵武市', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3173', '大武口区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3174', '惠农区', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3175', '平罗县', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3176', '利通区', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3177', '盐池县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3178', '同心县', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3179', '青铜峡市', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3180', '原州区', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3181', '西吉县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3182', '隆德县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3183', '泾源县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3184', '彭阳县', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3185', '沙坡头区', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3186', '中宁县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3187', '海原县', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3188', '天山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3189', '沙依巴克区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3190', '新市区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3191', '水磨沟区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3192', '头屯河区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3193', '达坂城区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3194', '东山区', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3195', '乌鲁木齐县', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3196', '独山子区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3197', '克拉玛依区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3198', '白碱滩区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3199', '乌尔禾区', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3200', '吐鲁番市', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3201', '鄯善县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3202', '托克逊县', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3203', '哈密市', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3204', '巴里坤哈萨克自治县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3205', '伊吾县', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3206', '昌吉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3207', '阜康市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3208', '米泉市', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3209', '呼图壁县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3210', '玛纳斯县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3211', '奇台县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3212', '吉木萨尔县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3213', '木垒哈萨克自治县', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3214', '博乐市', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3215', '精河县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3216', '温泉县', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3217', '库尔勒市', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3218', '轮台县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3219', '尉犁县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3220', '若羌县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3221', '且末县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3222', '焉耆回族自治县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3223', '和静县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3224', '和硕县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3225', '博湖县', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3226', '阿克苏市', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3227', '温宿县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3228', '库车县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3229', '沙雅县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3230', '新和县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3231', '拜城县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3232', '乌什县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3233', '阿瓦提县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3234', '柯坪县', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3235', '阿图什市', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3236', '阿克陶县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3237', '阿合奇县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3238', '乌恰县', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3239', '喀什市', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3240', '疏附县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3241', '疏勒县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3242', '英吉沙县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3243', '泽普县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3244', '莎车县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3245', '叶城县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3246', '麦盖提县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3247', '岳普湖县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3248', '伽师县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3249', '巴楚县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3250', '塔什库尔干塔吉克自治县', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3251', '和田市', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3252', '和田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3253', '墨玉县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3254', '皮山县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3255', '洛浦县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3256', '策勒县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3257', '于田县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3258', '民丰县', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3259', '伊宁市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3260', '奎屯市', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3261', '伊宁县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3262', '察布查尔锡伯自治县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3263', '霍城县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3264', '巩留县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3265', '新源县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3266', '昭苏县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3267', '特克斯县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3268', '尼勒克县', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3269', '塔城市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3270', '乌苏市', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3271', '额敏县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3272', '沙湾县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3273', '托里县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3274', '裕民县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3275', '和布克赛尔蒙古自治县', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3276', '阿勒泰市', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3277', '布尔津县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3278', '富蕴县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3279', '福海县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3280', '哈巴河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3281', '青河县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3282', '吉木乃县', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3358', '钓鱼岛', '', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `allwww_linkage` VALUES ('3359', '钓鱼岛', '', '3358', '0', '', '1', '0', '', null, '0');

-- ----------------------------
-- Table structure for allwww_log
-- ----------------------------
DROP TABLE IF EXISTS `allwww_log`;
CREATE TABLE `allwww_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=2943 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_log
-- ----------------------------
INSERT INTO `allwww_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:40:59');
INSERT INTO `allwww_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:41:05');
INSERT INTO `allwww_log` VALUES ('3', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:42:54');
INSERT INTO `allwww_log` VALUES ('4', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:47:44');
INSERT INTO `allwww_log` VALUES ('5', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:54:40');
INSERT INTO `allwww_log` VALUES ('6', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:55:41');
INSERT INTO `allwww_log` VALUES ('7', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:55:43');
INSERT INTO `allwww_log` VALUES ('8', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:55:53');
INSERT INTO `allwww_log` VALUES ('9', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:56:12');
INSERT INTO `allwww_log` VALUES ('10', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 16:56:44');
INSERT INTO `allwww_log` VALUES ('11', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 17:17:49');
INSERT INTO `allwww_log` VALUES ('12', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 17:18:01');
INSERT INTO `allwww_log` VALUES ('13', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:30:31');
INSERT INTO `allwww_log` VALUES ('14', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:37:50');
INSERT INTO `allwww_log` VALUES ('15', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 17:38:42');
INSERT INTO `allwww_log` VALUES ('16', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 17:38:53');
INSERT INTO `allwww_log` VALUES ('17', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:39:04');
INSERT INTO `allwww_log` VALUES ('18', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:39:19');
INSERT INTO `allwww_log` VALUES ('19', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:40:26');
INSERT INTO `allwww_log` VALUES ('20', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:40:32');
INSERT INTO `allwww_log` VALUES ('21', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:40:52');
INSERT INTO `allwww_log` VALUES ('22', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:41:33');
INSERT INTO `allwww_log` VALUES ('23', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:41:37');
INSERT INTO `allwww_log` VALUES ('24', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:42:18');
INSERT INTO `allwww_log` VALUES ('25', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:42:56');
INSERT INTO `allwww_log` VALUES ('26', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:42:57');
INSERT INTO `allwww_log` VALUES ('27', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:43:00');
INSERT INTO `allwww_log` VALUES ('28', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:43:02');
INSERT INTO `allwww_log` VALUES ('29', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:43:04');
INSERT INTO `allwww_log` VALUES ('30', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:43:06');
INSERT INTO `allwww_log` VALUES ('31', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:43:37');
INSERT INTO `allwww_log` VALUES ('32', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:53:24');
INSERT INTO `allwww_log` VALUES ('33', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:55:36');
INSERT INTO `allwww_log` VALUES ('34', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:57:47');
INSERT INTO `allwww_log` VALUES ('35', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:57:51');
INSERT INTO `allwww_log` VALUES ('36', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:58:10');
INSERT INTO `allwww_log` VALUES ('37', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:58:37');
INSERT INTO `allwww_log` VALUES ('38', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:58:45');
INSERT INTO `allwww_log` VALUES ('39', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 17:59:55');
INSERT INTO `allwww_log` VALUES ('40', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:02:27');
INSERT INTO `allwww_log` VALUES ('41', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:02:31');
INSERT INTO `allwww_log` VALUES ('42', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 18:03:43');
INSERT INTO `allwww_log` VALUES ('43', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2014-05-06 18:03:50');
INSERT INTO `allwww_log` VALUES ('44', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:09:28');
INSERT INTO `allwww_log` VALUES ('45', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:17:41');
INSERT INTO `allwww_log` VALUES ('46', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:17:45');
INSERT INTO `allwww_log` VALUES ('47', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:18:09');
INSERT INTO `allwww_log` VALUES ('48', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:18:12');
INSERT INTO `allwww_log` VALUES ('49', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:18:42');
INSERT INTO `allwww_log` VALUES ('50', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:18:46');
INSERT INTO `allwww_log` VALUES ('51', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:19:19');
INSERT INTO `allwww_log` VALUES ('52', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:19:23');
INSERT INTO `allwww_log` VALUES ('53', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:20:17');
INSERT INTO `allwww_log` VALUES ('54', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:20:21');
INSERT INTO `allwww_log` VALUES ('55', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:20:56');
INSERT INTO `allwww_log` VALUES ('56', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:21:00');
INSERT INTO `allwww_log` VALUES ('57', '', '0', 'content', '', 'type_manage', '?m=content&c=type_manage&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:21:19');
INSERT INTO `allwww_log` VALUES ('58', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:22:42');
INSERT INTO `allwww_log` VALUES ('59', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:22:46');
INSERT INTO `allwww_log` VALUES ('60', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=listinfo', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:23:03');
INSERT INTO `allwww_log` VALUES ('61', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:23:39');
INSERT INTO `allwww_log` VALUES ('62', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:23:42');
INSERT INTO `allwww_log` VALUES ('63', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:24:00');
INSERT INTO `allwww_log` VALUES ('64', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:24:33');
INSERT INTO `allwww_log` VALUES ('65', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:24:36');
INSERT INTO `allwww_log` VALUES ('66', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:25:00');
INSERT INTO `allwww_log` VALUES ('67', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:25:03');
INSERT INTO `allwww_log` VALUES ('68', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:26:52');
INSERT INTO `allwww_log` VALUES ('69', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:26:55');
INSERT INTO `allwww_log` VALUES ('70', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:27:04');
INSERT INTO `allwww_log` VALUES ('71', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:27:30');
INSERT INTO `allwww_log` VALUES ('72', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:27:33');
INSERT INTO `allwww_log` VALUES ('73', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:28:05');
INSERT INTO `allwww_log` VALUES ('74', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:28:08');
INSERT INTO `allwww_log` VALUES ('75', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:28:54');
INSERT INTO `allwww_log` VALUES ('76', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:28:57');
INSERT INTO `allwww_log` VALUES ('77', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:29:31');
INSERT INTO `allwww_log` VALUES ('78', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:29:35');
INSERT INTO `allwww_log` VALUES ('79', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:30:14');
INSERT INTO `allwww_log` VALUES ('80', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:30:34');
INSERT INTO `allwww_log` VALUES ('81', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:30:38');
INSERT INTO `allwww_log` VALUES ('82', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:30:50');
INSERT INTO `allwww_log` VALUES ('83', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:30:53');
INSERT INTO `allwww_log` VALUES ('84', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:03');
INSERT INTO `allwww_log` VALUES ('85', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:06');
INSERT INTO `allwww_log` VALUES ('86', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:15');
INSERT INTO `allwww_log` VALUES ('87', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:19');
INSERT INTO `allwww_log` VALUES ('88', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:29');
INSERT INTO `allwww_log` VALUES ('89', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:31:32');
INSERT INTO `allwww_log` VALUES ('90', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:02');
INSERT INTO `allwww_log` VALUES ('91', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:06');
INSERT INTO `allwww_log` VALUES ('92', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:24');
INSERT INTO `allwww_log` VALUES ('93', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:28');
INSERT INTO `allwww_log` VALUES ('94', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:55');
INSERT INTO `allwww_log` VALUES ('95', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:33:59');
INSERT INTO `allwww_log` VALUES ('96', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:34:19');
INSERT INTO `allwww_log` VALUES ('97', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:34:23');
INSERT INTO `allwww_log` VALUES ('98', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:34:49');
INSERT INTO `allwww_log` VALUES ('99', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:34:53');
INSERT INTO `allwww_log` VALUES ('100', '', '0', 'admin', '', 'keylink', '?m=admin&c=keylink&a=add', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:35:24');
INSERT INTO `allwww_log` VALUES ('101', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:35:49');
INSERT INTO `allwww_log` VALUES ('102', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2014-05-06 18:35:53');
INSERT INTO `allwww_log` VALUES ('103', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-02-02 10:16:05');
INSERT INTO `allwww_log` VALUES ('104', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-02-02 10:16:05');
INSERT INTO `allwww_log` VALUES ('105', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2015-02-02 10:16:10');
INSERT INTO `allwww_log` VALUES ('106', '', '0', 'link', '', 'link', '?m=link&c=link&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:26');
INSERT INTO `allwww_log` VALUES ('107', '', '0', 'link', '', 'link', '?m=link&c=link&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:30');
INSERT INTO `allwww_log` VALUES ('108', '', '0', 'link', '', 'link', '?m=link&c=link&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:34');
INSERT INTO `allwww_log` VALUES ('109', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:42');
INSERT INTO `allwww_log` VALUES ('110', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:50');
INSERT INTO `allwww_log` VALUES ('111', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:54');
INSERT INTO `allwww_log` VALUES ('112', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:16:58');
INSERT INTO `allwww_log` VALUES ('113', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:01');
INSERT INTO `allwww_log` VALUES ('114', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:04');
INSERT INTO `allwww_log` VALUES ('115', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:07');
INSERT INTO `allwww_log` VALUES ('116', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:11');
INSERT INTO `allwww_log` VALUES ('117', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:14');
INSERT INTO `allwww_log` VALUES ('118', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:17');
INSERT INTO `allwww_log` VALUES ('119', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:20');
INSERT INTO `allwww_log` VALUES ('120', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:23');
INSERT INTO `allwww_log` VALUES ('121', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:26');
INSERT INTO `allwww_log` VALUES ('122', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:33');
INSERT INTO `allwww_log` VALUES ('123', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:43');
INSERT INTO `allwww_log` VALUES ('124', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2015-02-02 10:17:53');
INSERT INTO `allwww_log` VALUES ('125', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-02 09:04:10');
INSERT INTO `allwww_log` VALUES ('126', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-02 09:04:25');
INSERT INTO `allwww_log` VALUES ('127', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:07:03');
INSERT INTO `allwww_log` VALUES ('128', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:07:04');
INSERT INTO `allwww_log` VALUES ('129', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:10:57');
INSERT INTO `allwww_log` VALUES ('130', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:11:00');
INSERT INTO `allwww_log` VALUES ('131', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:12:16');
INSERT INTO `allwww_log` VALUES ('132', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:12:19');
INSERT INTO `allwww_log` VALUES ('133', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:12:21');
INSERT INTO `allwww_log` VALUES ('134', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:12:46');
INSERT INTO `allwww_log` VALUES ('135', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:12:57');
INSERT INTO `allwww_log` VALUES ('136', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:14:03');
INSERT INTO `allwww_log` VALUES ('137', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:14:06');
INSERT INTO `allwww_log` VALUES ('138', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:14:09');
INSERT INTO `allwww_log` VALUES ('139', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:17:18');
INSERT INTO `allwww_log` VALUES ('140', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:17:35');
INSERT INTO `allwww_log` VALUES ('141', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=card', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:17:40');
INSERT INTO `allwww_log` VALUES ('142', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:06');
INSERT INTO `allwww_log` VALUES ('143', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:10');
INSERT INTO `allwww_log` VALUES ('144', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:11');
INSERT INTO `allwww_log` VALUES ('145', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:28');
INSERT INTO `allwww_log` VALUES ('146', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:31');
INSERT INTO `allwww_log` VALUES ('147', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:46');
INSERT INTO `allwww_log` VALUES ('148', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:49');
INSERT INTO `allwww_log` VALUES ('149', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:20:51');
INSERT INTO `allwww_log` VALUES ('150', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:21:10');
INSERT INTO `allwww_log` VALUES ('151', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:21:14');
INSERT INTO `allwww_log` VALUES ('152', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:21:15');
INSERT INTO `allwww_log` VALUES ('153', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:22:10');
INSERT INTO `allwww_log` VALUES ('154', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:22:13');
INSERT INTO `allwww_log` VALUES ('155', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-02 09:22:15');
INSERT INTO `allwww_log` VALUES ('156', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-04 10:29:31');
INSERT INTO `allwww_log` VALUES ('157', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-04 10:30:39');
INSERT INTO `allwww_log` VALUES ('158', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:37:31');
INSERT INTO `allwww_log` VALUES ('159', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:16');
INSERT INTO `allwww_log` VALUES ('160', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:23');
INSERT INTO `allwww_log` VALUES ('161', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:29');
INSERT INTO `allwww_log` VALUES ('162', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:33');
INSERT INTO `allwww_log` VALUES ('163', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:35');
INSERT INTO `allwww_log` VALUES ('164', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:36');
INSERT INTO `allwww_log` VALUES ('165', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-04 10:38:36');
INSERT INTO `allwww_log` VALUES ('166', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-06 16:21:56');
INSERT INTO `allwww_log` VALUES ('167', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-06 16:22:16');
INSERT INTO `allwww_log` VALUES ('168', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 16:22:47');
INSERT INTO `allwww_log` VALUES ('169', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 16:22:50');
INSERT INTO `allwww_log` VALUES ('170', '', '0', 'template', '', 'style', '?m=template&c=style&a=import', '', '1', 'admin', '127.0.0.1', '2016-06-06 16:23:13');
INSERT INTO `allwww_log` VALUES ('171', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2016-06-06 16:27:36');
INSERT INTO `allwww_log` VALUES ('172', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 16:28:06');
INSERT INTO `allwww_log` VALUES ('173', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 16:28:27');
INSERT INTO `allwww_log` VALUES ('174', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:10:38');
INSERT INTO `allwww_log` VALUES ('175', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:10:40');
INSERT INTO `allwww_log` VALUES ('176', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:10:54');
INSERT INTO `allwww_log` VALUES ('177', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:29:42');
INSERT INTO `allwww_log` VALUES ('178', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:30:51');
INSERT INTO `allwww_log` VALUES ('179', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:48:05');
INSERT INTO `allwww_log` VALUES ('180', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:49:28');
INSERT INTO `allwww_log` VALUES ('181', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:49:42');
INSERT INTO `allwww_log` VALUES ('182', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:49:58');
INSERT INTO `allwww_log` VALUES ('183', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:56:04');
INSERT INTO `allwww_log` VALUES ('184', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:56:15');
INSERT INTO `allwww_log` VALUES ('185', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:56:36');
INSERT INTO `allwww_log` VALUES ('186', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:56:51');
INSERT INTO `allwww_log` VALUES ('187', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:57:34');
INSERT INTO `allwww_log` VALUES ('188', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:57:41');
INSERT INTO `allwww_log` VALUES ('189', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:57:54');
INSERT INTO `allwww_log` VALUES ('190', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:57:56');
INSERT INTO `allwww_log` VALUES ('191', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-06 17:58:08');
INSERT INTO `allwww_log` VALUES ('192', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:20');
INSERT INTO `allwww_log` VALUES ('193', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:25');
INSERT INTO `allwww_log` VALUES ('194', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:27');
INSERT INTO `allwww_log` VALUES ('195', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:48');
INSERT INTO `allwww_log` VALUES ('196', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:51');
INSERT INTO `allwww_log` VALUES ('197', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:58:53');
INSERT INTO `allwww_log` VALUES ('198', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:59:26');
INSERT INTO `allwww_log` VALUES ('199', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-06 17:59:40');
INSERT INTO `allwww_log` VALUES ('200', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-07 08:35:13');
INSERT INTO `allwww_log` VALUES ('201', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-07 10:25:27');
INSERT INTO `allwww_log` VALUES ('202', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:36:47');
INSERT INTO `allwww_log` VALUES ('203', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:37:16');
INSERT INTO `allwww_log` VALUES ('204', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:39:45');
INSERT INTO `allwww_log` VALUES ('205', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:39:57');
INSERT INTO `allwww_log` VALUES ('206', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:40:46');
INSERT INTO `allwww_log` VALUES ('207', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:41:16');
INSERT INTO `allwww_log` VALUES ('208', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:41:18');
INSERT INTO `allwww_log` VALUES ('209', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:42:18');
INSERT INTO `allwww_log` VALUES ('210', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:44:03');
INSERT INTO `allwww_log` VALUES ('211', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:44:20');
INSERT INTO `allwww_log` VALUES ('212', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-07 10:44:45');
INSERT INTO `allwww_log` VALUES ('213', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-07 10:46:01');
INSERT INTO `allwww_log` VALUES ('214', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 11:30:21');
INSERT INTO `allwww_log` VALUES ('215', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 11:30:35');
INSERT INTO `allwww_log` VALUES ('216', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 11:30:57');
INSERT INTO `allwww_log` VALUES ('217', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 11:51:36');
INSERT INTO `allwww_log` VALUES ('218', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 11:57:00');
INSERT INTO `allwww_log` VALUES ('219', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 11:57:24');
INSERT INTO `allwww_log` VALUES ('220', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 11:59:30');
INSERT INTO `allwww_log` VALUES ('221', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 11:59:36');
INSERT INTO `allwww_log` VALUES ('222', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 11:59:41');
INSERT INTO `allwww_log` VALUES ('223', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:00:44');
INSERT INTO `allwww_log` VALUES ('224', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.220', '2016-06-07 12:01:30');
INSERT INTO `allwww_log` VALUES ('225', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.141', '2016-06-07 12:01:30');
INSERT INTO `allwww_log` VALUES ('226', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 12:01:36');
INSERT INTO `allwww_log` VALUES ('227', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.142', '2016-06-07 12:01:48');
INSERT INTO `allwww_log` VALUES ('228', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.204', '2016-06-07 12:01:49');
INSERT INTO `allwww_log` VALUES ('229', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:02:00');
INSERT INTO `allwww_log` VALUES ('230', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.201.79', '2016-06-07 12:02:02');
INSERT INTO `allwww_log` VALUES ('231', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.94', '2016-06-07 12:02:02');
INSERT INTO `allwww_log` VALUES ('232', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:02:26');
INSERT INTO `allwww_log` VALUES ('233', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:02:39');
INSERT INTO `allwww_log` VALUES ('234', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:02:57');
INSERT INTO `allwww_log` VALUES ('235', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:04:18');
INSERT INTO `allwww_log` VALUES ('236', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:05:39');
INSERT INTO `allwww_log` VALUES ('237', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:05:40');
INSERT INTO `allwww_log` VALUES ('238', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:05:51');
INSERT INTO `allwww_log` VALUES ('239', '', '0', 'comment', '', 'comment_admin', '?m=comment&c=comment_admin&a=lists', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:05:59');
INSERT INTO `allwww_log` VALUES ('240', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:06:18');
INSERT INTO `allwww_log` VALUES ('241', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:07:09');
INSERT INTO `allwww_log` VALUES ('242', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:07:30');
INSERT INTO `allwww_log` VALUES ('243', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=show', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:07:41');
INSERT INTO `allwww_log` VALUES ('244', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:07:48');
INSERT INTO `allwww_log` VALUES ('245', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.218', '2016-06-07 12:07:50');
INSERT INTO `allwww_log` VALUES ('246', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 12:07:50');
INSERT INTO `allwww_log` VALUES ('247', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:08:15');
INSERT INTO `allwww_log` VALUES ('248', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:08:19');
INSERT INTO `allwww_log` VALUES ('249', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=remove', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:08:25');
INSERT INTO `allwww_log` VALUES ('250', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '61.151.218.118', '2016-06-07 12:08:44');
INSERT INTO `allwww_log` VALUES ('251', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.94', '2016-06-07 12:08:44');
INSERT INTO `allwww_log` VALUES ('252', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:09:28');
INSERT INTO `allwww_log` VALUES ('253', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:09:44');
INSERT INTO `allwww_log` VALUES ('254', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.64.235.249', '2016-06-07 12:10:02');
INSERT INTO `allwww_log` VALUES ('255', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.99', '2016-06-07 12:10:02');
INSERT INTO `allwww_log` VALUES ('256', '', '0', 'content', '', 'type_manage', '?m=content&c=type_manage&a=listorder', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:03');
INSERT INTO `allwww_log` VALUES ('257', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 12:10:06');
INSERT INTO `allwww_log` VALUES ('258', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:27');
INSERT INTO `allwww_log` VALUES ('259', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:32');
INSERT INTO `allwww_log` VALUES ('260', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-07 12:10:33');
INSERT INTO `allwww_log` VALUES ('261', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.200', '2016-06-07 12:10:34');
INSERT INTO `allwww_log` VALUES ('262', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 12:10:34');
INSERT INTO `allwww_log` VALUES ('263', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:37');
INSERT INTO `allwww_log` VALUES ('264', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 12:10:37');
INSERT INTO `allwww_log` VALUES ('265', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:52');
INSERT INTO `allwww_log` VALUES ('266', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.191', '2016-06-07 12:10:55');
INSERT INTO `allwww_log` VALUES ('267', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:10:56');
INSERT INTO `allwww_log` VALUES ('268', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-07 12:11:04');
INSERT INTO `allwww_log` VALUES ('269', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:11:56');
INSERT INTO `allwww_log` VALUES ('270', '', '0', 'search', '', 'search_type', '?m=search&c=search_type&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:12:51');
INSERT INTO `allwww_log` VALUES ('271', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:13:34');
INSERT INTO `allwww_log` VALUES ('272', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:05');
INSERT INTO `allwww_log` VALUES ('273', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:13');
INSERT INTO `allwww_log` VALUES ('274', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:18');
INSERT INTO `allwww_log` VALUES ('275', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:37');
INSERT INTO `allwww_log` VALUES ('276', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:45');
INSERT INTO `allwww_log` VALUES ('277', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:15:51');
INSERT INTO `allwww_log` VALUES ('278', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_pc_tag', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:17:03');
INSERT INTO `allwww_log` VALUES ('279', '', '0', 'template', '', 'file', '?m=template&c=file&a=edit_pc_tag', '', '1', 'admin', '36.45.166.210', '2016-06-07 12:17:11');
INSERT INTO `allwww_log` VALUES ('280', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.201.215', '2016-06-07 12:17:40');
INSERT INTO `allwww_log` VALUES ('281', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.94', '2016-06-07 12:17:40');
INSERT INTO `allwww_log` VALUES ('282', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('283', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.64.174', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('284', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.197', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('285', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.108.21.69', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('286', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '183.60.15.20', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('287', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.18.147', '2016-06-07 12:21:24');
INSERT INTO `allwww_log` VALUES ('288', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.34.191', '2016-06-07 12:21:26');
INSERT INTO `allwww_log` VALUES ('289', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 12:21:30');
INSERT INTO `allwww_log` VALUES ('290', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:21:56');
INSERT INTO `allwww_log` VALUES ('291', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:05');
INSERT INTO `allwww_log` VALUES ('292', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:06');
INSERT INTO `allwww_log` VALUES ('293', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:15');
INSERT INTO `allwww_log` VALUES ('294', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:17');
INSERT INTO `allwww_log` VALUES ('295', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:19');
INSERT INTO `allwww_log` VALUES ('296', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:21');
INSERT INTO `allwww_log` VALUES ('297', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 12:22:34');
INSERT INTO `allwww_log` VALUES ('298', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:10:43');
INSERT INTO `allwww_log` VALUES ('299', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:10:43');
INSERT INTO `allwww_log` VALUES ('300', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:13:15');
INSERT INTO `allwww_log` VALUES ('301', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:13:15');
INSERT INTO `allwww_log` VALUES ('302', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:15:21');
INSERT INTO `allwww_log` VALUES ('303', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:15:21');
INSERT INTO `allwww_log` VALUES ('304', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:15:25');
INSERT INTO `allwww_log` VALUES ('305', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:15:43');
INSERT INTO `allwww_log` VALUES ('306', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:15:55');
INSERT INTO `allwww_log` VALUES ('307', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:18:35');
INSERT INTO `allwww_log` VALUES ('308', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:21:15');
INSERT INTO `allwww_log` VALUES ('309', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:23:55');
INSERT INTO `allwww_log` VALUES ('310', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:26:40');
INSERT INTO `allwww_log` VALUES ('311', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:29:15');
INSERT INTO `allwww_log` VALUES ('312', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:30:40');
INSERT INTO `allwww_log` VALUES ('313', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:30:40');
INSERT INTO `allwww_log` VALUES ('314', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:30:41');
INSERT INTO `allwww_log` VALUES ('315', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.45.166.210', '2016-06-07 13:30:54');
INSERT INTO `allwww_log` VALUES ('316', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:33:35');
INSERT INTO `allwww_log` VALUES ('317', '', '0', 'search', '', 'search_type', '?m=search&c=search_type&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:40:01');
INSERT INTO `allwww_log` VALUES ('318', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:40:21');
INSERT INTO `allwww_log` VALUES ('319', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:40:49');
INSERT INTO `allwww_log` VALUES ('320', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:41:41');
INSERT INTO `allwww_log` VALUES ('321', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=category', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:41:43');
INSERT INTO `allwww_log` VALUES ('322', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:42:01');
INSERT INTO `allwww_log` VALUES ('323', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:45:43');
INSERT INTO `allwww_log` VALUES ('324', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:47:42');
INSERT INTO `allwww_log` VALUES ('325', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:48:24');
INSERT INTO `allwww_log` VALUES ('326', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:50:47');
INSERT INTO `allwww_log` VALUES ('327', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:50:54');
INSERT INTO `allwww_log` VALUES ('328', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:51:04');
INSERT INTO `allwww_log` VALUES ('329', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:51:50');
INSERT INTO `allwww_log` VALUES ('330', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:53:53');
INSERT INTO `allwww_log` VALUES ('331', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 13:56:35');
INSERT INTO `allwww_log` VALUES ('332', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:24:05');
INSERT INTO `allwww_log` VALUES ('333', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:26:13');
INSERT INTO `allwww_log` VALUES ('334', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:27:36');
INSERT INTO `allwww_log` VALUES ('335', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:27:52');
INSERT INTO `allwww_log` VALUES ('336', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 14:28:07');
INSERT INTO `allwww_log` VALUES ('337', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 14:28:21');
INSERT INTO `allwww_log` VALUES ('338', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:29:02');
INSERT INTO `allwww_log` VALUES ('339', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.45.166.210', '2016-06-07 14:30:38');
INSERT INTO `allwww_log` VALUES ('340', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.45.166.210', '2016-06-07 14:30:39');
INSERT INTO `allwww_log` VALUES ('341', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.45.166.210', '2016-06-07 14:30:52');
INSERT INTO `allwww_log` VALUES ('342', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:31:26');
INSERT INTO `allwww_log` VALUES ('343', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:32:40');
INSERT INTO `allwww_log` VALUES ('344', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.99', '2016-06-07 14:33:16');
INSERT INTO `allwww_log` VALUES ('345', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.198', '2016-06-07 14:33:16');
INSERT INTO `allwww_log` VALUES ('346', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:34:22');
INSERT INTO `allwww_log` VALUES ('347', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:37:58');
INSERT INTO `allwww_log` VALUES ('348', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:38:28');
INSERT INTO `allwww_log` VALUES ('349', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:38:37');
INSERT INTO `allwww_log` VALUES ('350', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:43:18');
INSERT INTO `allwww_log` VALUES ('351', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:43:21');
INSERT INTO `allwww_log` VALUES ('352', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:43:29');
INSERT INTO `allwww_log` VALUES ('353', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:44:37');
INSERT INTO `allwww_log` VALUES ('354', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:44:40');
INSERT INTO `allwww_log` VALUES ('355', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:44:41');
INSERT INTO `allwww_log` VALUES ('356', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:45:40');
INSERT INTO `allwww_log` VALUES ('357', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:46:54');
INSERT INTO `allwww_log` VALUES ('358', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:47:59');
INSERT INTO `allwww_log` VALUES ('359', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:48:36');
INSERT INTO `allwww_log` VALUES ('360', '', '0', 'content', '', 'content', '?m=content&c=content&a=add_othors', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:48:41');
INSERT INTO `allwww_log` VALUES ('361', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:48:59');
INSERT INTO `allwww_log` VALUES ('362', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:50:25');
INSERT INTO `allwww_log` VALUES ('363', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:51:09');
INSERT INTO `allwww_log` VALUES ('364', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:51:10');
INSERT INTO `allwww_log` VALUES ('365', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:52:27');
INSERT INTO `allwww_log` VALUES ('366', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:52:39');
INSERT INTO `allwww_log` VALUES ('367', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:54:19');
INSERT INTO `allwww_log` VALUES ('368', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:54:28');
INSERT INTO `allwww_log` VALUES ('369', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:55:23');
INSERT INTO `allwww_log` VALUES ('370', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:55:33');
INSERT INTO `allwww_log` VALUES ('371', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:55:37');
INSERT INTO `allwww_log` VALUES ('372', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:57:05');
INSERT INTO `allwww_log` VALUES ('373', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:57:17');
INSERT INTO `allwww_log` VALUES ('374', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:57:47');
INSERT INTO `allwww_log` VALUES ('375', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:57:53');
INSERT INTO `allwww_log` VALUES ('376', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:58:17');
INSERT INTO `allwww_log` VALUES ('377', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:58:20');
INSERT INTO `allwww_log` VALUES ('378', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:58:52');
INSERT INTO `allwww_log` VALUES ('379', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:58:58');
INSERT INTO `allwww_log` VALUES ('380', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:59:38');
INSERT INTO `allwww_log` VALUES ('381', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 14:59:55');
INSERT INTO `allwww_log` VALUES ('382', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:00:02');
INSERT INTO `allwww_log` VALUES ('383', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:00:36');
INSERT INTO `allwww_log` VALUES ('384', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 15:00:43');
INSERT INTO `allwww_log` VALUES ('385', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 15:01:06');
INSERT INTO `allwww_log` VALUES ('386', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:01:51');
INSERT INTO `allwww_log` VALUES ('387', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:02:19');
INSERT INTO `allwww_log` VALUES ('388', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:03:03');
INSERT INTO `allwww_log` VALUES ('389', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:03:07');
INSERT INTO `allwww_log` VALUES ('390', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:03:16');
INSERT INTO `allwww_log` VALUES ('391', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:03:48');
INSERT INTO `allwww_log` VALUES ('392', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:03:50');
INSERT INTO `allwww_log` VALUES ('393', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:04:12');
INSERT INTO `allwww_log` VALUES ('394', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:04:14');
INSERT INTO `allwww_log` VALUES ('395', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:04:32');
INSERT INTO `allwww_log` VALUES ('396', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:04:43');
INSERT INTO `allwww_log` VALUES ('397', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:06:28');
INSERT INTO `allwww_log` VALUES ('398', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:06:35');
INSERT INTO `allwww_log` VALUES ('399', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:07:05');
INSERT INTO `allwww_log` VALUES ('400', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:07:15');
INSERT INTO `allwww_log` VALUES ('401', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:07:29');
INSERT INTO `allwww_log` VALUES ('402', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:07:48');
INSERT INTO `allwww_log` VALUES ('403', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:07:51');
INSERT INTO `allwww_log` VALUES ('404', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:09:13');
INSERT INTO `allwww_log` VALUES ('405', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-07 15:09:17');
INSERT INTO `allwww_log` VALUES ('406', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.176', '2016-06-07 15:09:17');
INSERT INTO `allwww_log` VALUES ('407', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:09:27');
INSERT INTO `allwww_log` VALUES ('408', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:09:47');
INSERT INTO `allwww_log` VALUES ('409', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:10:53');
INSERT INTO `allwww_log` VALUES ('410', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:10:59');
INSERT INTO `allwww_log` VALUES ('411', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:11:22');
INSERT INTO `allwww_log` VALUES ('412', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:14:58');
INSERT INTO `allwww_log` VALUES ('413', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.142', '2016-06-07 15:15:00');
INSERT INTO `allwww_log` VALUES ('414', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.65.108', '2016-06-07 15:15:01');
INSERT INTO `allwww_log` VALUES ('415', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.94', '2016-06-07 15:15:48');
INSERT INTO `allwww_log` VALUES ('416', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.187', '2016-06-07 15:15:48');
INSERT INTO `allwww_log` VALUES ('417', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:15:53');
INSERT INTO `allwww_log` VALUES ('418', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 15:16:06');
INSERT INTO `allwww_log` VALUES ('419', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:21:31');
INSERT INTO `allwww_log` VALUES ('420', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:21:55');
INSERT INTO `allwww_log` VALUES ('421', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:22:06');
INSERT INTO `allwww_log` VALUES ('422', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:23:36');
INSERT INTO `allwww_log` VALUES ('423', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:24:03');
INSERT INTO `allwww_log` VALUES ('424', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:24:04');
INSERT INTO `allwww_log` VALUES ('425', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:24:17');
INSERT INTO `allwww_log` VALUES ('426', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:24:33');
INSERT INTO `allwww_log` VALUES ('427', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:25:09');
INSERT INTO `allwww_log` VALUES ('428', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:32:26');
INSERT INTO `allwww_log` VALUES ('429', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:35:34');
INSERT INTO `allwww_log` VALUES ('430', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:36:15');
INSERT INTO `allwww_log` VALUES ('431', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:37:18');
INSERT INTO `allwww_log` VALUES ('432', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:37:53');
INSERT INTO `allwww_log` VALUES ('433', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:39:15');
INSERT INTO `allwww_log` VALUES ('434', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:40:25');
INSERT INTO `allwww_log` VALUES ('435', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:42:16');
INSERT INTO `allwww_log` VALUES ('436', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 15:47:09');
INSERT INTO `allwww_log` VALUES ('437', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:04:36');
INSERT INTO `allwww_log` VALUES ('438', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.19', '2016-06-07 16:05:42');
INSERT INTO `allwww_log` VALUES ('439', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 16:05:42');
INSERT INTO `allwww_log` VALUES ('440', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:11:15');
INSERT INTO `allwww_log` VALUES ('441', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:12:25');
INSERT INTO `allwww_log` VALUES ('442', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:12:50');
INSERT INTO `allwww_log` VALUES ('443', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.180', '2016-06-07 16:14:02');
INSERT INTO `allwww_log` VALUES ('444', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.140', '2016-06-07 16:14:02');
INSERT INTO `allwww_log` VALUES ('445', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.98', '2016-06-07 16:14:02');
INSERT INTO `allwww_log` VALUES ('446', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.179', '2016-06-07 16:14:02');
INSERT INTO `allwww_log` VALUES ('447', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:15:44');
INSERT INTO `allwww_log` VALUES ('448', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:19:20');
INSERT INTO `allwww_log` VALUES ('449', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:23:32');
INSERT INTO `allwww_log` VALUES ('450', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:23:55');
INSERT INTO `allwww_log` VALUES ('451', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:24:02');
INSERT INTO `allwww_log` VALUES ('452', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:24:44');
INSERT INTO `allwww_log` VALUES ('453', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:24:46');
INSERT INTO `allwww_log` VALUES ('454', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:25:15');
INSERT INTO `allwww_log` VALUES ('455', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:26:11');
INSERT INTO `allwww_log` VALUES ('456', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:27:08');
INSERT INTO `allwww_log` VALUES ('457', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:28:29');
INSERT INTO `allwww_log` VALUES ('458', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:28:30');
INSERT INTO `allwww_log` VALUES ('459', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:29:46');
INSERT INTO `allwww_log` VALUES ('460', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:33:15');
INSERT INTO `allwww_log` VALUES ('461', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:33:25');
INSERT INTO `allwww_log` VALUES ('462', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:13');
INSERT INTO `allwww_log` VALUES ('463', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:21');
INSERT INTO `allwww_log` VALUES ('464', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:23');
INSERT INTO `allwww_log` VALUES ('465', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:28');
INSERT INTO `allwww_log` VALUES ('466', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:31');
INSERT INTO `allwww_log` VALUES ('467', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:45');
INSERT INTO `allwww_log` VALUES ('468', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:34:55');
INSERT INTO `allwww_log` VALUES ('469', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:35:12');
INSERT INTO `allwww_log` VALUES ('470', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:37:42');
INSERT INTO `allwww_log` VALUES ('471', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:38:02');
INSERT INTO `allwww_log` VALUES ('472', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:38:07');
INSERT INTO `allwww_log` VALUES ('473', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:38:17');
INSERT INTO `allwww_log` VALUES ('474', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=import', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:38:24');
INSERT INTO `allwww_log` VALUES ('475', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 16:38:26');
INSERT INTO `allwww_log` VALUES ('476', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.51.226', '2016-06-07 16:38:26');
INSERT INTO `allwww_log` VALUES ('477', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-07 16:39:01');
INSERT INTO `allwww_log` VALUES ('478', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.89.121', '2016-06-07 16:44:02');
INSERT INTO `allwww_log` VALUES ('479', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.142', '2016-06-07 16:44:02');
INSERT INTO `allwww_log` VALUES ('480', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.93.234', '2016-06-07 16:44:03');
INSERT INTO `allwww_log` VALUES ('481', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-07 16:44:03');
INSERT INTO `allwww_log` VALUES ('482', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.188', '2016-06-07 16:44:05');
INSERT INTO `allwww_log` VALUES ('483', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.142', '2016-06-07 16:44:05');
INSERT INTO `allwww_log` VALUES ('484', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.95', '2016-06-07 16:44:06');
INSERT INTO `allwww_log` VALUES ('485', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.36', '2016-06-07 16:44:06');
INSERT INTO `allwww_log` VALUES ('486', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.191', '2016-06-07 16:44:26');
INSERT INTO `allwww_log` VALUES ('487', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.190', '2016-06-07 16:44:29');
INSERT INTO `allwww_log` VALUES ('488', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-07 16:44:38');
INSERT INTO `allwww_log` VALUES ('489', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-07 16:44:38');
INSERT INTO `allwww_log` VALUES ('490', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.99', '2016-06-07 16:50:09');
INSERT INTO `allwww_log` VALUES ('491', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.18', '2016-06-07 16:50:09');
INSERT INTO `allwww_log` VALUES ('492', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:50:38');
INSERT INTO `allwww_log` VALUES ('493', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:58:20');
INSERT INTO `allwww_log` VALUES ('494', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:58:26');
INSERT INTO `allwww_log` VALUES ('495', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.201.79', '2016-06-07 16:58:32');
INSERT INTO `allwww_log` VALUES ('496', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.139', '2016-06-07 16:58:32');
INSERT INTO `allwww_log` VALUES ('497', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.139', '2016-06-07 16:58:34');
INSERT INTO `allwww_log` VALUES ('498', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.65.193.13', '2016-06-07 16:58:34');
INSERT INTO `allwww_log` VALUES ('499', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:09');
INSERT INTO `allwww_log` VALUES ('500', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:30');
INSERT INTO `allwww_log` VALUES ('501', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:30');
INSERT INTO `allwww_log` VALUES ('502', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:32');
INSERT INTO `allwww_log` VALUES ('503', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:51');
INSERT INTO `allwww_log` VALUES ('504', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:56');
INSERT INTO `allwww_log` VALUES ('505', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 16:59:58');
INSERT INTO `allwww_log` VALUES ('506', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:01');
INSERT INTO `allwww_log` VALUES ('507', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:03');
INSERT INTO `allwww_log` VALUES ('508', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:05');
INSERT INTO `allwww_log` VALUES ('509', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:05');
INSERT INTO `allwww_log` VALUES ('510', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:11');
INSERT INTO `allwww_log` VALUES ('511', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:11');
INSERT INTO `allwww_log` VALUES ('512', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:12');
INSERT INTO `allwww_log` VALUES ('513', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:22');
INSERT INTO `allwww_log` VALUES ('514', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:00:26');
INSERT INTO `allwww_log` VALUES ('515', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:14');
INSERT INTO `allwww_log` VALUES ('516', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:22');
INSERT INTO `allwww_log` VALUES ('517', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:23');
INSERT INTO `allwww_log` VALUES ('518', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:41');
INSERT INTO `allwww_log` VALUES ('519', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:43');
INSERT INTO `allwww_log` VALUES ('520', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:44');
INSERT INTO `allwww_log` VALUES ('521', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:46');
INSERT INTO `allwww_log` VALUES ('522', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:48');
INSERT INTO `allwww_log` VALUES ('523', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:01:58');
INSERT INTO `allwww_log` VALUES ('524', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:17');
INSERT INTO `allwww_log` VALUES ('525', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:23');
INSERT INTO `allwww_log` VALUES ('526', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:24');
INSERT INTO `allwww_log` VALUES ('527', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:27');
INSERT INTO `allwww_log` VALUES ('528', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:29');
INSERT INTO `allwww_log` VALUES ('529', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:02:36');
INSERT INTO `allwww_log` VALUES ('530', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:18');
INSERT INTO `allwww_log` VALUES ('531', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:22');
INSERT INTO `allwww_log` VALUES ('532', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:24');
INSERT INTO `allwww_log` VALUES ('533', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:26');
INSERT INTO `allwww_log` VALUES ('534', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:27');
INSERT INTO `allwww_log` VALUES ('535', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:03:55');
INSERT INTO `allwww_log` VALUES ('536', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:04:46');
INSERT INTO `allwww_log` VALUES ('537', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:05:31');
INSERT INTO `allwww_log` VALUES ('538', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:05:42');
INSERT INTO `allwww_log` VALUES ('539', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:05:44');
INSERT INTO `allwww_log` VALUES ('540', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:05:50');
INSERT INTO `allwww_log` VALUES ('541', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:05:53');
INSERT INTO `allwww_log` VALUES ('542', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:07:40');
INSERT INTO `allwww_log` VALUES ('543', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:08:57');
INSERT INTO `allwww_log` VALUES ('544', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:09:11');
INSERT INTO `allwww_log` VALUES ('545', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:09:58');
INSERT INTO `allwww_log` VALUES ('546', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:10:08');
INSERT INTO `allwww_log` VALUES ('547', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:11:26');
INSERT INTO `allwww_log` VALUES ('548', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:11:34');
INSERT INTO `allwww_log` VALUES ('549', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.218', '2016-06-07 17:32:10');
INSERT INTO `allwww_log` VALUES ('550', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.218', '2016-06-07 17:32:10');
INSERT INTO `allwww_log` VALUES ('551', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:32:36');
INSERT INTO `allwww_log` VALUES ('552', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:38:18');
INSERT INTO `allwww_log` VALUES ('553', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:10');
INSERT INTO `allwww_log` VALUES ('554', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:15');
INSERT INTO `allwww_log` VALUES ('555', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:18');
INSERT INTO `allwww_log` VALUES ('556', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:24');
INSERT INTO `allwww_log` VALUES ('557', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:26');
INSERT INTO `allwww_log` VALUES ('558', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:39:31');
INSERT INTO `allwww_log` VALUES ('559', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:46:48');
INSERT INTO `allwww_log` VALUES ('560', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:46:51');
INSERT INTO `allwww_log` VALUES ('561', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:46:56');
INSERT INTO `allwww_log` VALUES ('562', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:46:58');
INSERT INTO `allwww_log` VALUES ('563', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:47:01');
INSERT INTO `allwww_log` VALUES ('564', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:47:24');
INSERT INTO `allwww_log` VALUES ('565', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:47:26');
INSERT INTO `allwww_log` VALUES ('566', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:47:28');
INSERT INTO `allwww_log` VALUES ('567', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:47:30');
INSERT INTO `allwww_log` VALUES ('568', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:53:16');
INSERT INTO `allwww_log` VALUES ('569', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:53:18');
INSERT INTO `allwww_log` VALUES ('570', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:54:07');
INSERT INTO `allwww_log` VALUES ('571', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:10');
INSERT INTO `allwww_log` VALUES ('572', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:15');
INSERT INTO `allwww_log` VALUES ('573', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:17');
INSERT INTO `allwww_log` VALUES ('574', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:19');
INSERT INTO `allwww_log` VALUES ('575', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:26');
INSERT INTO `allwww_log` VALUES ('576', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:55:29');
INSERT INTO `allwww_log` VALUES ('577', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:58:20');
INSERT INTO `allwww_log` VALUES ('578', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:58:27');
INSERT INTO `allwww_log` VALUES ('579', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:58:33');
INSERT INTO `allwww_log` VALUES ('580', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:58:35');
INSERT INTO `allwww_log` VALUES ('581', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.45.166.210', '2016-06-07 17:58:37');
INSERT INTO `allwww_log` VALUES ('582', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:02:34');
INSERT INTO `allwww_log` VALUES ('583', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:04:09');
INSERT INTO `allwww_log` VALUES ('584', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:05:05');
INSERT INTO `allwww_log` VALUES ('585', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:06:51');
INSERT INTO `allwww_log` VALUES ('586', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:07:06');
INSERT INTO `allwww_log` VALUES ('587', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:08:54');
INSERT INTO `allwww_log` VALUES ('588', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:08:58');
INSERT INTO `allwww_log` VALUES ('589', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:09:32');
INSERT INTO `allwww_log` VALUES ('590', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:10:07');
INSERT INTO `allwww_log` VALUES ('591', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:12:57');
INSERT INTO `allwww_log` VALUES ('592', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:13:08');
INSERT INTO `allwww_log` VALUES ('593', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:14:31');
INSERT INTO `allwww_log` VALUES ('594', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-07 18:15:34');
INSERT INTO `allwww_log` VALUES ('595', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.226', '2016-06-07 18:15:34');
INSERT INTO `allwww_log` VALUES ('596', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '61.151.218.118', '2016-06-07 18:15:38');
INSERT INTO `allwww_log` VALUES ('597', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.143', '2016-06-07 18:15:38');
INSERT INTO `allwww_log` VALUES ('598', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:16:03');
INSERT INTO `allwww_log` VALUES ('599', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:16:14');
INSERT INTO `allwww_log` VALUES ('600', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:16:58');
INSERT INTO `allwww_log` VALUES ('601', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:17:15');
INSERT INTO `allwww_log` VALUES ('602', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:17:18');
INSERT INTO `allwww_log` VALUES ('603', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:17:20');
INSERT INTO `allwww_log` VALUES ('604', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:27:32');
INSERT INTO `allwww_log` VALUES ('605', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:27:44');
INSERT INTO `allwww_log` VALUES ('606', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:27:55');
INSERT INTO `allwww_log` VALUES ('607', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:28:00');
INSERT INTO `allwww_log` VALUES ('608', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:28:58');
INSERT INTO `allwww_log` VALUES ('609', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:01');
INSERT INTO `allwww_log` VALUES ('610', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:03');
INSERT INTO `allwww_log` VALUES ('611', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:06');
INSERT INTO `allwww_log` VALUES ('612', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:08');
INSERT INTO `allwww_log` VALUES ('613', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:10');
INSERT INTO `allwww_log` VALUES ('614', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:12');
INSERT INTO `allwww_log` VALUES ('615', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:19');
INSERT INTO `allwww_log` VALUES ('616', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=create_js', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:21');
INSERT INTO `allwww_log` VALUES ('617', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=setting', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:25');
INSERT INTO `allwww_log` VALUES ('618', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=setting', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:26');
INSERT INTO `allwww_log` VALUES ('619', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:29:27');
INSERT INTO `allwww_log` VALUES ('620', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:15');
INSERT INTO `allwww_log` VALUES ('621', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:18');
INSERT INTO `allwww_log` VALUES ('622', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=poster_template', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:22');
INSERT INTO `allwww_log` VALUES ('623', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:24');
INSERT INTO `allwww_log` VALUES ('624', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:26');
INSERT INTO `allwww_log` VALUES ('625', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:30:27');
INSERT INTO `allwww_log` VALUES ('626', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:31:42');
INSERT INTO `allwww_log` VALUES ('627', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:31:45');
INSERT INTO `allwww_log` VALUES ('628', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:32:06');
INSERT INTO `allwww_log` VALUES ('629', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.210', '2016-06-07 18:33:14');
INSERT INTO `allwww_log` VALUES ('630', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-07 18:33:14');
INSERT INTO `allwww_log` VALUES ('631', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:33:28');
INSERT INTO `allwww_log` VALUES ('632', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:34:56');
INSERT INTO `allwww_log` VALUES ('633', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:35:06');
INSERT INTO `allwww_log` VALUES ('634', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:36:22');
INSERT INTO `allwww_log` VALUES ('635', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:36:33');
INSERT INTO `allwww_log` VALUES ('636', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.65.106', '2016-06-07 18:39:17');
INSERT INTO `allwww_log` VALUES ('637', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.141', '2016-06-07 18:39:17');
INSERT INTO `allwww_log` VALUES ('638', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:43:30');
INSERT INTO `allwww_log` VALUES ('639', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:43:47');
INSERT INTO `allwww_log` VALUES ('640', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:43:58');
INSERT INTO `allwww_log` VALUES ('641', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.45.166.210', '2016-06-07 18:44:58');
INSERT INTO `allwww_log` VALUES ('642', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 18:52:39');
INSERT INTO `allwww_log` VALUES ('643', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:01:21');
INSERT INTO `allwww_log` VALUES ('644', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:02:41');
INSERT INTO `allwww_log` VALUES ('645', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:07:32');
INSERT INTO `allwww_log` VALUES ('646', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:07:42');
INSERT INTO `allwww_log` VALUES ('647', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.140', '2016-06-07 19:43:20');
INSERT INTO `allwww_log` VALUES ('648', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.209', '2016-06-07 19:43:22');
INSERT INTO `allwww_log` VALUES ('649', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:47:28');
INSERT INTO `allwww_log` VALUES ('650', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:47:34');
INSERT INTO `allwww_log` VALUES ('651', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:49:44');
INSERT INTO `allwww_log` VALUES ('652', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:49:50');
INSERT INTO `allwww_log` VALUES ('653', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:49:53');
INSERT INTO `allwww_log` VALUES ('654', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:50:08');
INSERT INTO `allwww_log` VALUES ('655', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:50:10');
INSERT INTO `allwww_log` VALUES ('656', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:50:13');
INSERT INTO `allwww_log` VALUES ('657', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:51:21');
INSERT INTO `allwww_log` VALUES ('658', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:51:23');
INSERT INTO `allwww_log` VALUES ('659', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:53:02');
INSERT INTO `allwww_log` VALUES ('660', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:53:04');
INSERT INTO `allwww_log` VALUES ('661', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:53:57');
INSERT INTO `allwww_log` VALUES ('662', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:53:59');
INSERT INTO `allwww_log` VALUES ('663', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:08');
INSERT INTO `allwww_log` VALUES ('664', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:09');
INSERT INTO `allwww_log` VALUES ('665', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:35');
INSERT INTO `allwww_log` VALUES ('666', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:37');
INSERT INTO `allwww_log` VALUES ('667', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:40');
INSERT INTO `allwww_log` VALUES ('668', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:55:45');
INSERT INTO `allwww_log` VALUES ('669', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.45.166.210', '2016-06-07 19:56:11');
INSERT INTO `allwww_log` VALUES ('670', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 09:45:44');
INSERT INTO `allwww_log` VALUES ('671', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 09:45:55');
INSERT INTO `allwww_log` VALUES ('672', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:46:28');
INSERT INTO `allwww_log` VALUES ('673', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:46:45');
INSERT INTO `allwww_log` VALUES ('674', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:48:16');
INSERT INTO `allwww_log` VALUES ('675', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:48:20');
INSERT INTO `allwww_log` VALUES ('676', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:48:22');
INSERT INTO `allwww_log` VALUES ('677', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:48:45');
INSERT INTO `allwww_log` VALUES ('678', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('679', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:50:22');
INSERT INTO `allwww_log` VALUES ('680', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:50:49');
INSERT INTO `allwww_log` VALUES ('681', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:51:22');
INSERT INTO `allwww_log` VALUES ('682', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:52:16');
INSERT INTO `allwww_log` VALUES ('683', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:52:49');
INSERT INTO `allwww_log` VALUES ('684', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:54:29');
INSERT INTO `allwww_log` VALUES ('685', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:54:43');
INSERT INTO `allwww_log` VALUES ('686', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:55:48');
INSERT INTO `allwww_log` VALUES ('687', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:56:01');
INSERT INTO `allwww_log` VALUES ('688', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:56:49');
INSERT INTO `allwww_log` VALUES ('689', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:56:53');
INSERT INTO `allwww_log` VALUES ('690', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:56:54');
INSERT INTO `allwww_log` VALUES ('691', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 09:59:46');
INSERT INTO `allwww_log` VALUES ('692', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:00:04');
INSERT INTO `allwww_log` VALUES ('693', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:12:25');
INSERT INTO `allwww_log` VALUES ('694', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:12:43');
INSERT INTO `allwww_log` VALUES ('695', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:12:49');
INSERT INTO `allwww_log` VALUES ('696', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:16:57');
INSERT INTO `allwww_log` VALUES ('697', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=remove', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:20:45');
INSERT INTO `allwww_log` VALUES ('698', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:46:33');
INSERT INTO `allwww_log` VALUES ('699', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 10:47:20');
INSERT INTO `allwww_log` VALUES ('700', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 10:47:26');
INSERT INTO `allwww_log` VALUES ('701', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-08 10:47:34');
INSERT INTO `allwww_log` VALUES ('702', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.192', '2016-06-08 10:47:34');
INSERT INTO `allwww_log` VALUES ('703', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:47:39');
INSERT INTO `allwww_log` VALUES ('704', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:51:08');
INSERT INTO `allwww_log` VALUES ('705', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:51:17');
INSERT INTO `allwww_log` VALUES ('706', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:51:19');
INSERT INTO `allwww_log` VALUES ('707', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.139.160.164', '2016-06-08 10:51:32');
INSERT INTO `allwww_log` VALUES ('708', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.139.160.164', '2016-06-08 10:51:39');
INSERT INTO `allwww_log` VALUES ('709', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:57:14');
INSERT INTO `allwww_log` VALUES ('710', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 10:59:00');
INSERT INTO `allwww_log` VALUES ('711', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:01:22');
INSERT INTO `allwww_log` VALUES ('712', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:02:01');
INSERT INTO `allwww_log` VALUES ('713', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:02:16');
INSERT INTO `allwww_log` VALUES ('714', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:02:59');
INSERT INTO `allwww_log` VALUES ('715', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:03:33');
INSERT INTO `allwww_log` VALUES ('716', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:03:42');
INSERT INTO `allwww_log` VALUES ('717', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:04:04');
INSERT INTO `allwww_log` VALUES ('718', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:04:13');
INSERT INTO `allwww_log` VALUES ('719', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:04:19');
INSERT INTO `allwww_log` VALUES ('720', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:04:32');
INSERT INTO `allwww_log` VALUES ('721', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:04:38');
INSERT INTO `allwww_log` VALUES ('722', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:05:04');
INSERT INTO `allwww_log` VALUES ('723', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:06:33');
INSERT INTO `allwww_log` VALUES ('724', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:09:52');
INSERT INTO `allwww_log` VALUES ('725', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:11:15');
INSERT INTO `allwww_log` VALUES ('726', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:11:31');
INSERT INTO `allwww_log` VALUES ('727', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:11:51');
INSERT INTO `allwww_log` VALUES ('728', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:13:38');
INSERT INTO `allwww_log` VALUES ('729', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:15:37');
INSERT INTO `allwww_log` VALUES ('730', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=listorder', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:19:38');
INSERT INTO `allwww_log` VALUES ('731', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:19:49');
INSERT INTO `allwww_log` VALUES ('732', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:24:05');
INSERT INTO `allwww_log` VALUES ('733', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:30:56');
INSERT INTO `allwww_log` VALUES ('734', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:32:47');
INSERT INTO `allwww_log` VALUES ('735', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:34:02');
INSERT INTO `allwww_log` VALUES ('736', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:36:04');
INSERT INTO `allwww_log` VALUES ('737', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:37:12');
INSERT INTO `allwww_log` VALUES ('738', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:37:24');
INSERT INTO `allwww_log` VALUES ('739', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:37:44');
INSERT INTO `allwww_log` VALUES ('740', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:39:57');
INSERT INTO `allwww_log` VALUES ('741', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:52:16');
INSERT INTO `allwww_log` VALUES ('742', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:53:08');
INSERT INTO `allwww_log` VALUES ('743', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:53:25');
INSERT INTO `allwww_log` VALUES ('744', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:53:25');
INSERT INTO `allwww_log` VALUES ('745', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:53:34');
INSERT INTO `allwww_log` VALUES ('746', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:53:40');
INSERT INTO `allwww_log` VALUES ('747', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:55:34');
INSERT INTO `allwww_log` VALUES ('748', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:55:45');
INSERT INTO `allwww_log` VALUES ('749', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:55:55');
INSERT INTO `allwww_log` VALUES ('750', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:56:39');
INSERT INTO `allwww_log` VALUES ('751', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 11:57:45');
INSERT INTO `allwww_log` VALUES ('752', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:04:26');
INSERT INTO `allwww_log` VALUES ('753', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:07:09');
INSERT INTO `allwww_log` VALUES ('754', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:08:02');
INSERT INTO `allwww_log` VALUES ('755', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.42.0.61', '2016-06-08 12:08:41');
INSERT INTO `allwww_log` VALUES ('756', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '121.42.0.59', '2016-06-08 12:09:24');
INSERT INTO `allwww_log` VALUES ('757', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:11:16');
INSERT INTO `allwww_log` VALUES ('758', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:11:59');
INSERT INTO `allwww_log` VALUES ('759', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:12:07');
INSERT INTO `allwww_log` VALUES ('760', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:12:22');
INSERT INTO `allwww_log` VALUES ('761', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:12:30');
INSERT INTO `allwww_log` VALUES ('762', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:12:36');
INSERT INTO `allwww_log` VALUES ('763', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:13:02');
INSERT INTO `allwww_log` VALUES ('764', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:13:23');
INSERT INTO `allwww_log` VALUES ('765', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:13:35');
INSERT INTO `allwww_log` VALUES ('766', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:13:50');
INSERT INTO `allwww_log` VALUES ('767', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 12:14:10');
INSERT INTO `allwww_log` VALUES ('768', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '113.139.160.164', '2016-06-08 12:14:22');
INSERT INTO `allwww_log` VALUES ('769', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:14:29');
INSERT INTO `allwww_log` VALUES ('770', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:15:17');
INSERT INTO `allwww_log` VALUES ('771', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:15:36');
INSERT INTO `allwww_log` VALUES ('772', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 12:15:44');
INSERT INTO `allwww_log` VALUES ('773', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:18:55');
INSERT INTO `allwww_log` VALUES ('774', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:19:02');
INSERT INTO `allwww_log` VALUES ('775', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:19:11');
INSERT INTO `allwww_log` VALUES ('776', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:19:20');
INSERT INTO `allwww_log` VALUES ('777', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:19:29');
INSERT INTO `allwww_log` VALUES ('778', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:19:37');
INSERT INTO `allwww_log` VALUES ('779', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:20:01');
INSERT INTO `allwww_log` VALUES ('780', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '113.139.160.164', '2016-06-08 13:28:24');
INSERT INTO `allwww_log` VALUES ('781', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.44.46.23', '2016-06-08 13:47:40');
INSERT INTO `allwww_log` VALUES ('782', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.44.46.23', '2016-06-08 13:53:08');
INSERT INTO `allwww_log` VALUES ('783', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 14:27:03');
INSERT INTO `allwww_log` VALUES ('784', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 14:27:21');
INSERT INTO `allwww_log` VALUES ('785', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.98', '2016-06-08 14:51:20');
INSERT INTO `allwww_log` VALUES ('786', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.34', '2016-06-08 14:51:20');
INSERT INTO `allwww_log` VALUES ('787', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.199', '2016-06-08 14:51:23');
INSERT INTO `allwww_log` VALUES ('788', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.95', '2016-06-08 14:51:23');
INSERT INTO `allwww_log` VALUES ('789', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.139', '2016-06-08 14:51:24');
INSERT INTO `allwww_log` VALUES ('790', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.65.193.15', '2016-06-08 14:51:24');
INSERT INTO `allwww_log` VALUES ('791', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.98', '2016-06-08 14:51:40');
INSERT INTO `allwww_log` VALUES ('792', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.191', '2016-06-08 14:51:40');
INSERT INTO `allwww_log` VALUES ('793', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-08 14:51:54');
INSERT INTO `allwww_log` VALUES ('794', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:35:30');
INSERT INTO `allwww_log` VALUES ('795', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:35:49');
INSERT INTO `allwww_log` VALUES ('796', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:36:25');
INSERT INTO `allwww_log` VALUES ('797', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:37:42');
INSERT INTO `allwww_log` VALUES ('798', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:38:46');
INSERT INTO `allwww_log` VALUES ('799', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.64.174', '2016-06-08 15:49:04');
INSERT INTO `allwww_log` VALUES ('800', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.218', '2016-06-08 15:49:05');
INSERT INTO `allwww_log` VALUES ('801', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 15:49:09');
INSERT INTO `allwww_log` VALUES ('802', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 15:49:24');
INSERT INTO `allwww_log` VALUES ('803', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 15:49:25');
INSERT INTO `allwww_log` VALUES ('804', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 15:49:29');
INSERT INTO `allwww_log` VALUES ('805', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 15:49:35');
INSERT INTO `allwww_log` VALUES ('806', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:50:47');
INSERT INTO `allwww_log` VALUES ('807', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:51:50');
INSERT INTO `allwww_log` VALUES ('808', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:52:31');
INSERT INTO `allwww_log` VALUES ('809', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:52:42');
INSERT INTO `allwww_log` VALUES ('810', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 15:58:04');
INSERT INTO `allwww_log` VALUES ('811', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 16:10:06');
INSERT INTO `allwww_log` VALUES ('812', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 16:10:53');
INSERT INTO `allwww_log` VALUES ('813', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:10:56');
INSERT INTO `allwww_log` VALUES ('814', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:11:34');
INSERT INTO `allwww_log` VALUES ('815', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:12:24');
INSERT INTO `allwww_log` VALUES ('816', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:13:04');
INSERT INTO `allwww_log` VALUES ('817', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:13:13');
INSERT INTO `allwww_log` VALUES ('818', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:13:42');
INSERT INTO `allwww_log` VALUES ('819', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:14:03');
INSERT INTO `allwww_log` VALUES ('820', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:15:00');
INSERT INTO `allwww_log` VALUES ('821', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:15:47');
INSERT INTO `allwww_log` VALUES ('822', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:15:54');
INSERT INTO `allwww_log` VALUES ('823', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:16:31');
INSERT INTO `allwww_log` VALUES ('824', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:16:33');
INSERT INTO `allwww_log` VALUES ('825', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:16:33');
INSERT INTO `allwww_log` VALUES ('826', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:16:34');
INSERT INTO `allwww_log` VALUES ('827', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:16:34');
INSERT INTO `allwww_log` VALUES ('828', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:18:13');
INSERT INTO `allwww_log` VALUES ('829', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:18:40');
INSERT INTO `allwww_log` VALUES ('830', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:24');
INSERT INTO `allwww_log` VALUES ('831', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:25');
INSERT INTO `allwww_log` VALUES ('832', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:27');
INSERT INTO `allwww_log` VALUES ('833', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:27');
INSERT INTO `allwww_log` VALUES ('834', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:27');
INSERT INTO `allwww_log` VALUES ('835', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:28');
INSERT INTO `allwww_log` VALUES ('836', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:28');
INSERT INTO `allwww_log` VALUES ('837', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:31');
INSERT INTO `allwww_log` VALUES ('838', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:20:36');
INSERT INTO `allwww_log` VALUES ('839', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:23:01');
INSERT INTO `allwww_log` VALUES ('840', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:23:04');
INSERT INTO `allwww_log` VALUES ('841', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:23:04');
INSERT INTO `allwww_log` VALUES ('842', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:06');
INSERT INTO `allwww_log` VALUES ('843', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:08');
INSERT INTO `allwww_log` VALUES ('844', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:08');
INSERT INTO `allwww_log` VALUES ('845', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:44');
INSERT INTO `allwww_log` VALUES ('846', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:46');
INSERT INTO `allwww_log` VALUES ('847', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:46');
INSERT INTO `allwww_log` VALUES ('848', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:24:46');
INSERT INTO `allwww_log` VALUES ('849', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:27:31');
INSERT INTO `allwww_log` VALUES ('850', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:27:31');
INSERT INTO `allwww_log` VALUES ('851', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:29:26');
INSERT INTO `allwww_log` VALUES ('852', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:29:32');
INSERT INTO `allwww_log` VALUES ('853', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:33:42');
INSERT INTO `allwww_log` VALUES ('854', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:33:48');
INSERT INTO `allwww_log` VALUES ('855', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:33:51');
INSERT INTO `allwww_log` VALUES ('856', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:34:01');
INSERT INTO `allwww_log` VALUES ('857', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:34:02');
INSERT INTO `allwww_log` VALUES ('858', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:34:02');
INSERT INTO `allwww_log` VALUES ('859', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:34:03');
INSERT INTO `allwww_log` VALUES ('860', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:34:03');
INSERT INTO `allwww_log` VALUES ('861', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:36:38');
INSERT INTO `allwww_log` VALUES ('862', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:36:41');
INSERT INTO `allwww_log` VALUES ('863', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:36:42');
INSERT INTO `allwww_log` VALUES ('864', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:39:59');
INSERT INTO `allwww_log` VALUES ('865', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:40:01');
INSERT INTO `allwww_log` VALUES ('866', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:40:05');
INSERT INTO `allwww_log` VALUES ('867', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:40:15');
INSERT INTO `allwww_log` VALUES ('868', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:11');
INSERT INTO `allwww_log` VALUES ('869', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:11');
INSERT INTO `allwww_log` VALUES ('870', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:12');
INSERT INTO `allwww_log` VALUES ('871', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:13');
INSERT INTO `allwww_log` VALUES ('872', '', '0', 'content', '', 'content', '?m=content&c=content&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:15');
INSERT INTO `allwww_log` VALUES ('873', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=init_yf', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:41:17');
INSERT INTO `allwww_log` VALUES ('874', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:43:45');
INSERT INTO `allwww_log` VALUES ('875', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 16:52:19');
INSERT INTO `allwww_log` VALUES ('876', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 16:52:40');
INSERT INTO `allwww_log` VALUES ('877', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:52:45');
INSERT INTO `allwww_log` VALUES ('878', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.93.234', '2016-06-08 16:54:51');
INSERT INTO `allwww_log` VALUES ('879', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-08 16:54:51');
INSERT INTO `allwww_log` VALUES ('880', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.93.234', '2016-06-08 16:54:51');
INSERT INTO `allwww_log` VALUES ('881', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-08 16:54:51');
INSERT INTO `allwww_log` VALUES ('882', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.64.235.251', '2016-06-08 16:54:58');
INSERT INTO `allwww_log` VALUES ('883', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-08 16:54:58');
INSERT INTO `allwww_log` VALUES ('884', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 16:55:34');
INSERT INTO `allwww_log` VALUES ('885', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 16:55:50');
INSERT INTO `allwww_log` VALUES ('886', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 16:55:58');
INSERT INTO `allwww_log` VALUES ('887', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:13:48');
INSERT INTO `allwww_log` VALUES ('888', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:14:14');
INSERT INTO `allwww_log` VALUES ('889', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:14:17');
INSERT INTO `allwww_log` VALUES ('890', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:15:52');
INSERT INTO `allwww_log` VALUES ('891', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:16:37');
INSERT INTO `allwww_log` VALUES ('892', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:16:43');
INSERT INTO `allwww_log` VALUES ('893', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:16:48');
INSERT INTO `allwww_log` VALUES ('894', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:19:31');
INSERT INTO `allwww_log` VALUES ('895', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 17:20:25');
INSERT INTO `allwww_log` VALUES ('896', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 17:20:35');
INSERT INTO `allwww_log` VALUES ('897', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.175', '2016-06-08 17:20:37');
INSERT INTO `allwww_log` VALUES ('898', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.143', '2016-06-08 17:20:37');
INSERT INTO `allwww_log` VALUES ('899', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:20:39');
INSERT INTO `allwww_log` VALUES ('900', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:20:43');
INSERT INTO `allwww_log` VALUES ('901', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.175', '2016-06-08 17:21:53');
INSERT INTO `allwww_log` VALUES ('902', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:25:37');
INSERT INTO `allwww_log` VALUES ('903', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:27:49');
INSERT INTO `allwww_log` VALUES ('904', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:27:51');
INSERT INTO `allwww_log` VALUES ('905', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:28:02');
INSERT INTO `allwww_log` VALUES ('906', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:28:05');
INSERT INTO `allwww_log` VALUES ('907', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:29:55');
INSERT INTO `allwww_log` VALUES ('908', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:31:07');
INSERT INTO `allwww_log` VALUES ('909', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:31:43');
INSERT INTO `allwww_log` VALUES ('910', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:32:35');
INSERT INTO `allwww_log` VALUES ('911', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:33:10');
INSERT INTO `allwww_log` VALUES ('912', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:33:23');
INSERT INTO `allwww_log` VALUES ('913', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:34:55');
INSERT INTO `allwww_log` VALUES ('914', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:35:19');
INSERT INTO `allwww_log` VALUES ('915', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:36:03');
INSERT INTO `allwww_log` VALUES ('916', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 17:37:32');
INSERT INTO `allwww_log` VALUES ('917', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 17:37:34');
INSERT INTO `allwww_log` VALUES ('918', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 17:37:43');
INSERT INTO `allwww_log` VALUES ('919', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:37:55');
INSERT INTO `allwww_log` VALUES ('920', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:38:26');
INSERT INTO `allwww_log` VALUES ('921', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:38:28');
INSERT INTO `allwww_log` VALUES ('922', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:38:40');
INSERT INTO `allwww_log` VALUES ('923', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:38:43');
INSERT INTO `allwww_log` VALUES ('924', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:39:00');
INSERT INTO `allwww_log` VALUES ('925', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:39:05');
INSERT INTO `allwww_log` VALUES ('926', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:39:16');
INSERT INTO `allwww_log` VALUES ('927', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:39:32');
INSERT INTO `allwww_log` VALUES ('928', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:40:29');
INSERT INTO `allwww_log` VALUES ('929', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:40:35');
INSERT INTO `allwww_log` VALUES ('930', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:40:46');
INSERT INTO `allwww_log` VALUES ('931', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:41:23');
INSERT INTO `allwww_log` VALUES ('932', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:42:52');
INSERT INTO `allwww_log` VALUES ('933', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:42:56');
INSERT INTO `allwww_log` VALUES ('934', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:43:05');
INSERT INTO `allwww_log` VALUES ('935', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:43:06');
INSERT INTO `allwww_log` VALUES ('936', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:43:07');
INSERT INTO `allwww_log` VALUES ('937', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:43:15');
INSERT INTO `allwww_log` VALUES ('938', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:44:03');
INSERT INTO `allwww_log` VALUES ('939', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:44:05');
INSERT INTO `allwww_log` VALUES ('940', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:44:10');
INSERT INTO `allwww_log` VALUES ('941', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:44:14');
INSERT INTO `allwww_log` VALUES ('942', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:44:17');
INSERT INTO `allwww_log` VALUES ('943', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '36.44.46.23', '2016-06-08 17:44:26');
INSERT INTO `allwww_log` VALUES ('944', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:45:07');
INSERT INTO `allwww_log` VALUES ('945', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:45:27');
INSERT INTO `allwww_log` VALUES ('946', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:45:27');
INSERT INTO `allwww_log` VALUES ('947', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:45:28');
INSERT INTO `allwww_log` VALUES ('948', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:46:32');
INSERT INTO `allwww_log` VALUES ('949', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:46:43');
INSERT INTO `allwww_log` VALUES ('950', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:47:01');
INSERT INTO `allwww_log` VALUES ('951', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:49:23');
INSERT INTO `allwww_log` VALUES ('952', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:52:03');
INSERT INTO `allwww_log` VALUES ('953', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:53:10');
INSERT INTO `allwww_log` VALUES ('954', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:54:02');
INSERT INTO `allwww_log` VALUES ('955', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:54:43');
INSERT INTO `allwww_log` VALUES ('956', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:54:47');
INSERT INTO `allwww_log` VALUES ('957', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:02');
INSERT INTO `allwww_log` VALUES ('958', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:15');
INSERT INTO `allwww_log` VALUES ('959', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:17');
INSERT INTO `allwww_log` VALUES ('960', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:20');
INSERT INTO `allwww_log` VALUES ('961', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:24');
INSERT INTO `allwww_log` VALUES ('962', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:26');
INSERT INTO `allwww_log` VALUES ('963', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:32');
INSERT INTO `allwww_log` VALUES ('964', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:55:34');
INSERT INTO `allwww_log` VALUES ('965', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:56:09');
INSERT INTO `allwww_log` VALUES ('966', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:56:30');
INSERT INTO `allwww_log` VALUES ('967', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:56:48');
INSERT INTO `allwww_log` VALUES ('968', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:56:50');
INSERT INTO `allwww_log` VALUES ('969', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:56:54');
INSERT INTO `allwww_log` VALUES ('970', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.44.46.23', '2016-06-08 17:57:01');
INSERT INTO `allwww_log` VALUES ('971', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:57:23');
INSERT INTO `allwww_log` VALUES ('972', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 17:58:23');
INSERT INTO `allwww_log` VALUES ('973', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:00:49');
INSERT INTO `allwww_log` VALUES ('974', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:03:55');
INSERT INTO `allwww_log` VALUES ('975', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:07:17');
INSERT INTO `allwww_log` VALUES ('976', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:07:39');
INSERT INTO `allwww_log` VALUES ('977', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:07:42');
INSERT INTO `allwww_log` VALUES ('978', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:07:49');
INSERT INTO `allwww_log` VALUES ('979', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:08:10');
INSERT INTO `allwww_log` VALUES ('980', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:08:11');
INSERT INTO `allwww_log` VALUES ('981', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:08:13');
INSERT INTO `allwww_log` VALUES ('982', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:08:16');
INSERT INTO `allwww_log` VALUES ('983', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:08:44');
INSERT INTO `allwww_log` VALUES ('984', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:09:02');
INSERT INTO `allwww_log` VALUES ('985', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:09:48');
INSERT INTO `allwww_log` VALUES ('986', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.68.215', '2016-06-08 18:10:01');
INSERT INTO `allwww_log` VALUES ('987', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.108.80.206', '2016-06-08 18:10:02');
INSERT INTO `allwww_log` VALUES ('988', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.18.147', '2016-06-08 18:10:02');
INSERT INTO `allwww_log` VALUES ('989', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:10:16');
INSERT INTO `allwww_log` VALUES ('990', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:10:27');
INSERT INTO `allwww_log` VALUES ('991', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:10:30');
INSERT INTO `allwww_log` VALUES ('992', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:10:46');
INSERT INTO `allwww_log` VALUES ('993', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:11:25');
INSERT INTO `allwww_log` VALUES ('994', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:13:35');
INSERT INTO `allwww_log` VALUES ('995', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:13:43');
INSERT INTO `allwww_log` VALUES ('996', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:13:47');
INSERT INTO `allwww_log` VALUES ('997', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:19:22');
INSERT INTO `allwww_log` VALUES ('998', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:19:36');
INSERT INTO `allwww_log` VALUES ('999', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.177', '2016-06-08 18:19:36');
INSERT INTO `allwww_log` VALUES ('1000', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.140', '2016-06-08 18:19:36');
INSERT INTO `allwww_log` VALUES ('1001', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:39');
INSERT INTO `allwww_log` VALUES ('1002', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:41');
INSERT INTO `allwww_log` VALUES ('1003', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:41');
INSERT INTO `allwww_log` VALUES ('1004', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:42');
INSERT INTO `allwww_log` VALUES ('1005', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:43');
INSERT INTO `allwww_log` VALUES ('1006', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:45');
INSERT INTO `allwww_log` VALUES ('1007', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:46');
INSERT INTO `allwww_log` VALUES ('1008', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:47');
INSERT INTO `allwww_log` VALUES ('1009', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:19:47');
INSERT INTO `allwww_log` VALUES ('1010', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 18:22:18');
INSERT INTO `allwww_log` VALUES ('1011', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 18:22:44');
INSERT INTO `allwww_log` VALUES ('1012', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:25:19');
INSERT INTO `allwww_log` VALUES ('1013', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.44.46.23', '2016-06-08 18:29:22');
INSERT INTO `allwww_log` VALUES ('1014', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:51:50');
INSERT INTO `allwww_log` VALUES ('1015', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 18:54:07');
INSERT INTO `allwww_log` VALUES ('1016', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 19:03:48');
INSERT INTO `allwww_log` VALUES ('1017', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 19:06:35');
INSERT INTO `allwww_log` VALUES ('1018', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 19:07:26');
INSERT INTO `allwww_log` VALUES ('1019', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 19:07:41');
INSERT INTO `allwww_log` VALUES ('1020', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:07:47');
INSERT INTO `allwww_log` VALUES ('1021', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:07:59');
INSERT INTO `allwww_log` VALUES ('1022', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:08:00');
INSERT INTO `allwww_log` VALUES ('1023', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:08:03');
INSERT INTO `allwww_log` VALUES ('1024', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:08:05');
INSERT INTO `allwww_log` VALUES ('1025', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:08:09');
INSERT INTO `allwww_log` VALUES ('1026', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.44.46.23', '2016-06-08 19:08:15');
INSERT INTO `allwww_log` VALUES ('1027', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '61.151.218.118', '2016-06-08 19:08:18');
INSERT INTO `allwww_log` VALUES ('1028', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-08 19:08:18');
INSERT INTO `allwww_log` VALUES ('1029', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:38:55');
INSERT INTO `allwww_log` VALUES ('1030', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:40:54');
INSERT INTO `allwww_log` VALUES ('1031', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:42:12');
INSERT INTO `allwww_log` VALUES ('1032', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:43:36');
INSERT INTO `allwww_log` VALUES ('1033', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-08 19:45:53');
INSERT INTO `allwww_log` VALUES ('1034', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.214.198', '2016-06-08 19:45:53');
INSERT INTO `allwww_log` VALUES ('1035', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:46:16');
INSERT INTO `allwww_log` VALUES ('1036', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:47:07');
INSERT INTO `allwww_log` VALUES ('1037', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:47:08');
INSERT INTO `allwww_log` VALUES ('1038', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 19:47:18');
INSERT INTO `allwww_log` VALUES ('1039', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.44.46.23', '2016-06-08 20:00:10');
INSERT INTO `allwww_log` VALUES ('1040', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.240', '2016-06-08 20:00:12');
INSERT INTO `allwww_log` VALUES ('1041', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-08 20:00:12');
INSERT INTO `allwww_log` VALUES ('1042', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:04:56');
INSERT INTO `allwww_log` VALUES ('1043', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:07:36');
INSERT INTO `allwww_log` VALUES ('1044', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:10:16');
INSERT INTO `allwww_log` VALUES ('1045', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:12:08');
INSERT INTO `allwww_log` VALUES ('1046', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:12:56');
INSERT INTO `allwww_log` VALUES ('1047', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:13:11');
INSERT INTO `allwww_log` VALUES ('1048', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.218', '2016-06-08 20:15:22');
INSERT INTO `allwww_log` VALUES ('1049', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.95', '2016-06-08 20:15:22');
INSERT INTO `allwww_log` VALUES ('1050', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.140', '2016-06-08 20:15:24');
INSERT INTO `allwww_log` VALUES ('1051', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.178.222', '2016-06-08 20:15:28');
INSERT INTO `allwww_log` VALUES ('1052', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:15:36');
INSERT INTO `allwww_log` VALUES ('1053', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:18:17');
INSERT INTO `allwww_log` VALUES ('1054', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:20:58');
INSERT INTO `allwww_log` VALUES ('1055', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:23:38');
INSERT INTO `allwww_log` VALUES ('1056', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:26:18');
INSERT INTO `allwww_log` VALUES ('1057', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:28:58');
INSERT INTO `allwww_log` VALUES ('1058', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:31:38');
INSERT INTO `allwww_log` VALUES ('1059', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:34:18');
INSERT INTO `allwww_log` VALUES ('1060', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:35:38');
INSERT INTO `allwww_log` VALUES ('1061', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.46.178.222', '2016-06-08 20:35:43');
INSERT INTO `allwww_log` VALUES ('1062', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '163.177.69.38', '2016-06-12 09:32:58');
INSERT INTO `allwww_log` VALUES ('1063', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.196', '2016-06-12 09:32:58');
INSERT INTO `allwww_log` VALUES ('1064', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.196', '2016-06-12 09:32:59');
INSERT INTO `allwww_log` VALUES ('1065', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.66.193', '2016-06-12 09:33:00');
INSERT INTO `allwww_log` VALUES ('1066', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.143', '2016-06-12 09:33:00');
INSERT INTO `allwww_log` VALUES ('1067', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '183.232.120.53', '2016-06-12 09:33:01');
INSERT INTO `allwww_log` VALUES ('1068', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 10:01:47');
INSERT INTO `allwww_log` VALUES ('1069', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 10:02:05');
INSERT INTO `allwww_log` VALUES ('1070', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 10:04:29');
INSERT INTO `allwww_log` VALUES ('1071', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.161.55', '2016-06-12 10:04:30');
INSERT INTO `allwww_log` VALUES ('1072', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.99', '2016-06-12 10:04:30');
INSERT INTO `allwww_log` VALUES ('1073', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 10:04:41');
INSERT INTO `allwww_log` VALUES ('1074', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.212.13', '2016-06-12 10:04:41');
INSERT INTO `allwww_log` VALUES ('1075', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.143', '2016-06-12 10:04:41');
INSERT INTO `allwww_log` VALUES ('1076', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:04:44');
INSERT INTO `allwww_log` VALUES ('1077', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.191', '2016-06-12 10:05:05');
INSERT INTO `allwww_log` VALUES ('1078', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-12 10:05:12');
INSERT INTO `allwww_log` VALUES ('1079', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:12:37');
INSERT INTO `allwww_log` VALUES ('1080', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:12:44');
INSERT INTO `allwww_log` VALUES ('1081', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:12:56');
INSERT INTO `allwww_log` VALUES ('1082', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:15:18');
INSERT INTO `allwww_log` VALUES ('1083', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:15:22');
INSERT INTO `allwww_log` VALUES ('1084', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:19:20');
INSERT INTO `allwww_log` VALUES ('1085', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:19:30');
INSERT INTO `allwww_log` VALUES ('1086', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:19:36');
INSERT INTO `allwww_log` VALUES ('1087', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:22:04');
INSERT INTO `allwww_log` VALUES ('1088', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:22:09');
INSERT INTO `allwww_log` VALUES ('1089', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:22:17');
INSERT INTO `allwww_log` VALUES ('1090', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:22:24');
INSERT INTO `allwww_log` VALUES ('1091', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:27:38');
INSERT INTO `allwww_log` VALUES ('1092', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:27:42');
INSERT INTO `allwww_log` VALUES ('1093', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:28:21');
INSERT INTO `allwww_log` VALUES ('1094', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:28:31');
INSERT INTO `allwww_log` VALUES ('1095', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:29:16');
INSERT INTO `allwww_log` VALUES ('1096', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:30:19');
INSERT INTO `allwww_log` VALUES ('1097', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:30:47');
INSERT INTO `allwww_log` VALUES ('1098', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:31:43');
INSERT INTO `allwww_log` VALUES ('1099', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:31:50');
INSERT INTO `allwww_log` VALUES ('1100', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:31:52');
INSERT INTO `allwww_log` VALUES ('1101', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:31:53');
INSERT INTO `allwww_log` VALUES ('1102', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:31:58');
INSERT INTO `allwww_log` VALUES ('1103', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:32:36');
INSERT INTO `allwww_log` VALUES ('1104', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:33:08');
INSERT INTO `allwww_log` VALUES ('1105', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:33:16');
INSERT INTO `allwww_log` VALUES ('1106', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:33:49');
INSERT INTO `allwww_log` VALUES ('1107', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:34:15');
INSERT INTO `allwww_log` VALUES ('1108', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:34:49');
INSERT INTO `allwww_log` VALUES ('1109', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:34:57');
INSERT INTO `allwww_log` VALUES ('1110', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:00');
INSERT INTO `allwww_log` VALUES ('1111', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:17');
INSERT INTO `allwww_log` VALUES ('1112', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:18');
INSERT INTO `allwww_log` VALUES ('1113', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:19');
INSERT INTO `allwww_log` VALUES ('1114', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:19');
INSERT INTO `allwww_log` VALUES ('1115', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:20');
INSERT INTO `allwww_log` VALUES ('1116', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:21');
INSERT INTO `allwww_log` VALUES ('1117', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:22');
INSERT INTO `allwww_log` VALUES ('1118', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:24');
INSERT INTO `allwww_log` VALUES ('1119', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:29');
INSERT INTO `allwww_log` VALUES ('1120', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:32');
INSERT INTO `allwww_log` VALUES ('1121', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:35:38');
INSERT INTO `allwww_log` VALUES ('1122', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:36:08');
INSERT INTO `allwww_log` VALUES ('1123', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:36:23');
INSERT INTO `allwww_log` VALUES ('1124', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:36:24');
INSERT INTO `allwww_log` VALUES ('1125', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:36:24');
INSERT INTO `allwww_log` VALUES ('1126', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:36:26');
INSERT INTO `allwww_log` VALUES ('1127', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', '', '117.36.25.231', '2016-06-12 10:42:37');
INSERT INTO `allwww_log` VALUES ('1128', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:37');
INSERT INTO `allwww_log` VALUES ('1129', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:37');
INSERT INTO `allwww_log` VALUES ('1130', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:37');
INSERT INTO `allwww_log` VALUES ('1131', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:39');
INSERT INTO `allwww_log` VALUES ('1132', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:40');
INSERT INTO `allwww_log` VALUES ('1133', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 10:42:51');
INSERT INTO `allwww_log` VALUES ('1134', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:42:53');
INSERT INTO `allwww_log` VALUES ('1135', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:43:19');
INSERT INTO `allwww_log` VALUES ('1136', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:43:19');
INSERT INTO `allwww_log` VALUES ('1137', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:43:23');
INSERT INTO `allwww_log` VALUES ('1138', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:43:25');
INSERT INTO `allwww_log` VALUES ('1139', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:43:26');
INSERT INTO `allwww_log` VALUES ('1140', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:48:22');
INSERT INTO `allwww_log` VALUES ('1141', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 10:48:29');
INSERT INTO `allwww_log` VALUES ('1142', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 11:04:18');
INSERT INTO `allwww_log` VALUES ('1143', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 11:04:31');
INSERT INTO `allwww_log` VALUES ('1144', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', '', '117.36.25.231', '2016-06-12 11:05:52');
INSERT INTO `allwww_log` VALUES ('1145', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 11:05:52');
INSERT INTO `allwww_log` VALUES ('1146', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 11:05:52');
INSERT INTO `allwww_log` VALUES ('1147', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 11:05:52');
INSERT INTO `allwww_log` VALUES ('1148', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 11:05:53');
INSERT INTO `allwww_log` VALUES ('1149', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 11:06:02');
INSERT INTO `allwww_log` VALUES ('1150', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 11:06:04');
INSERT INTO `allwww_log` VALUES ('1151', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.34.182', '2016-06-12 12:10:12');
INSERT INTO `allwww_log` VALUES ('1152', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 12:10:22');
INSERT INTO `allwww_log` VALUES ('1153', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:34:02');
INSERT INTO `allwww_log` VALUES ('1154', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:34:05');
INSERT INTO `allwww_log` VALUES ('1155', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:36:41');
INSERT INTO `allwww_log` VALUES ('1156', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:36:45');
INSERT INTO `allwww_log` VALUES ('1157', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:39:21');
INSERT INTO `allwww_log` VALUES ('1158', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:39:25');
INSERT INTO `allwww_log` VALUES ('1159', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:42:01');
INSERT INTO `allwww_log` VALUES ('1160', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:42:05');
INSERT INTO `allwww_log` VALUES ('1161', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:44:41');
INSERT INTO `allwww_log` VALUES ('1162', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:44:46');
INSERT INTO `allwww_log` VALUES ('1163', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:47:21');
INSERT INTO `allwww_log` VALUES ('1164', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:47:25');
INSERT INTO `allwww_log` VALUES ('1165', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:49:40');
INSERT INTO `allwww_log` VALUES ('1166', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:01');
INSERT INTO `allwww_log` VALUES ('1167', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:02');
INSERT INTO `allwww_log` VALUES ('1168', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:13');
INSERT INTO `allwww_log` VALUES ('1169', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:13');
INSERT INTO `allwww_log` VALUES ('1170', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:13');
INSERT INTO `allwww_log` VALUES ('1171', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:19');
INSERT INTO `allwww_log` VALUES ('1172', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 12:50:29');
INSERT INTO `allwww_log` VALUES ('1173', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 12:59:35');
INSERT INTO `allwww_log` VALUES ('1174', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 12:59:52');
INSERT INTO `allwww_log` VALUES ('1175', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 12:59:56');
INSERT INTO `allwww_log` VALUES ('1176', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 13:00:05');
INSERT INTO `allwww_log` VALUES ('1177', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:02:24');
INSERT INTO `allwww_log` VALUES ('1178', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:02:25');
INSERT INTO `allwww_log` VALUES ('1179', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:03:37');
INSERT INTO `allwww_log` VALUES ('1180', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:05:20');
INSERT INTO `allwww_log` VALUES ('1181', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:06:59');
INSERT INTO `allwww_log` VALUES ('1182', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:07:28');
INSERT INTO `allwww_log` VALUES ('1183', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:09:48');
INSERT INTO `allwww_log` VALUES ('1184', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:21');
INSERT INTO `allwww_log` VALUES ('1185', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:28');
INSERT INTO `allwww_log` VALUES ('1186', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:28');
INSERT INTO `allwww_log` VALUES ('1187', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:29');
INSERT INTO `allwww_log` VALUES ('1188', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:38');
INSERT INTO `allwww_log` VALUES ('1189', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=kaifazhe', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:10:39');
INSERT INTO `allwww_log` VALUES ('1190', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 13:40:27');
INSERT INTO `allwww_log` VALUES ('1191', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 13:40:39');
INSERT INTO `allwww_log` VALUES ('1192', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '117.36.25.231', '2016-06-12 13:40:40');
INSERT INTO `allwww_log` VALUES ('1193', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 13:59:19');
INSERT INTO `allwww_log` VALUES ('1194', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 13:59:30');
INSERT INTO `allwww_log` VALUES ('1195', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:03:40');
INSERT INTO `allwww_log` VALUES ('1196', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:05:27');
INSERT INTO `allwww_log` VALUES ('1197', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:05:46');
INSERT INTO `allwww_log` VALUES ('1198', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:05:50');
INSERT INTO `allwww_log` VALUES ('1199', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:06:05');
INSERT INTO `allwww_log` VALUES ('1200', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:13:17');
INSERT INTO `allwww_log` VALUES ('1201', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:13:28');
INSERT INTO `allwww_log` VALUES ('1202', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:23:37');
INSERT INTO `allwww_log` VALUES ('1203', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:25:13');
INSERT INTO `allwww_log` VALUES ('1204', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:25:22');
INSERT INTO `allwww_log` VALUES ('1205', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:26:01');
INSERT INTO `allwww_log` VALUES ('1206', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:26:14');
INSERT INTO `allwww_log` VALUES ('1207', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:26:41');
INSERT INTO `allwww_log` VALUES ('1208', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:26:52');
INSERT INTO `allwww_log` VALUES ('1209', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:26:56');
INSERT INTO `allwww_log` VALUES ('1210', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:27:25');
INSERT INTO `allwww_log` VALUES ('1211', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:27:41');
INSERT INTO `allwww_log` VALUES ('1212', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:27:50');
INSERT INTO `allwww_log` VALUES ('1213', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=listorder', '', '1', 'admin', '117.36.25.231', '2016-06-12 14:28:59');
INSERT INTO `allwww_log` VALUES ('1214', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:32:34');
INSERT INTO `allwww_log` VALUES ('1215', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:32:43');
INSERT INTO `allwww_log` VALUES ('1216', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:32:45');
INSERT INTO `allwww_log` VALUES ('1217', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:32:45');
INSERT INTO `allwww_log` VALUES ('1218', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:33:02');
INSERT INTO `allwww_log` VALUES ('1219', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:36:35');
INSERT INTO `allwww_log` VALUES ('1220', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 14:36:44');
INSERT INTO `allwww_log` VALUES ('1221', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '117.36.25.231', '2016-06-12 15:07:33');
INSERT INTO `allwww_log` VALUES ('1222', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:09:38');
INSERT INTO `allwww_log` VALUES ('1223', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:09:48');
INSERT INTO `allwww_log` VALUES ('1224', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:55:48');
INSERT INTO `allwww_log` VALUES ('1225', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:55:56');
INSERT INTO `allwww_log` VALUES ('1226', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:56:34');
INSERT INTO `allwww_log` VALUES ('1227', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:56:43');
INSERT INTO `allwww_log` VALUES ('1228', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:56:45');
INSERT INTO `allwww_log` VALUES ('1229', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 15:56:55');
INSERT INTO `allwww_log` VALUES ('1230', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 17:06:16');
INSERT INTO `allwww_log` VALUES ('1231', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 17:06:28');
INSERT INTO `allwww_log` VALUES ('1232', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 17:10:22');
INSERT INTO `allwww_log` VALUES ('1233', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 17:10:41');
INSERT INTO `allwww_log` VALUES ('1234', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 18:01:51');
INSERT INTO `allwww_log` VALUES ('1235', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '117.36.25.231', '2016-06-12 18:01:51');
INSERT INTO `allwww_log` VALUES ('1236', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 18:02:30');
INSERT INTO `allwww_log` VALUES ('1237', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 18:02:32');
INSERT INTO `allwww_log` VALUES ('1238', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '117.36.25.231', '2016-06-12 18:02:51');
INSERT INTO `allwww_log` VALUES ('1239', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 18:25:41');
INSERT INTO `allwww_log` VALUES ('1240', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', '', '117.36.25.231', '2016-06-12 18:25:52');
INSERT INTO `allwww_log` VALUES ('1241', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 08:30:35');
INSERT INTO `allwww_log` VALUES ('1242', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 09:12:21');
INSERT INTO `allwww_log` VALUES ('1243', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:14:18');
INSERT INTO `allwww_log` VALUES ('1244', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:14:24');
INSERT INTO `allwww_log` VALUES ('1245', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:14:30');
INSERT INTO `allwww_log` VALUES ('1246', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:15:33');
INSERT INTO `allwww_log` VALUES ('1247', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:16:39');
INSERT INTO `allwww_log` VALUES ('1248', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 09:31:06');
INSERT INTO `allwww_log` VALUES ('1249', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:14:42');
INSERT INTO `allwww_log` VALUES ('1250', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:15:33');
INSERT INTO `allwww_log` VALUES ('1251', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:22:02');
INSERT INTO `allwww_log` VALUES ('1252', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:22:17');
INSERT INTO `allwww_log` VALUES ('1253', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:22:31');
INSERT INTO `allwww_log` VALUES ('1254', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:28:50');
INSERT INTO `allwww_log` VALUES ('1255', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:32:29');
INSERT INTO `allwww_log` VALUES ('1256', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:35:39');
INSERT INTO `allwww_log` VALUES ('1257', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:41:12');
INSERT INTO `allwww_log` VALUES ('1258', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:45:34');
INSERT INTO `allwww_log` VALUES ('1259', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 10:46:12');
INSERT INTO `allwww_log` VALUES ('1260', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:00:40');
INSERT INTO `allwww_log` VALUES ('1261', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:06:04');
INSERT INTO `allwww_log` VALUES ('1262', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '112.90.82.218', '2016-06-13 11:11:10');
INSERT INTO `allwww_log` VALUES ('1263', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.205.254', '2016-06-13 11:11:12');
INSERT INTO `allwww_log` VALUES ('1264', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 11:11:20');
INSERT INTO `allwww_log` VALUES ('1265', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.140', '2016-06-13 11:11:26');
INSERT INTO `allwww_log` VALUES ('1266', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 11:11:28');
INSERT INTO `allwww_log` VALUES ('1267', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:12:14');
INSERT INTO `allwww_log` VALUES ('1268', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:16:30');
INSERT INTO `allwww_log` VALUES ('1269', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:16:50');
INSERT INTO `allwww_log` VALUES ('1270', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:17:16');
INSERT INTO `allwww_log` VALUES ('1271', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:21:43');
INSERT INTO `allwww_log` VALUES ('1272', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:23:34');
INSERT INTO `allwww_log` VALUES ('1273', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:24:20');
INSERT INTO `allwww_log` VALUES ('1274', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:24:42');
INSERT INTO `allwww_log` VALUES ('1275', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:28:25');
INSERT INTO `allwww_log` VALUES ('1276', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:29:21');
INSERT INTO `allwww_log` VALUES ('1277', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:33:40');
INSERT INTO `allwww_log` VALUES ('1278', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:43:35');
INSERT INTO `allwww_log` VALUES ('1279', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:44:11');
INSERT INTO `allwww_log` VALUES ('1280', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:48:00');
INSERT INTO `allwww_log` VALUES ('1281', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:48:34');
INSERT INTO `allwww_log` VALUES ('1282', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:48:59');
INSERT INTO `allwww_log` VALUES ('1283', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:51:41');
INSERT INTO `allwww_log` VALUES ('1284', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:51:52');
INSERT INTO `allwww_log` VALUES ('1285', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:58:32');
INSERT INTO `allwww_log` VALUES ('1286', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 11:59:15');
INSERT INTO `allwww_log` VALUES ('1287', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:01:27');
INSERT INTO `allwww_log` VALUES ('1288', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:03:31');
INSERT INTO `allwww_log` VALUES ('1289', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:05:10');
INSERT INTO `allwww_log` VALUES ('1290', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:07:46');
INSERT INTO `allwww_log` VALUES ('1291', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:10:44');
INSERT INTO `allwww_log` VALUES ('1292', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:12:00');
INSERT INTO `allwww_log` VALUES ('1293', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:12:45');
INSERT INTO `allwww_log` VALUES ('1294', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:13:46');
INSERT INTO `allwww_log` VALUES ('1295', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:15:53');
INSERT INTO `allwww_log` VALUES ('1296', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:16:39');
INSERT INTO `allwww_log` VALUES ('1297', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:18:06');
INSERT INTO `allwww_log` VALUES ('1298', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:18:36');
INSERT INTO `allwww_log` VALUES ('1299', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:18:40');
INSERT INTO `allwww_log` VALUES ('1300', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:20:03');
INSERT INTO `allwww_log` VALUES ('1301', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 12:20:12');
INSERT INTO `allwww_log` VALUES ('1302', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:21:41');
INSERT INTO `allwww_log` VALUES ('1303', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:21:53');
INSERT INTO `allwww_log` VALUES ('1304', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:22:47');
INSERT INTO `allwww_log` VALUES ('1305', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:23:30');
INSERT INTO `allwww_log` VALUES ('1306', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:27:11');
INSERT INTO `allwww_log` VALUES ('1307', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 13:27:15');
INSERT INTO `allwww_log` VALUES ('1308', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 14:44:56');
INSERT INTO `allwww_log` VALUES ('1309', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.18', '2016-06-13 14:44:58');
INSERT INTO `allwww_log` VALUES ('1310', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-13 14:44:58');
INSERT INTO `allwww_log` VALUES ('1311', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 14:45:02');
INSERT INTO `allwww_log` VALUES ('1312', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:42:25');
INSERT INTO `allwww_log` VALUES ('1313', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:45:05');
INSERT INTO `allwww_log` VALUES ('1314', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:47:45');
INSERT INTO `allwww_log` VALUES ('1315', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:48:50');
INSERT INTO `allwww_log` VALUES ('1316', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:48:55');
INSERT INTO `allwww_log` VALUES ('1317', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:48:57');
INSERT INTO `allwww_log` VALUES ('1318', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.249.128', '2016-06-13 15:49:02');
INSERT INTO `allwww_log` VALUES ('1319', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 17:32:13');
INSERT INTO `allwww_log` VALUES ('1320', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 17:32:17');
INSERT INTO `allwww_log` VALUES ('1321', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 17:33:29');
INSERT INTO `allwww_log` VALUES ('1322', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:17:48');
INSERT INTO `allwww_log` VALUES ('1323', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:18:32');
INSERT INTO `allwww_log` VALUES ('1324', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:18:50');
INSERT INTO `allwww_log` VALUES ('1325', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:19:00');
INSERT INTO `allwww_log` VALUES ('1326', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:19:14');
INSERT INTO `allwww_log` VALUES ('1327', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:20:12');
INSERT INTO `allwww_log` VALUES ('1328', '', '0', 'content', '', 'content', '?m=content&c=content&a=edit', '', '1', 'admin', '36.46.249.128', '2016-06-13 18:20:24');
INSERT INTO `allwww_log` VALUES ('1329', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 09:35:21');
INSERT INTO `allwww_log` VALUES ('1330', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 09:35:57');
INSERT INTO `allwww_log` VALUES ('1331', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 09:36:03');
INSERT INTO `allwww_log` VALUES ('1332', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:36:44');
INSERT INTO `allwww_log` VALUES ('1333', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:36:48');
INSERT INTO `allwww_log` VALUES ('1334', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:37:41');
INSERT INTO `allwww_log` VALUES ('1335', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:39:55');
INSERT INTO `allwww_log` VALUES ('1336', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:40:26');
INSERT INTO `allwww_log` VALUES ('1337', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:41:45');
INSERT INTO `allwww_log` VALUES ('1338', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:41:47');
INSERT INTO `allwww_log` VALUES ('1339', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:44:17');
INSERT INTO `allwww_log` VALUES ('1340', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:50:47');
INSERT INTO `allwww_log` VALUES ('1341', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:52:38');
INSERT INTO `allwww_log` VALUES ('1342', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 09:52:55');
INSERT INTO `allwww_log` VALUES ('1343', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:03:07');
INSERT INTO `allwww_log` VALUES ('1344', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:03:26');
INSERT INTO `allwww_log` VALUES ('1345', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:10:36');
INSERT INTO `allwww_log` VALUES ('1346', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 10:12:23');
INSERT INTO `allwww_log` VALUES ('1347', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 10:12:35');
INSERT INTO `allwww_log` VALUES ('1348', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:12:41');
INSERT INTO `allwww_log` VALUES ('1349', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 10:13:06');
INSERT INTO `allwww_log` VALUES ('1350', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 10:13:13');
INSERT INTO `allwww_log` VALUES ('1351', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:13:20');
INSERT INTO `allwww_log` VALUES ('1352', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:13:29');
INSERT INTO `allwww_log` VALUES ('1353', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:14:44');
INSERT INTO `allwww_log` VALUES ('1354', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:16:19');
INSERT INTO `allwww_log` VALUES ('1355', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:17:19');
INSERT INTO `allwww_log` VALUES ('1356', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:17:26');
INSERT INTO `allwww_log` VALUES ('1357', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:17:41');
INSERT INTO `allwww_log` VALUES ('1358', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:21:55');
INSERT INTO `allwww_log` VALUES ('1359', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:21:58');
INSERT INTO `allwww_log` VALUES ('1360', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=block_update', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:27:11');
INSERT INTO `allwww_log` VALUES ('1361', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:28:45');
INSERT INTO `allwww_log` VALUES ('1362', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:28:47');
INSERT INTO `allwww_log` VALUES ('1363', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:28:52');
INSERT INTO `allwww_log` VALUES ('1364', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:31:30');
INSERT INTO `allwww_log` VALUES ('1365', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:31:46');
INSERT INTO `allwww_log` VALUES ('1366', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:31:53');
INSERT INTO `allwww_log` VALUES ('1367', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:32:18');
INSERT INTO `allwww_log` VALUES ('1368', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:32:36');
INSERT INTO `allwww_log` VALUES ('1369', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:32:38');
INSERT INTO `allwww_log` VALUES ('1370', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:32:43');
INSERT INTO `allwww_log` VALUES ('1371', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:33:29');
INSERT INTO `allwww_log` VALUES ('1372', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:33:31');
INSERT INTO `allwww_log` VALUES ('1373', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:33:45');
INSERT INTO `allwww_log` VALUES ('1374', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:34:03');
INSERT INTO `allwww_log` VALUES ('1375', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:34:05');
INSERT INTO `allwww_log` VALUES ('1376', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:34:39');
INSERT INTO `allwww_log` VALUES ('1377', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:38:05');
INSERT INTO `allwww_log` VALUES ('1378', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:38:08');
INSERT INTO `allwww_log` VALUES ('1379', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:39:38');
INSERT INTO `allwww_log` VALUES ('1380', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:39:40');
INSERT INTO `allwww_log` VALUES ('1381', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=field_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:40:20');
INSERT INTO `allwww_log` VALUES ('1382', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:40:32');
INSERT INTO `allwww_log` VALUES ('1383', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:45:34');
INSERT INTO `allwww_log` VALUES ('1384', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=field_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:55:46');
INSERT INTO `allwww_log` VALUES ('1385', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:57:57');
INSERT INTO `allwww_log` VALUES ('1386', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 10:59:37');
INSERT INTO `allwww_log` VALUES ('1387', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:00:51');
INSERT INTO `allwww_log` VALUES ('1388', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:04:38');
INSERT INTO `allwww_log` VALUES ('1389', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:05:26');
INSERT INTO `allwww_log` VALUES ('1390', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:05:48');
INSERT INTO `allwww_log` VALUES ('1391', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:05:50');
INSERT INTO `allwww_log` VALUES ('1392', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:06:21');
INSERT INTO `allwww_log` VALUES ('1393', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 11:26:13');
INSERT INTO `allwww_log` VALUES ('1394', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.141', '2016-06-14 11:26:15');
INSERT INTO `allwww_log` VALUES ('1395', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.33.227', '2016-06-14 11:26:16');
INSERT INTO `allwww_log` VALUES ('1396', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 11:26:19');
INSERT INTO `allwww_log` VALUES ('1397', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.191', '2016-06-14 11:26:44');
INSERT INTO `allwww_log` VALUES ('1398', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.13', '2016-06-14 11:26:49');
INSERT INTO `allwww_log` VALUES ('1399', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:26:54');
INSERT INTO `allwww_log` VALUES ('1400', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:27:00');
INSERT INTO `allwww_log` VALUES ('1401', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.34.189', '2016-06-14 11:32:02');
INSERT INTO `allwww_log` VALUES ('1402', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.68.215', '2016-06-14 11:32:02');
INSERT INTO `allwww_log` VALUES ('1403', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.64.174', '2016-06-14 11:32:04');
INSERT INTO `allwww_log` VALUES ('1404', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '14.17.18.146', '2016-06-14 11:32:07');
INSERT INTO `allwww_log` VALUES ('1405', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 11:32:08');
INSERT INTO `allwww_log` VALUES ('1406', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 11:32:12');
INSERT INTO `allwww_log` VALUES ('1407', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 11:55:56');
INSERT INTO `allwww_log` VALUES ('1408', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 11:58:53');
INSERT INTO `allwww_log` VALUES ('1409', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 11:59:04');
INSERT INTO `allwww_log` VALUES ('1410', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:07:58');
INSERT INTO `allwww_log` VALUES ('1411', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:08:05');
INSERT INTO `allwww_log` VALUES ('1412', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:09:56');
INSERT INTO `allwww_log` VALUES ('1413', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:17:09');
INSERT INTO `allwww_log` VALUES ('1414', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:17:15');
INSERT INTO `allwww_log` VALUES ('1415', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 12:17:18');
INSERT INTO `allwww_log` VALUES ('1416', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:09:24');
INSERT INTO `allwww_log` VALUES ('1417', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:09:24');
INSERT INTO `allwww_log` VALUES ('1418', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:09:24');
INSERT INTO `allwww_log` VALUES ('1419', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:09:24');
INSERT INTO `allwww_log` VALUES ('1420', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:11:48');
INSERT INTO `allwww_log` VALUES ('1421', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:11:48');
INSERT INTO `allwww_log` VALUES ('1422', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:11:48');
INSERT INTO `allwww_log` VALUES ('1423', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:12:02');
INSERT INTO `allwww_log` VALUES ('1424', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:12:10');
INSERT INTO `allwww_log` VALUES ('1425', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:14:28');
INSERT INTO `allwww_log` VALUES ('1426', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:16:15');
INSERT INTO `allwww_log` VALUES ('1427', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:17:08');
INSERT INTO `allwww_log` VALUES ('1428', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:19:07');
INSERT INTO `allwww_log` VALUES ('1429', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:19:48');
INSERT INTO `allwww_log` VALUES ('1430', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:22:28');
INSERT INTO `allwww_log` VALUES ('1431', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:22:33');
INSERT INTO `allwww_log` VALUES ('1432', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:23:15');
INSERT INTO `allwww_log` VALUES ('1433', '', '0', 'admin', '', 'admin_manage', '?m=admin&c=admin_manage&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:24:41');
INSERT INTO `allwww_log` VALUES ('1434', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:25:08');
INSERT INTO `allwww_log` VALUES ('1435', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:27:48');
INSERT INTO `allwww_log` VALUES ('1436', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:30:28');
INSERT INTO `allwww_log` VALUES ('1437', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:33:08');
INSERT INTO `allwww_log` VALUES ('1438', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:35:48');
INSERT INTO `allwww_log` VALUES ('1439', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:38:28');
INSERT INTO `allwww_log` VALUES ('1440', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:41:08');
INSERT INTO `allwww_log` VALUES ('1441', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.97', '2016-06-14 13:41:31');
INSERT INTO `allwww_log` VALUES ('1442', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.65.106', '2016-06-14 13:41:31');
INSERT INTO `allwww_log` VALUES ('1443', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.163.191', '2016-06-14 13:41:55');
INSERT INTO `allwww_log` VALUES ('1444', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:43:11');
INSERT INTO `allwww_log` VALUES ('1445', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:43:19');
INSERT INTO `allwww_log` VALUES ('1446', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.65.108', '2016-06-14 13:43:40');
INSERT INTO `allwww_log` VALUES ('1447', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.139', '2016-06-14 13:43:40');
INSERT INTO `allwww_log` VALUES ('1448', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.98', '2016-06-14 13:43:45');
INSERT INTO `allwww_log` VALUES ('1449', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.161.217', '2016-06-14 13:43:46');
INSERT INTO `allwww_log` VALUES ('1450', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-14 13:43:48');
INSERT INTO `allwww_log` VALUES ('1451', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:43:48');
INSERT INTO `allwww_log` VALUES ('1452', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:46:28');
INSERT INTO `allwww_log` VALUES ('1453', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:49:08');
INSERT INTO `allwww_log` VALUES ('1454', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:51:48');
INSERT INTO `allwww_log` VALUES ('1455', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:54:28');
INSERT INTO `allwww_log` VALUES ('1456', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:57:08');
INSERT INTO `allwww_log` VALUES ('1457', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 13:59:48');
INSERT INTO `allwww_log` VALUES ('1458', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:02:28');
INSERT INTO `allwww_log` VALUES ('1459', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:05:09');
INSERT INTO `allwww_log` VALUES ('1460', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:07:48');
INSERT INTO `allwww_log` VALUES ('1461', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:10:29');
INSERT INTO `allwww_log` VALUES ('1462', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:13:08');
INSERT INTO `allwww_log` VALUES ('1463', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:15:49');
INSERT INTO `allwww_log` VALUES ('1464', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:18:30');
INSERT INTO `allwww_log` VALUES ('1465', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:21:10');
INSERT INTO `allwww_log` VALUES ('1466', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:23:50');
INSERT INTO `allwww_log` VALUES ('1467', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:26:29');
INSERT INTO `allwww_log` VALUES ('1468', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:29:09');
INSERT INTO `allwww_log` VALUES ('1469', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:31:50');
INSERT INTO `allwww_log` VALUES ('1470', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:34:30');
INSERT INTO `allwww_log` VALUES ('1471', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:37:09');
INSERT INTO `allwww_log` VALUES ('1472', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:39:49');
INSERT INTO `allwww_log` VALUES ('1473', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:42:29');
INSERT INTO `allwww_log` VALUES ('1474', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:45:10');
INSERT INTO `allwww_log` VALUES ('1475', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:47:50');
INSERT INTO `allwww_log` VALUES ('1476', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:50:30');
INSERT INTO `allwww_log` VALUES ('1477', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:53:09');
INSERT INTO `allwww_log` VALUES ('1478', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:55:49');
INSERT INTO `allwww_log` VALUES ('1479', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 14:58:29');
INSERT INTO `allwww_log` VALUES ('1480', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:01:10');
INSERT INTO `allwww_log` VALUES ('1481', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:03:50');
INSERT INTO `allwww_log` VALUES ('1482', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:06:29');
INSERT INTO `allwww_log` VALUES ('1483', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:09:09');
INSERT INTO `allwww_log` VALUES ('1484', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:11:49');
INSERT INTO `allwww_log` VALUES ('1485', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:14:29');
INSERT INTO `allwww_log` VALUES ('1486', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:17:10');
INSERT INTO `allwww_log` VALUES ('1487', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:19:51');
INSERT INTO `allwww_log` VALUES ('1488', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:22:30');
INSERT INTO `allwww_log` VALUES ('1489', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:25:10');
INSERT INTO `allwww_log` VALUES ('1490', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:27:51');
INSERT INTO `allwww_log` VALUES ('1491', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:30:30');
INSERT INTO `allwww_log` VALUES ('1492', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:33:10');
INSERT INTO `allwww_log` VALUES ('1493', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:35:50');
INSERT INTO `allwww_log` VALUES ('1494', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:38:30');
INSERT INTO `allwww_log` VALUES ('1495', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:41:10');
INSERT INTO `allwww_log` VALUES ('1496', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:43:51');
INSERT INTO `allwww_log` VALUES ('1497', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:46:30');
INSERT INTO `allwww_log` VALUES ('1498', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:49:10');
INSERT INTO `allwww_log` VALUES ('1499', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:51:51');
INSERT INTO `allwww_log` VALUES ('1500', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:54:31');
INSERT INTO `allwww_log` VALUES ('1501', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:57:11');
INSERT INTO `allwww_log` VALUES ('1502', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 15:59:51');
INSERT INTO `allwww_log` VALUES ('1503', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:02:32');
INSERT INTO `allwww_log` VALUES ('1504', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:05:11');
INSERT INTO `allwww_log` VALUES ('1505', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:07:51');
INSERT INTO `allwww_log` VALUES ('1506', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:10:31');
INSERT INTO `allwww_log` VALUES ('1507', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:13:11');
INSERT INTO `allwww_log` VALUES ('1508', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:15:51');
INSERT INTO `allwww_log` VALUES ('1509', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:18:32');
INSERT INTO `allwww_log` VALUES ('1510', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:21:12');
INSERT INTO `allwww_log` VALUES ('1511', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:23:52');
INSERT INTO `allwww_log` VALUES ('1512', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:26:32');
INSERT INTO `allwww_log` VALUES ('1513', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:29:12');
INSERT INTO `allwww_log` VALUES ('1514', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:31:52');
INSERT INTO `allwww_log` VALUES ('1515', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:34:30');
INSERT INTO `allwww_log` VALUES ('1516', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:34:32');
INSERT INTO `allwww_log` VALUES ('1517', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:34:36');
INSERT INTO `allwww_log` VALUES ('1518', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:37:06');
INSERT INTO `allwww_log` VALUES ('1519', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:37:12');
INSERT INTO `allwww_log` VALUES ('1520', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:37:13');
INSERT INTO `allwww_log` VALUES ('1521', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:37:41');
INSERT INTO `allwww_log` VALUES ('1522', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '113.108.21.69', '2016-06-14 16:37:46');
INSERT INTO `allwww_log` VALUES ('1523', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.68.215', '2016-06-14 16:37:47');
INSERT INTO `allwww_log` VALUES ('1524', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:38:02');
INSERT INTO `allwww_log` VALUES ('1525', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:38:04');
INSERT INTO `allwww_log` VALUES ('1526', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:38:14');
INSERT INTO `allwww_log` VALUES ('1527', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:39:52');
INSERT INTO `allwww_log` VALUES ('1528', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:40:02');
INSERT INTO `allwww_log` VALUES ('1529', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:40:16');
INSERT INTO `allwww_log` VALUES ('1530', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:40:17');
INSERT INTO `allwww_log` VALUES ('1531', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:40:27');
INSERT INTO `allwww_log` VALUES ('1532', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:42:32');
INSERT INTO `allwww_log` VALUES ('1533', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:45:12');
INSERT INTO `allwww_log` VALUES ('1534', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:47:52');
INSERT INTO `allwww_log` VALUES ('1535', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:50:32');
INSERT INTO `allwww_log` VALUES ('1536', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:52:48');
INSERT INTO `allwww_log` VALUES ('1537', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '36.47.0.140', '2016-06-14 16:53:00');
INSERT INTO `allwww_log` VALUES ('1538', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:53:12');
INSERT INTO `allwww_log` VALUES ('1539', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:55:52');
INSERT INTO `allwww_log` VALUES ('1540', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:58:11');
INSERT INTO `allwww_log` VALUES ('1541', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:58:15');
INSERT INTO `allwww_log` VALUES ('1542', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:58:32');
INSERT INTO `allwww_log` VALUES ('1543', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:58:56');
INSERT INTO `allwww_log` VALUES ('1544', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 16:59:00');
INSERT INTO `allwww_log` VALUES ('1545', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:01:12');
INSERT INTO `allwww_log` VALUES ('1546', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:03:06');
INSERT INTO `allwww_log` VALUES ('1547', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:03:09');
INSERT INTO `allwww_log` VALUES ('1548', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:03:52');
INSERT INTO `allwww_log` VALUES ('1549', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:06:32');
INSERT INTO `allwww_log` VALUES ('1550', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:09:12');
INSERT INTO `allwww_log` VALUES ('1551', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:11:52');
INSERT INTO `allwww_log` VALUES ('1552', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:14:32');
INSERT INTO `allwww_log` VALUES ('1553', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:17:12');
INSERT INTO `allwww_log` VALUES ('1554', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:19:52');
INSERT INTO `allwww_log` VALUES ('1555', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:22:32');
INSERT INTO `allwww_log` VALUES ('1556', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:25:12');
INSERT INTO `allwww_log` VALUES ('1557', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:27:52');
INSERT INTO `allwww_log` VALUES ('1558', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:30:32');
INSERT INTO `allwww_log` VALUES ('1559', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:33:12');
INSERT INTO `allwww_log` VALUES ('1560', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:35:52');
INSERT INTO `allwww_log` VALUES ('1561', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:38:32');
INSERT INTO `allwww_log` VALUES ('1562', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:41:12');
INSERT INTO `allwww_log` VALUES ('1563', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:43:52');
INSERT INTO `allwww_log` VALUES ('1564', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:46:32');
INSERT INTO `allwww_log` VALUES ('1565', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:49:12');
INSERT INTO `allwww_log` VALUES ('1566', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:51:52');
INSERT INTO `allwww_log` VALUES ('1567', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:54:32');
INSERT INTO `allwww_log` VALUES ('1568', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:57:12');
INSERT INTO `allwww_log` VALUES ('1569', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 17:59:52');
INSERT INTO `allwww_log` VALUES ('1570', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:02:32');
INSERT INTO `allwww_log` VALUES ('1571', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:05:12');
INSERT INTO `allwww_log` VALUES ('1572', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:07:52');
INSERT INTO `allwww_log` VALUES ('1573', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:10:32');
INSERT INTO `allwww_log` VALUES ('1574', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:13:12');
INSERT INTO `allwww_log` VALUES ('1575', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:15:52');
INSERT INTO `allwww_log` VALUES ('1576', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:18:32');
INSERT INTO `allwww_log` VALUES ('1577', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:21:12');
INSERT INTO `allwww_log` VALUES ('1578', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:23:52');
INSERT INTO `allwww_log` VALUES ('1579', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:26:32');
INSERT INTO `allwww_log` VALUES ('1580', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:29:12');
INSERT INTO `allwww_log` VALUES ('1581', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:31:52');
INSERT INTO `allwww_log` VALUES ('1582', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:34:32');
INSERT INTO `allwww_log` VALUES ('1583', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:37:12');
INSERT INTO `allwww_log` VALUES ('1584', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:39:53');
INSERT INTO `allwww_log` VALUES ('1585', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:42:33');
INSERT INTO `allwww_log` VALUES ('1586', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:45:13');
INSERT INTO `allwww_log` VALUES ('1587', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:47:53');
INSERT INTO `allwww_log` VALUES ('1588', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:50:34');
INSERT INTO `allwww_log` VALUES ('1589', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:53:13');
INSERT INTO `allwww_log` VALUES ('1590', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:55:53');
INSERT INTO `allwww_log` VALUES ('1591', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 18:58:33');
INSERT INTO `allwww_log` VALUES ('1592', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:01:14');
INSERT INTO `allwww_log` VALUES ('1593', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:03:53');
INSERT INTO `allwww_log` VALUES ('1594', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:06:33');
INSERT INTO `allwww_log` VALUES ('1595', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:09:13');
INSERT INTO `allwww_log` VALUES ('1596', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:11:53');
INSERT INTO `allwww_log` VALUES ('1597', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:14:33');
INSERT INTO `allwww_log` VALUES ('1598', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:17:14');
INSERT INTO `allwww_log` VALUES ('1599', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:19:54');
INSERT INTO `allwww_log` VALUES ('1600', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:22:33');
INSERT INTO `allwww_log` VALUES ('1601', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:25:13');
INSERT INTO `allwww_log` VALUES ('1602', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:27:53');
INSERT INTO `allwww_log` VALUES ('1603', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:30:33');
INSERT INTO `allwww_log` VALUES ('1604', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:33:13');
INSERT INTO `allwww_log` VALUES ('1605', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:35:53');
INSERT INTO `allwww_log` VALUES ('1606', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:38:33');
INSERT INTO `allwww_log` VALUES ('1607', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:41:13');
INSERT INTO `allwww_log` VALUES ('1608', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:43:53');
INSERT INTO `allwww_log` VALUES ('1609', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:46:33');
INSERT INTO `allwww_log` VALUES ('1610', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-14 19:49:13');
INSERT INTO `allwww_log` VALUES ('1611', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-15 08:42:44');
INSERT INTO `allwww_log` VALUES ('1612', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.47.0.140', '2016-06-15 08:42:51');
INSERT INTO `allwww_log` VALUES ('1613', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:43:07');
INSERT INTO `allwww_log` VALUES ('1614', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:43:13');
INSERT INTO `allwww_log` VALUES ('1615', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:44:00');
INSERT INTO `allwww_log` VALUES ('1616', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:44:54');
INSERT INTO `allwww_log` VALUES ('1617', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:44:56');
INSERT INTO `allwww_log` VALUES ('1618', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:45:06');
INSERT INTO `allwww_log` VALUES ('1619', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:45:15');
INSERT INTO `allwww_log` VALUES ('1620', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:45:17');
INSERT INTO `allwww_log` VALUES ('1621', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.47.0.140', '2016-06-15 08:45:17');
INSERT INTO `allwww_log` VALUES ('1622', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '119.147.207.158', '2016-06-15 13:48:17');
INSERT INTO `allwww_log` VALUES ('1623', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.68.215', '2016-06-15 13:48:18');
INSERT INTO `allwww_log` VALUES ('1624', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.177.94', '2016-06-16 08:52:55');
INSERT INTO `allwww_log` VALUES ('1625', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.177.94', '2016-06-16 08:52:56');
INSERT INTO `allwww_log` VALUES ('1626', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.177.94', '2016-06-16 08:54:16');
INSERT INTO `allwww_log` VALUES ('1627', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.177.94', '2016-06-16 08:56:48');
INSERT INTO `allwww_log` VALUES ('1628', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.65.108', '2016-06-16 08:56:49');
INSERT INTO `allwww_log` VALUES ('1629', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.96', '2016-06-16 08:56:49');
INSERT INTO `allwww_log` VALUES ('1630', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.99', '2016-06-16 08:56:50');
INSERT INTO `allwww_log` VALUES ('1631', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.161.217', '2016-06-16 08:56:50');
INSERT INTO `allwww_log` VALUES ('1632', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '36.46.177.94', '2016-06-16 08:57:13');
INSERT INTO `allwww_log` VALUES ('1633', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.177.94', '2016-06-16 08:57:26');
INSERT INTO `allwww_log` VALUES ('1634', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '101.226.227.141', '2016-06-16 08:57:26');
INSERT INTO `allwww_log` VALUES ('1635', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '180.153.206.17', '2016-06-16 08:57:26');
INSERT INTO `allwww_log` VALUES ('1636', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '36.46.177.94', '2016-06-16 08:57:36');
INSERT INTO `allwww_log` VALUES ('1637', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 08:59:43');
INSERT INTO `allwww_log` VALUES ('1638', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 08:59:59');
INSERT INTO `allwww_log` VALUES ('1639', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:01');
INSERT INTO `allwww_log` VALUES ('1640', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:04');
INSERT INTO `allwww_log` VALUES ('1641', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:04');
INSERT INTO `allwww_log` VALUES ('1642', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:07');
INSERT INTO `allwww_log` VALUES ('1643', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:22');
INSERT INTO `allwww_log` VALUES ('1644', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:25');
INSERT INTO `allwww_log` VALUES ('1645', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:00:31');
INSERT INTO `allwww_log` VALUES ('1646', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:01:26');
INSERT INTO `allwww_log` VALUES ('1647', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:01:29');
INSERT INTO `allwww_log` VALUES ('1648', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:01:30');
INSERT INTO `allwww_log` VALUES ('1649', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:01:53');
INSERT INTO `allwww_log` VALUES ('1650', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:01:55');
INSERT INTO `allwww_log` VALUES ('1651', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:07:34');
INSERT INTO `allwww_log` VALUES ('1652', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:07:47');
INSERT INTO `allwww_log` VALUES ('1653', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:08:18');
INSERT INTO `allwww_log` VALUES ('1654', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:13:48');
INSERT INTO `allwww_log` VALUES ('1655', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '36.46.177.94', '2016-06-16 09:13:52');
INSERT INTO `allwww_log` VALUES ('1656', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:26');
INSERT INTO `allwww_log` VALUES ('1657', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:33');
INSERT INTO `allwww_log` VALUES ('1658', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:34');
INSERT INTO `allwww_log` VALUES ('1659', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:34');
INSERT INTO `allwww_log` VALUES ('1660', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:37');
INSERT INTO `allwww_log` VALUES ('1661', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 09:43:55');
INSERT INTO `allwww_log` VALUES ('1662', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:45:18');
INSERT INTO `allwww_log` VALUES ('1663', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:45:30');
INSERT INTO `allwww_log` VALUES ('1664', '', '0', 'attachment', '', 'address', '?m=attachment&c=address&a=update', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:29');
INSERT INTO `allwww_log` VALUES ('1665', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:36');
INSERT INTO `allwww_log` VALUES ('1666', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:38');
INSERT INTO `allwww_log` VALUES ('1667', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:39');
INSERT INTO `allwww_log` VALUES ('1668', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:39');
INSERT INTO `allwww_log` VALUES ('1669', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:40');
INSERT INTO `allwww_log` VALUES ('1670', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:46:41');
INSERT INTO `allwww_log` VALUES ('1671', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-16 09:50:27');
INSERT INTO `allwww_log` VALUES ('1672', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-16 10:55:58');
INSERT INTO `allwww_log` VALUES ('1673', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-16 10:58:51');
INSERT INTO `allwww_log` VALUES ('1674', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-16 10:58:53');
INSERT INTO `allwww_log` VALUES ('1675', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-16 11:02:06');
INSERT INTO `allwww_log` VALUES ('1676', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-16 11:02:17');
INSERT INTO `allwww_log` VALUES ('1677', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2016-06-16 11:02:30');
INSERT INTO `allwww_log` VALUES ('1678', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 11:03:25');
INSERT INTO `allwww_log` VALUES ('1679', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 11:03:39');
INSERT INTO `allwww_log` VALUES ('1680', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:03:59');
INSERT INTO `allwww_log` VALUES ('1681', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=del', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:02');
INSERT INTO `allwww_log` VALUES ('1682', '', '0', 'poster', '', 'poster', '?m=poster&c=poster&a=add', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:12');
INSERT INTO `allwww_log` VALUES ('1683', '', '0', 'poster', '', 'space', '?m=poster&c=space&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:25');
INSERT INTO `allwww_log` VALUES ('1684', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=field_save', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:37');
INSERT INTO `allwww_log` VALUES ('1685', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:52');
INSERT INTO `allwww_log` VALUES ('1686', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:04:58');
INSERT INTO `allwww_log` VALUES ('1687', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:05:04');
INSERT INTO `allwww_log` VALUES ('1688', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:05:50');
INSERT INTO `allwww_log` VALUES ('1689', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:05:53');
INSERT INTO `allwww_log` VALUES ('1690', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:05:58');
INSERT INTO `allwww_log` VALUES ('1691', '', '0', 'admin', '', 'position', '?m=admin&c=position&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:06:08');
INSERT INTO `allwww_log` VALUES ('1692', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:06:21');
INSERT INTO `allwww_log` VALUES ('1693', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:06:29');
INSERT INTO `allwww_log` VALUES ('1694', '', '0', 'link', '', 'link', '?m=link&c=link&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:06:36');
INSERT INTO `allwww_log` VALUES ('1695', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:20:25');
INSERT INTO `allwww_log` VALUES ('1696', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:20:27');
INSERT INTO `allwww_log` VALUES ('1697', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:26:19');
INSERT INTO `allwww_log` VALUES ('1698', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:26:23');
INSERT INTO `allwww_log` VALUES ('1699', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:26:28');
INSERT INTO `allwww_log` VALUES ('1700', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=delete', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:26:33');
INSERT INTO `allwww_log` VALUES ('1701', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=import', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:26:34');
INSERT INTO `allwww_log` VALUES ('1702', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:29:13');
INSERT INTO `allwww_log` VALUES ('1703', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:41:39');
INSERT INTO `allwww_log` VALUES ('1704', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:59:38');
INSERT INTO `allwww_log` VALUES ('1705', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:59:41');
INSERT INTO `allwww_log` VALUES ('1706', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 11:59:42');
INSERT INTO `allwww_log` VALUES ('1707', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:00:10');
INSERT INTO `allwww_log` VALUES ('1708', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:00:14');
INSERT INTO `allwww_log` VALUES ('1709', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:12:14');
INSERT INTO `allwww_log` VALUES ('1710', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:12:16');
INSERT INTO `allwww_log` VALUES ('1711', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:12:22');
INSERT INTO `allwww_log` VALUES ('1712', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 12:12:24');
INSERT INTO `allwww_log` VALUES ('1713', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:02:30');
INSERT INTO `allwww_log` VALUES ('1714', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:03:49');
INSERT INTO `allwww_log` VALUES ('1715', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:03:51');
INSERT INTO `allwww_log` VALUES ('1716', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:03:53');
INSERT INTO `allwww_log` VALUES ('1717', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:03:54');
INSERT INTO `allwww_log` VALUES ('1718', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:04:43');
INSERT INTO `allwww_log` VALUES ('1719', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:04:51');
INSERT INTO `allwww_log` VALUES ('1720', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:04:56');
INSERT INTO `allwww_log` VALUES ('1721', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:04:56');
INSERT INTO `allwww_log` VALUES ('1722', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=disable', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:02');
INSERT INTO `allwww_log` VALUES ('1723', '', '0', 'member', '', 'member_modelfield', '?m=member&c=member_modelfield&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:05');
INSERT INTO `allwww_log` VALUES ('1724', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:06');
INSERT INTO `allwww_log` VALUES ('1725', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:13');
INSERT INTO `allwww_log` VALUES ('1726', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:29');
INSERT INTO `allwww_log` VALUES ('1727', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:05:31');
INSERT INTO `allwww_log` VALUES ('1728', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:07:36');
INSERT INTO `allwww_log` VALUES ('1729', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:10:16');
INSERT INTO `allwww_log` VALUES ('1730', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:12:56');
INSERT INTO `allwww_log` VALUES ('1731', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:14:45');
INSERT INTO `allwww_log` VALUES ('1732', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:14:47');
INSERT INTO `allwww_log` VALUES ('1733', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:14:50');
INSERT INTO `allwww_log` VALUES ('1734', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:15:36');
INSERT INTO `allwww_log` VALUES ('1735', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:18:16');
INSERT INTO `allwww_log` VALUES ('1736', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:20:56');
INSERT INTO `allwww_log` VALUES ('1737', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:23:36');
INSERT INTO `allwww_log` VALUES ('1738', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:26:16');
INSERT INTO `allwww_log` VALUES ('1739', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:28:56');
INSERT INTO `allwww_log` VALUES ('1740', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:31:36');
INSERT INTO `allwww_log` VALUES ('1741', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:34:16');
INSERT INTO `allwww_log` VALUES ('1742', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:36:56');
INSERT INTO `allwww_log` VALUES ('1743', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:38:41');
INSERT INTO `allwww_log` VALUES ('1744', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:38:43');
INSERT INTO `allwww_log` VALUES ('1745', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:39:36');
INSERT INTO `allwww_log` VALUES ('1746', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:40:04');
INSERT INTO `allwww_log` VALUES ('1747', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:40:07');
INSERT INTO `allwww_log` VALUES ('1748', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:40:10');
INSERT INTO `allwww_log` VALUES ('1749', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:40:16');
INSERT INTO `allwww_log` VALUES ('1750', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 13:40:26');
INSERT INTO `allwww_log` VALUES ('1751', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:42:16');
INSERT INTO `allwww_log` VALUES ('1752', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:44:56');
INSERT INTO `allwww_log` VALUES ('1753', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:47:36');
INSERT INTO `allwww_log` VALUES ('1754', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:50:16');
INSERT INTO `allwww_log` VALUES ('1755', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:52:56');
INSERT INTO `allwww_log` VALUES ('1756', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:55:36');
INSERT INTO `allwww_log` VALUES ('1757', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 13:58:16');
INSERT INTO `allwww_log` VALUES ('1758', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:00:18');
INSERT INTO `allwww_log` VALUES ('1759', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:00:21');
INSERT INTO `allwww_log` VALUES ('1760', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:00:29');
INSERT INTO `allwww_log` VALUES ('1761', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:00:34');
INSERT INTO `allwww_log` VALUES ('1762', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:00:56');
INSERT INTO `allwww_log` VALUES ('1763', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:01:12');
INSERT INTO `allwww_log` VALUES ('1764', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:01:14');
INSERT INTO `allwww_log` VALUES ('1765', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:03:36');
INSERT INTO `allwww_log` VALUES ('1766', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:06:16');
INSERT INTO `allwww_log` VALUES ('1767', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:08:56');
INSERT INTO `allwww_log` VALUES ('1768', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:11:36');
INSERT INTO `allwww_log` VALUES ('1769', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:14:16');
INSERT INTO `allwww_log` VALUES ('1770', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:16:56');
INSERT INTO `allwww_log` VALUES ('1771', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:19:36');
INSERT INTO `allwww_log` VALUES ('1772', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:22:16');
INSERT INTO `allwww_log` VALUES ('1773', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:23:48');
INSERT INTO `allwww_log` VALUES ('1774', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:24:04');
INSERT INTO `allwww_log` VALUES ('1775', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:24:45');
INSERT INTO `allwww_log` VALUES ('1776', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:24:49');
INSERT INTO `allwww_log` VALUES ('1777', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:24:52');
INSERT INTO `allwww_log` VALUES ('1778', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:24:56');
INSERT INTO `allwww_log` VALUES ('1779', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:27:36');
INSERT INTO `allwww_log` VALUES ('1780', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:27:40');
INSERT INTO `allwww_log` VALUES ('1781', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:27:57');
INSERT INTO `allwww_log` VALUES ('1782', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:28:23');
INSERT INTO `allwww_log` VALUES ('1783', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:28:28');
INSERT INTO `allwww_log` VALUES ('1784', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:29:36');
INSERT INTO `allwww_log` VALUES ('1785', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:29:54');
INSERT INTO `allwww_log` VALUES ('1786', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:30:16');
INSERT INTO `allwww_log` VALUES ('1787', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:30:22');
INSERT INTO `allwww_log` VALUES ('1788', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:30:27');
INSERT INTO `allwww_log` VALUES ('1789', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:30:30');
INSERT INTO `allwww_log` VALUES ('1790', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:31:28');
INSERT INTO `allwww_log` VALUES ('1791', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:31:36');
INSERT INTO `allwww_log` VALUES ('1792', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:32:56');
INSERT INTO `allwww_log` VALUES ('1793', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:34:01');
INSERT INTO `allwww_log` VALUES ('1794', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:34:19');
INSERT INTO `allwww_log` VALUES ('1795', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:34:25');
INSERT INTO `allwww_log` VALUES ('1796', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:35:36');
INSERT INTO `allwww_log` VALUES ('1797', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:36:04');
INSERT INTO `allwww_log` VALUES ('1798', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:36:12');
INSERT INTO `allwww_log` VALUES ('1799', '', '0', 'member', '', 'member_setting', '?m=member&c=member_setting&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:36:19');
INSERT INTO `allwww_log` VALUES ('1800', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:36:25');
INSERT INTO `allwww_log` VALUES ('1801', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:38:16');
INSERT INTO `allwww_log` VALUES ('1802', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:39:56');
INSERT INTO `allwww_log` VALUES ('1803', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:40:02');
INSERT INTO `allwww_log` VALUES ('1804', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:40:32');
INSERT INTO `allwww_log` VALUES ('1805', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-16 14:40:37');
INSERT INTO `allwww_log` VALUES ('1806', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:40:56');
INSERT INTO `allwww_log` VALUES ('1807', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:43:36');
INSERT INTO `allwww_log` VALUES ('1808', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:46:16');
INSERT INTO `allwww_log` VALUES ('1809', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:48:56');
INSERT INTO `allwww_log` VALUES ('1810', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:51:36');
INSERT INTO `allwww_log` VALUES ('1811', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:51:45');
INSERT INTO `allwww_log` VALUES ('1812', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-16 14:51:57');
INSERT INTO `allwww_log` VALUES ('1813', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 09:16:51');
INSERT INTO `allwww_log` VALUES ('1814', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 09:17:01');
INSERT INTO `allwww_log` VALUES ('1815', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:10');
INSERT INTO `allwww_log` VALUES ('1816', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:15');
INSERT INTO `allwww_log` VALUES ('1817', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:20');
INSERT INTO `allwww_log` VALUES ('1818', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:31');
INSERT INTO `allwww_log` VALUES ('1819', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=disabled', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:41');
INSERT INTO `allwww_log` VALUES ('1820', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=disabled', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:45');
INSERT INTO `allwww_log` VALUES ('1821', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:17:55');
INSERT INTO `allwww_log` VALUES ('1822', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:02');
INSERT INTO `allwww_log` VALUES ('1823', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:11');
INSERT INTO `allwww_log` VALUES ('1824', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:18');
INSERT INTO `allwww_log` VALUES ('1825', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:28');
INSERT INTO `allwww_log` VALUES ('1826', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:35');
INSERT INTO `allwww_log` VALUES ('1827', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:41');
INSERT INTO `allwww_log` VALUES ('1828', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 09:18:48');
INSERT INTO `allwww_log` VALUES ('1829', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:42:22');
INSERT INTO `allwww_log` VALUES ('1830', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:42:22');
INSERT INTO `allwww_log` VALUES ('1831', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:42:46');
INSERT INTO `allwww_log` VALUES ('1832', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:42:57');
INSERT INTO `allwww_log` VALUES ('1833', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 13:44:30');
INSERT INTO `allwww_log` VALUES ('1834', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 13:44:41');
INSERT INTO `allwww_log` VALUES ('1835', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 13:44:55');
INSERT INTO `allwww_log` VALUES ('1836', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 13:45:01');
INSERT INTO `allwww_log` VALUES ('1837', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:45:01');
INSERT INTO `allwww_log` VALUES ('1838', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 13:45:18');
INSERT INTO `allwww_log` VALUES ('1839', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:47:41');
INSERT INTO `allwww_log` VALUES ('1840', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:50:21');
INSERT INTO `allwww_log` VALUES ('1841', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:53:01');
INSERT INTO `allwww_log` VALUES ('1842', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:55:41');
INSERT INTO `allwww_log` VALUES ('1843', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 13:58:21');
INSERT INTO `allwww_log` VALUES ('1844', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:01:01');
INSERT INTO `allwww_log` VALUES ('1845', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:03:41');
INSERT INTO `allwww_log` VALUES ('1846', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:06:21');
INSERT INTO `allwww_log` VALUES ('1847', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:09:01');
INSERT INTO `allwww_log` VALUES ('1848', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:11:41');
INSERT INTO `allwww_log` VALUES ('1849', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:14:21');
INSERT INTO `allwww_log` VALUES ('1850', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:15:01');
INSERT INTO `allwww_log` VALUES ('1851', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:17:01');
INSERT INTO `allwww_log` VALUES ('1852', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:18:28');
INSERT INTO `allwww_log` VALUES ('1853', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:18:46');
INSERT INTO `allwww_log` VALUES ('1854', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:19:41');
INSERT INTO `allwww_log` VALUES ('1855', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:19:57');
INSERT INTO `allwww_log` VALUES ('1856', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:20:31');
INSERT INTO `allwww_log` VALUES ('1857', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:22:08');
INSERT INTO `allwww_log` VALUES ('1858', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:22:21');
INSERT INTO `allwww_log` VALUES ('1859', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:22:22');
INSERT INTO `allwww_log` VALUES ('1860', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:22:40');
INSERT INTO `allwww_log` VALUES ('1861', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:22:52');
INSERT INTO `allwww_log` VALUES ('1862', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:23:32');
INSERT INTO `allwww_log` VALUES ('1863', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:24:03');
INSERT INTO `allwww_log` VALUES ('1864', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:25:02');
INSERT INTO `allwww_log` VALUES ('1865', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:25:08');
INSERT INTO `allwww_log` VALUES ('1866', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:25:28');
INSERT INTO `allwww_log` VALUES ('1867', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:25:41');
INSERT INTO `allwww_log` VALUES ('1868', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:26:06');
INSERT INTO `allwww_log` VALUES ('1869', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:26:22');
INSERT INTO `allwww_log` VALUES ('1870', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:26:41');
INSERT INTO `allwww_log` VALUES ('1871', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:27:08');
INSERT INTO `allwww_log` VALUES ('1872', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:27:42');
INSERT INTO `allwww_log` VALUES ('1873', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:27:47');
INSERT INTO `allwww_log` VALUES ('1874', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:28:39');
INSERT INTO `allwww_log` VALUES ('1875', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:29:02');
INSERT INTO `allwww_log` VALUES ('1876', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:30:04');
INSERT INTO `allwww_log` VALUES ('1877', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:30:22');
INSERT INTO `allwww_log` VALUES ('1878', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:30:30');
INSERT INTO `allwww_log` VALUES ('1879', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:31:03');
INSERT INTO `allwww_log` VALUES ('1880', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:31:21');
INSERT INTO `allwww_log` VALUES ('1881', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:33:02');
INSERT INTO `allwww_log` VALUES ('1882', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-06-24 14:35:42');
INSERT INTO `allwww_log` VALUES ('1883', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:37:17');
INSERT INTO `allwww_log` VALUES ('1884', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=edit', '', '1', 'admin', '127.0.0.1', '2016-06-24 14:37:22');
INSERT INTO `allwww_log` VALUES ('1885', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-08-31 09:55:36');
INSERT INTO `allwww_log` VALUES ('1886', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-08-31 09:55:45');
INSERT INTO `allwww_log` VALUES ('1887', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-08-31 09:55:47');
INSERT INTO `allwww_log` VALUES ('1888', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-08-31 09:55:52');
INSERT INTO `allwww_log` VALUES ('1889', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-08-31 09:56:04');
INSERT INTO `allwww_log` VALUES ('1890', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-08-31 09:56:12');
INSERT INTO `allwww_log` VALUES ('1891', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-09-19 09:13:17');
INSERT INTO `allwww_log` VALUES ('1892', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-09-19 09:13:31');
INSERT INTO `allwww_log` VALUES ('1893', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:14:22');
INSERT INTO `allwww_log` VALUES ('1894', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:14:59');
INSERT INTO `allwww_log` VALUES ('1895', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:15:02');
INSERT INTO `allwww_log` VALUES ('1896', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:15:03');
INSERT INTO `allwww_log` VALUES ('1897', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:35');
INSERT INTO `allwww_log` VALUES ('1898', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:37');
INSERT INTO `allwww_log` VALUES ('1899', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:45');
INSERT INTO `allwww_log` VALUES ('1900', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:46');
INSERT INTO `allwww_log` VALUES ('1901', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:46');
INSERT INTO `allwww_log` VALUES ('1902', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:47');
INSERT INTO `allwww_log` VALUES ('1903', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:49');
INSERT INTO `allwww_log` VALUES ('1904', '', '0', 'member', '', 'member_model', '?m=member&c=member_model&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:50');
INSERT INTO `allwww_log` VALUES ('1905', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:16:52');
INSERT INTO `allwww_log` VALUES ('1906', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:17:03');
INSERT INTO `allwww_log` VALUES ('1907', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:41:42');
INSERT INTO `allwww_log` VALUES ('1908', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:41:46');
INSERT INTO `allwww_log` VALUES ('1909', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:42:34');
INSERT INTO `allwww_log` VALUES ('1910', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:42:35');
INSERT INTO `allwww_log` VALUES ('1911', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:42:53');
INSERT INTO `allwww_log` VALUES ('1912', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:42:56');
INSERT INTO `allwww_log` VALUES ('1913', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:42:57');
INSERT INTO `allwww_log` VALUES ('1914', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:44:00');
INSERT INTO `allwww_log` VALUES ('1915', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:44:13');
INSERT INTO `allwww_log` VALUES ('1916', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-09-19 09:56:17');
INSERT INTO `allwww_log` VALUES ('1917', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 10:09:27');
INSERT INTO `allwww_log` VALUES ('1918', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '127.0.0.1', '2016-09-19 10:09:43');
INSERT INTO `allwww_log` VALUES ('1919', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-09-19 10:09:44');
INSERT INTO `allwww_log` VALUES ('1920', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '127.0.0.1', '2016-09-19 10:39:57');
INSERT INTO `allwww_log` VALUES ('1921', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:11:47');
INSERT INTO `allwww_log` VALUES ('1922', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:11:54');
INSERT INTO `allwww_log` VALUES ('1923', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:11:58');
INSERT INTO `allwww_log` VALUES ('1924', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:10');
INSERT INTO `allwww_log` VALUES ('1925', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:27');
INSERT INTO `allwww_log` VALUES ('1926', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:29');
INSERT INTO `allwww_log` VALUES ('1927', '', '0', 'mobile', '', 'mobile', '?m=mobile&c=mobile&a=cate_manage', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:41');
INSERT INTO `allwww_log` VALUES ('1928', '', '0', 'mobile', '', 'mobile', '?m=mobile&c=mobile&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:50');
INSERT INTO `allwww_log` VALUES ('1929', '', '0', 'mobile', '', 'mobile', '?m=mobile&c=mobile&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:15:59');
INSERT INTO `allwww_log` VALUES ('1930', '', '0', 'mobile', '', 'mobile', '?m=mobile&c=mobile&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:19:34');
INSERT INTO `allwww_log` VALUES ('1931', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:40:39');
INSERT INTO `allwww_log` VALUES ('1932', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:40:43');
INSERT INTO `allwww_log` VALUES ('1933', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:40:48');
INSERT INTO `allwww_log` VALUES ('1934', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:41:03');
INSERT INTO `allwww_log` VALUES ('1935', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:41:07');
INSERT INTO `allwww_log` VALUES ('1936', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:41:55');
INSERT INTO `allwww_log` VALUES ('1937', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-09-19 11:41:58');
INSERT INTO `allwww_log` VALUES ('1938', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 14:56:22');
INSERT INTO `allwww_log` VALUES ('1939', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 14:56:31');
INSERT INTO `allwww_log` VALUES ('1940', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 14:57:48');
INSERT INTO `allwww_log` VALUES ('1941', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:35');
INSERT INTO `allwww_log` VALUES ('1942', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:38');
INSERT INTO `allwww_log` VALUES ('1943', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:41');
INSERT INTO `allwww_log` VALUES ('1944', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:45');
INSERT INTO `allwww_log` VALUES ('1945', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:47');
INSERT INTO `allwww_log` VALUES ('1946', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:51');
INSERT INTO `allwww_log` VALUES ('1947', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:03:55');
INSERT INTO `allwww_log` VALUES ('1948', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:04:00');
INSERT INTO `allwww_log` VALUES ('1949', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:04:04');
INSERT INTO `allwww_log` VALUES ('1950', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:04:17');
INSERT INTO `allwww_log` VALUES ('1951', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:04:20');
INSERT INTO `allwww_log` VALUES ('1952', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 15:04:30');
INSERT INTO `allwww_log` VALUES ('1953', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 16:31:43');
INSERT INTO `allwww_log` VALUES ('1954', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-07 16:31:48');
INSERT INTO `allwww_log` VALUES ('1955', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:32:00');
INSERT INTO `allwww_log` VALUES ('1956', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:32:05');
INSERT INTO `allwww_log` VALUES ('1957', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:33:33');
INSERT INTO `allwww_log` VALUES ('1958', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:33:47');
INSERT INTO `allwww_log` VALUES ('1959', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:33:51');
INSERT INTO `allwww_log` VALUES ('1960', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:44:59');
INSERT INTO `allwww_log` VALUES ('1961', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:45:03');
INSERT INTO `allwww_log` VALUES ('1962', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:46:04');
INSERT INTO `allwww_log` VALUES ('1963', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:46:07');
INSERT INTO `allwww_log` VALUES ('1964', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:46:11');
INSERT INTO `allwww_log` VALUES ('1965', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:48:44');
INSERT INTO `allwww_log` VALUES ('1966', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:49:01');
INSERT INTO `allwww_log` VALUES ('1967', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_save', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:49:07');
INSERT INTO `allwww_log` VALUES ('1968', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:49:08');
INSERT INTO `allwww_log` VALUES ('1969', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:55:53');
INSERT INTO `allwww_log` VALUES ('1970', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:56:05');
INSERT INTO `allwww_log` VALUES ('1971', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=type_manage', '', '1', 'admin', '127.0.0.1', '2016-11-07 16:56:34');
INSERT INTO `allwww_log` VALUES ('1972', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-07 17:09:17');
INSERT INTO `allwww_log` VALUES ('1973', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=edit', '', '1', 'admin', '127.0.0.1', '2016-11-07 17:24:29');
INSERT INTO `allwww_log` VALUES ('1974', '', '0', 'wap', '', 'wap_admin', '?m=wap&c=wap_admin&a=edit', '', '1', 'admin', '127.0.0.1', '2016-11-07 17:24:38');
INSERT INTO `allwww_log` VALUES ('1975', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2016-11-07 17:25:03');
INSERT INTO `allwww_log` VALUES ('1976', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-25 08:49:21');
INSERT INTO `allwww_log` VALUES ('1977', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-11-25 08:49:26');
INSERT INTO `allwww_log` VALUES ('1978', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:50:10');
INSERT INTO `allwww_log` VALUES ('1979', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:50:34');
INSERT INTO `allwww_log` VALUES ('1980', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:53:00');
INSERT INTO `allwww_log` VALUES ('1981', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:53:16');
INSERT INTO `allwww_log` VALUES ('1982', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:54:47');
INSERT INTO `allwww_log` VALUES ('1983', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2016-11-25 08:56:08');
INSERT INTO `allwww_log` VALUES ('1984', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-12-05 16:03:11');
INSERT INTO `allwww_log` VALUES ('1985', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-12-05 16:03:16');
INSERT INTO `allwww_log` VALUES ('1986', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:04:14');
INSERT INTO `allwww_log` VALUES ('1987', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:04:22');
INSERT INTO `allwww_log` VALUES ('1988', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:04:43');
INSERT INTO `allwww_log` VALUES ('1989', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:00');
INSERT INTO `allwww_log` VALUES ('1990', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:02');
INSERT INTO `allwww_log` VALUES ('1991', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:03');
INSERT INTO `allwww_log` VALUES ('1992', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:05');
INSERT INTO `allwww_log` VALUES ('1993', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:14');
INSERT INTO `allwww_log` VALUES ('1994', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:20');
INSERT INTO `allwww_log` VALUES ('1995', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:21');
INSERT INTO `allwww_log` VALUES ('1996', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:05:23');
INSERT INTO `allwww_log` VALUES ('1997', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=listorder', '', '1', 'admin', '127.0.0.1', '2016-12-05 16:08:23');
INSERT INTO `allwww_log` VALUES ('1998', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-12-15 08:54:49');
INSERT INTO `allwww_log` VALUES ('1999', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2016-12-15 08:55:12');
INSERT INTO `allwww_log` VALUES ('2000', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-12-15 08:55:20');
INSERT INTO `allwww_log` VALUES ('2001', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 08:57:50');
INSERT INTO `allwww_log` VALUES ('2002', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 08:59:07');
INSERT INTO `allwww_log` VALUES ('2003', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 08:59:28');
INSERT INTO `allwww_log` VALUES ('2004', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_save', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:28');
INSERT INTO `allwww_log` VALUES ('2005', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:29');
INSERT INTO `allwww_log` VALUES ('2006', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_save', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:33');
INSERT INTO `allwww_log` VALUES ('2007', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:34');
INSERT INTO `allwww_log` VALUES ('2008', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:38');
INSERT INTO `allwww_log` VALUES ('2009', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:46');
INSERT INTO `allwww_log` VALUES ('2010', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:00:50');
INSERT INTO `allwww_log` VALUES ('2011', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:03:32');
INSERT INTO `allwww_log` VALUES ('2012', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:03:34');
INSERT INTO `allwww_log` VALUES ('2013', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_save', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:04:28');
INSERT INTO `allwww_log` VALUES ('2014', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:04:29');
INSERT INTO `allwww_log` VALUES ('2015', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_save', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:04:33');
INSERT INTO `allwww_log` VALUES ('2016', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=category_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:04:35');
INSERT INTO `allwww_log` VALUES ('2017', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:04:39');
INSERT INTO `allwww_log` VALUES ('2018', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:05:59');
INSERT INTO `allwww_log` VALUES ('2019', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:06:06');
INSERT INTO `allwww_log` VALUES ('2020', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:49:18');
INSERT INTO `allwww_log` VALUES ('2021', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2016-12-15 09:49:26');
INSERT INTO `allwww_log` VALUES ('2022', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-01-06 09:38:57');
INSERT INTO `allwww_log` VALUES ('2023', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-01-06 09:39:01');
INSERT INTO `allwww_log` VALUES ('2024', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-01-06 09:39:45');
INSERT INTO `allwww_log` VALUES ('2025', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-24 08:44:01');
INSERT INTO `allwww_log` VALUES ('2026', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-24 08:44:07');
INSERT INTO `allwww_log` VALUES ('2027', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:44:22');
INSERT INTO `allwww_log` VALUES ('2028', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:44:45');
INSERT INTO `allwww_log` VALUES ('2029', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:54:21');
INSERT INTO `allwww_log` VALUES ('2030', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:54:59');
INSERT INTO `allwww_log` VALUES ('2031', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:55:54');
INSERT INTO `allwww_log` VALUES ('2032', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 08:58:18');
INSERT INTO `allwww_log` VALUES ('2033', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:03:23');
INSERT INTO `allwww_log` VALUES ('2034', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:03:32');
INSERT INTO `allwww_log` VALUES ('2035', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:03:34');
INSERT INTO `allwww_log` VALUES ('2036', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:05:42');
INSERT INTO `allwww_log` VALUES ('2037', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:05:43');
INSERT INTO `allwww_log` VALUES ('2038', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:05:48');
INSERT INTO `allwww_log` VALUES ('2039', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:07:28');
INSERT INTO `allwww_log` VALUES ('2040', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:08:18');
INSERT INTO `allwww_log` VALUES ('2041', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:09:20');
INSERT INTO `allwww_log` VALUES ('2042', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:55:01');
INSERT INTO `allwww_log` VALUES ('2043', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:55:07');
INSERT INTO `allwww_log` VALUES ('2044', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 09:55:10');
INSERT INTO `allwww_log` VALUES ('2045', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:05:08');
INSERT INTO `allwww_log` VALUES ('2046', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:05:14');
INSERT INTO `allwww_log` VALUES ('2047', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:05:17');
INSERT INTO `allwww_log` VALUES ('2048', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:08:47');
INSERT INTO `allwww_log` VALUES ('2049', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:09:16');
INSERT INTO `allwww_log` VALUES ('2050', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:09:31');
INSERT INTO `allwww_log` VALUES ('2051', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:09:41');
INSERT INTO `allwww_log` VALUES ('2052', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:09:59');
INSERT INTO `allwww_log` VALUES ('2053', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:10:10');
INSERT INTO `allwww_log` VALUES ('2054', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:11:00');
INSERT INTO `allwww_log` VALUES ('2055', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:11:04');
INSERT INTO `allwww_log` VALUES ('2056', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:12:51');
INSERT INTO `allwww_log` VALUES ('2057', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:12:55');
INSERT INTO `allwww_log` VALUES ('2058', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:13:48');
INSERT INTO `allwww_log` VALUES ('2059', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:14:55');
INSERT INTO `allwww_log` VALUES ('2060', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:15:03');
INSERT INTO `allwww_log` VALUES ('2061', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:27:44');
INSERT INTO `allwww_log` VALUES ('2062', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:27:49');
INSERT INTO `allwww_log` VALUES ('2063', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:28:02');
INSERT INTO `allwww_log` VALUES ('2064', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:28:11');
INSERT INTO `allwww_log` VALUES ('2065', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:28:26');
INSERT INTO `allwww_log` VALUES ('2066', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:28:35');
INSERT INTO `allwww_log` VALUES ('2067', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:31:19');
INSERT INTO `allwww_log` VALUES ('2068', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:31:23');
INSERT INTO `allwww_log` VALUES ('2069', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 10:31:36');
INSERT INTO `allwww_log` VALUES ('2070', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:13:17');
INSERT INTO `allwww_log` VALUES ('2071', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:13:30');
INSERT INTO `allwww_log` VALUES ('2072', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:13:45');
INSERT INTO `allwww_log` VALUES ('2073', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:13:59');
INSERT INTO `allwww_log` VALUES ('2074', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:30:51');
INSERT INTO `allwww_log` VALUES ('2075', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 13:51:09');
INSERT INTO `allwww_log` VALUES ('2076', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 14:00:46');
INSERT INTO `allwww_log` VALUES ('2077', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 14:00:56');
INSERT INTO `allwww_log` VALUES ('2078', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 14:01:17');
INSERT INTO `allwww_log` VALUES ('2079', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-24 14:01:58');
INSERT INTO `allwww_log` VALUES ('2080', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-28 14:02:12');
INSERT INTO `allwww_log` VALUES ('2081', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-03-28 14:02:25');
INSERT INTO `allwww_log` VALUES ('2082', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:02:49');
INSERT INTO `allwww_log` VALUES ('2083', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:06:47');
INSERT INTO `allwww_log` VALUES ('2084', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:08:33');
INSERT INTO `allwww_log` VALUES ('2085', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:08:43');
INSERT INTO `allwww_log` VALUES ('2086', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:10:47');
INSERT INTO `allwww_log` VALUES ('2087', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:16:11');
INSERT INTO `allwww_log` VALUES ('2088', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:16:16');
INSERT INTO `allwww_log` VALUES ('2089', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:16:20');
INSERT INTO `allwww_log` VALUES ('2090', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:17:00');
INSERT INTO `allwww_log` VALUES ('2091', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:17:03');
INSERT INTO `allwww_log` VALUES ('2092', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-03-28 14:37:22');
INSERT INTO `allwww_log` VALUES ('2093', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:40:25');
INSERT INTO `allwww_log` VALUES ('2094', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:40:36');
INSERT INTO `allwww_log` VALUES ('2095', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:40:38');
INSERT INTO `allwww_log` VALUES ('2096', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:40:46');
INSERT INTO `allwww_log` VALUES ('2097', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:40:52');
INSERT INTO `allwww_log` VALUES ('2098', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:04');
INSERT INTO `allwww_log` VALUES ('2099', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:07');
INSERT INTO `allwww_log` VALUES ('2100', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:14');
INSERT INTO `allwww_log` VALUES ('2101', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:17');
INSERT INTO `allwww_log` VALUES ('2102', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:43');
INSERT INTO `allwww_log` VALUES ('2103', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:48');
INSERT INTO `allwww_log` VALUES ('2104', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:51');
INSERT INTO `allwww_log` VALUES ('2105', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:44:53');
INSERT INTO `allwww_log` VALUES ('2106', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:46:07');
INSERT INTO `allwww_log` VALUES ('2107', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:46:10');
INSERT INTO `allwww_log` VALUES ('2108', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:47:19');
INSERT INTO `allwww_log` VALUES ('2109', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:47:21');
INSERT INTO `allwww_log` VALUES ('2110', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:09');
INSERT INTO `allwww_log` VALUES ('2111', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:14');
INSERT INTO `allwww_log` VALUES ('2112', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:23');
INSERT INTO `allwww_log` VALUES ('2113', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:27');
INSERT INTO `allwww_log` VALUES ('2114', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:36');
INSERT INTO `allwww_log` VALUES ('2115', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:41');
INSERT INTO `allwww_log` VALUES ('2116', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:49');
INSERT INTO `allwww_log` VALUES ('2117', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:48:55');
INSERT INTO `allwww_log` VALUES ('2118', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:49:00');
INSERT INTO `allwww_log` VALUES ('2119', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:49:07');
INSERT INTO `allwww_log` VALUES ('2120', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:49:12');
INSERT INTO `allwww_log` VALUES ('2121', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-03-28 14:49:18');
INSERT INTO `allwww_log` VALUES ('2122', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-05-18 16:01:49');
INSERT INTO `allwww_log` VALUES ('2123', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-05-18 16:02:04');
INSERT INTO `allwww_log` VALUES ('2124', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:06:08');
INSERT INTO `allwww_log` VALUES ('2125', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:06:10');
INSERT INTO `allwww_log` VALUES ('2126', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:06:13');
INSERT INTO `allwww_log` VALUES ('2127', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:16:19');
INSERT INTO `allwww_log` VALUES ('2128', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:16:21');
INSERT INTO `allwww_log` VALUES ('2129', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:16:56');
INSERT INTO `allwww_log` VALUES ('2130', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:16:57');
INSERT INTO `allwww_log` VALUES ('2131', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:17:42');
INSERT INTO `allwww_log` VALUES ('2132', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:17:43');
INSERT INTO `allwww_log` VALUES ('2133', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:18:21');
INSERT INTO `allwww_log` VALUES ('2134', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:18:23');
INSERT INTO `allwww_log` VALUES ('2135', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:19:00');
INSERT INTO `allwww_log` VALUES ('2136', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:19:02');
INSERT INTO `allwww_log` VALUES ('2137', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:20:37');
INSERT INTO `allwww_log` VALUES ('2138', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:20:38');
INSERT INTO `allwww_log` VALUES ('2139', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:21:41');
INSERT INTO `allwww_log` VALUES ('2140', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:21:43');
INSERT INTO `allwww_log` VALUES ('2141', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:22:53');
INSERT INTO `allwww_log` VALUES ('2142', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:23:26');
INSERT INTO `allwww_log` VALUES ('2143', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:23:28');
INSERT INTO `allwww_log` VALUES ('2144', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:24:04');
INSERT INTO `allwww_log` VALUES ('2145', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:26:53');
INSERT INTO `allwww_log` VALUES ('2146', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=add', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:27:13');
INSERT INTO `allwww_log` VALUES ('2147', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:28:47');
INSERT INTO `allwww_log` VALUES ('2148', '', '0', 'content', '', 'content', '?m=content&c=content&a=add', '', '1', 'admin', '127.0.0.1', '2017-05-18 16:28:57');
INSERT INTO `allwww_log` VALUES ('2149', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-19 09:54:17');
INSERT INTO `allwww_log` VALUES ('2150', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-19 09:54:24');
INSERT INTO `allwww_log` VALUES ('2151', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-19 14:46:41');
INSERT INTO `allwww_log` VALUES ('2152', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-19 14:46:43');
INSERT INTO `allwww_log` VALUES ('2153', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2017-05-19 14:47:24');
INSERT INTO `allwww_log` VALUES ('2154', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-05-19 15:57:24');
INSERT INTO `allwww_log` VALUES ('2155', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-05-19 15:57:34');
INSERT INTO `allwww_log` VALUES ('2156', '', '0', 'content', '', 'content', '?m=content&c=content&a=delete', '', '1', 'admin', '', '2017-05-19 21:29:03');
INSERT INTO `allwww_log` VALUES ('2157', '', '0', 'admin', '', 'category', '?m=admin&c=category&a=delete', '', '1', 'admin', '', '2017-05-19 21:29:12');
INSERT INTO `allwww_log` VALUES ('2158', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-22 08:52:58');
INSERT INTO `allwww_log` VALUES ('2159', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-22 08:53:20');
INSERT INTO `allwww_log` VALUES ('2160', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-22 08:53:22');
INSERT INTO `allwww_log` VALUES ('2161', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-22 08:53:33');
INSERT INTO `allwww_log` VALUES ('2162', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-05-22 08:59:07');
INSERT INTO `allwww_log` VALUES ('2163', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 10:44:59');
INSERT INTO `allwww_log` VALUES ('2164', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 10:47:39');
INSERT INTO `allwww_log` VALUES ('2165', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 10:50:19');
INSERT INTO `allwww_log` VALUES ('2166', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 10:52:29');
INSERT INTO `allwww_log` VALUES ('2167', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 10:52:48');
INSERT INTO `allwww_log` VALUES ('2168', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-05-24 10:53:11');
INSERT INTO `allwww_log` VALUES ('2169', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=disabled', '', '1', 'admin', '127.0.0.1', '2017-05-24 10:53:25');
INSERT INTO `allwww_log` VALUES ('2170', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-05-24 10:59:21');
INSERT INTO `allwww_log` VALUES ('2171', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-05-24 10:59:23');
INSERT INTO `allwww_log` VALUES ('2172', '', '0', 'customfield', '', 'customfield', '?m=customfield&c=customfield&a=manage_list', '', '1', 'admin', '127.0.0.1', '2017-05-24 11:00:14');
INSERT INTO `allwww_log` VALUES ('2173', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-05-24 12:01:36');
INSERT INTO `allwww_log` VALUES ('2174', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-06-01 09:35:42');
INSERT INTO `allwww_log` VALUES ('2175', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-06-01 09:35:48');
INSERT INTO `allwww_log` VALUES ('2176', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:11:22');
INSERT INTO `allwww_log` VALUES ('2177', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:19:45');
INSERT INTO `allwww_log` VALUES ('2178', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:22:43');
INSERT INTO `allwww_log` VALUES ('2179', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:23:07');
INSERT INTO `allwww_log` VALUES ('2180', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:23:34');
INSERT INTO `allwww_log` VALUES ('2181', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:24:26');
INSERT INTO `allwww_log` VALUES ('2182', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:24:56');
INSERT INTO `allwww_log` VALUES ('2183', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:28:11');
INSERT INTO `allwww_log` VALUES ('2184', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:28:34');
INSERT INTO `allwww_log` VALUES ('2185', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:28:35');
INSERT INTO `allwww_log` VALUES ('2186', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:29:13');
INSERT INTO `allwww_log` VALUES ('2187', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:29:15');
INSERT INTO `allwww_log` VALUES ('2188', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:29:18');
INSERT INTO `allwww_log` VALUES ('2189', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:34:02');
INSERT INTO `allwww_log` VALUES ('2190', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:37:50');
INSERT INTO `allwww_log` VALUES ('2191', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:38:08');
INSERT INTO `allwww_log` VALUES ('2192', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:38:55');
INSERT INTO `allwww_log` VALUES ('2193', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:40:32');
INSERT INTO `allwww_log` VALUES ('2194', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:40:34');
INSERT INTO `allwww_log` VALUES ('2195', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:40:47');
INSERT INTO `allwww_log` VALUES ('2196', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:40:48');
INSERT INTO `allwww_log` VALUES ('2197', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:40:52');
INSERT INTO `allwww_log` VALUES ('2198', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:41:24');
INSERT INTO `allwww_log` VALUES ('2199', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:41:29');
INSERT INTO `allwww_log` VALUES ('2200', '', '0', 'link', '', 'link', '?m=link&c=link&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:41:37');
INSERT INTO `allwww_log` VALUES ('2201', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:54:35');
INSERT INTO `allwww_log` VALUES ('2202', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:54:50');
INSERT INTO `allwww_log` VALUES ('2203', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:54:51');
INSERT INTO `allwww_log` VALUES ('2204', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:54:53');
INSERT INTO `allwww_log` VALUES ('2205', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:55:22');
INSERT INTO `allwww_log` VALUES ('2206', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:55:36');
INSERT INTO `allwww_log` VALUES ('2207', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 10:59:00');
INSERT INTO `allwww_log` VALUES ('2208', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:00:00');
INSERT INTO `allwww_log` VALUES ('2209', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:00:01');
INSERT INTO `allwww_log` VALUES ('2210', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:00:03');
INSERT INTO `allwww_log` VALUES ('2211', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:00:20');
INSERT INTO `allwww_log` VALUES ('2212', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:02:52');
INSERT INTO `allwww_log` VALUES ('2213', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:03:32');
INSERT INTO `allwww_log` VALUES ('2214', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:03:38');
INSERT INTO `allwww_log` VALUES ('2215', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:03:39');
INSERT INTO `allwww_log` VALUES ('2216', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:03:41');
INSERT INTO `allwww_log` VALUES ('2217', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:03:49');
INSERT INTO `allwww_log` VALUES ('2218', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:04:06');
INSERT INTO `allwww_log` VALUES ('2219', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:04:28');
INSERT INTO `allwww_log` VALUES ('2220', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:04:40');
INSERT INTO `allwww_log` VALUES ('2221', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:04:44');
INSERT INTO `allwww_log` VALUES ('2222', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:04:57');
INSERT INTO `allwww_log` VALUES ('2223', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:06:46');
INSERT INTO `allwww_log` VALUES ('2224', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:08');
INSERT INTO `allwww_log` VALUES ('2225', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:10');
INSERT INTO `allwww_log` VALUES ('2226', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:17');
INSERT INTO `allwww_log` VALUES ('2227', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:19');
INSERT INTO `allwww_log` VALUES ('2228', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:20');
INSERT INTO `allwww_log` VALUES ('2229', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:34');
INSERT INTO `allwww_log` VALUES ('2230', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:44');
INSERT INTO `allwww_log` VALUES ('2231', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:45');
INSERT INTO `allwww_log` VALUES ('2232', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:47');
INSERT INTO `allwww_log` VALUES ('2233', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:07:50');
INSERT INTO `allwww_log` VALUES ('2234', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:08:03');
INSERT INTO `allwww_log` VALUES ('2235', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:11:29');
INSERT INTO `allwww_log` VALUES ('2236', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:11:32');
INSERT INTO `allwww_log` VALUES ('2237', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:11:33');
INSERT INTO `allwww_log` VALUES ('2238', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:16:27');
INSERT INTO `allwww_log` VALUES ('2239', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:16:32');
INSERT INTO `allwww_log` VALUES ('2240', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:28:14');
INSERT INTO `allwww_log` VALUES ('2241', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:31:31');
INSERT INTO `allwww_log` VALUES ('2242', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:32:15');
INSERT INTO `allwww_log` VALUES ('2243', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:34:39');
INSERT INTO `allwww_log` VALUES ('2244', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:34:44');
INSERT INTO `allwww_log` VALUES ('2245', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:35:29');
INSERT INTO `allwww_log` VALUES ('2246', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:38:14');
INSERT INTO `allwww_log` VALUES ('2247', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:38:22');
INSERT INTO `allwww_log` VALUES ('2248', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:38:32');
INSERT INTO `allwww_log` VALUES ('2249', '', '0', 'link', '', 'link', '?m=link&c=link&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:38:50');
INSERT INTO `allwww_log` VALUES ('2250', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:01');
INSERT INTO `allwww_log` VALUES ('2251', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:08');
INSERT INTO `allwww_log` VALUES ('2252', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=delete', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:12');
INSERT INTO `allwww_log` VALUES ('2253', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:15');
INSERT INTO `allwww_log` VALUES ('2254', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:27');
INSERT INTO `allwww_log` VALUES ('2255', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:29');
INSERT INTO `allwww_log` VALUES ('2256', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:40:32');
INSERT INTO `allwww_log` VALUES ('2257', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:42:28');
INSERT INTO `allwww_log` VALUES ('2258', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:44:48');
INSERT INTO `allwww_log` VALUES ('2259', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:45:58');
INSERT INTO `allwww_log` VALUES ('2260', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:48:53');
INSERT INTO `allwww_log` VALUES ('2261', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-01 11:49:22');
INSERT INTO `allwww_log` VALUES ('2262', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-06-02 09:17:08');
INSERT INTO `allwww_log` VALUES ('2263', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-06-02 09:17:16');
INSERT INTO `allwww_log` VALUES ('2264', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 09:17:45');
INSERT INTO `allwww_log` VALUES ('2265', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-06-02 09:18:39');
INSERT INTO `allwww_log` VALUES ('2266', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 09:53:32');
INSERT INTO `allwww_log` VALUES ('2267', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 09:55:34');
INSERT INTO `allwww_log` VALUES ('2268', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:00:03');
INSERT INTO `allwww_log` VALUES ('2269', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:02:31');
INSERT INTO `allwww_log` VALUES ('2270', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:02:46');
INSERT INTO `allwww_log` VALUES ('2271', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:03:11');
INSERT INTO `allwww_log` VALUES ('2272', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:04:29');
INSERT INTO `allwww_log` VALUES ('2273', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:05:38');
INSERT INTO `allwww_log` VALUES ('2274', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:06:03');
INSERT INTO `allwww_log` VALUES ('2275', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:06:05');
INSERT INTO `allwww_log` VALUES ('2276', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:07:43');
INSERT INTO `allwww_log` VALUES ('2277', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:07:44');
INSERT INTO `allwww_log` VALUES ('2278', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:07:59');
INSERT INTO `allwww_log` VALUES ('2279', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:08:12');
INSERT INTO `allwww_log` VALUES ('2280', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:11:19');
INSERT INTO `allwww_log` VALUES ('2281', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:11:23');
INSERT INTO `allwww_log` VALUES ('2282', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:18:40');
INSERT INTO `allwww_log` VALUES ('2283', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:18:43');
INSERT INTO `allwww_log` VALUES ('2284', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:21:47');
INSERT INTO `allwww_log` VALUES ('2285', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:21:57');
INSERT INTO `allwww_log` VALUES ('2286', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:22:56');
INSERT INTO `allwww_log` VALUES ('2287', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:23:53');
INSERT INTO `allwww_log` VALUES ('2288', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:24:25');
INSERT INTO `allwww_log` VALUES ('2289', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:25:36');
INSERT INTO `allwww_log` VALUES ('2290', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:38');
INSERT INTO `allwww_log` VALUES ('2291', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:41');
INSERT INTO `allwww_log` VALUES ('2292', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:43');
INSERT INTO `allwww_log` VALUES ('2293', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:45');
INSERT INTO `allwww_log` VALUES ('2294', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:54');
INSERT INTO `allwww_log` VALUES ('2295', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:28:58');
INSERT INTO `allwww_log` VALUES ('2296', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:29:14');
INSERT INTO `allwww_log` VALUES ('2297', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:41:36');
INSERT INTO `allwww_log` VALUES ('2298', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:42:05');
INSERT INTO `allwww_log` VALUES ('2299', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:49:05');
INSERT INTO `allwww_log` VALUES ('2300', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:49:07');
INSERT INTO `allwww_log` VALUES ('2301', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:51:41');
INSERT INTO `allwww_log` VALUES ('2302', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:54:22');
INSERT INTO `allwww_log` VALUES ('2303', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:54:25');
INSERT INTO `allwww_log` VALUES ('2304', '', '0', 'link', '', 'link', '?m=link&c=link&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:54:27');
INSERT INTO `allwww_log` VALUES ('2305', '', '0', 'link', '', 'link', '?m=link&c=link&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:54:29');
INSERT INTO `allwww_log` VALUES ('2306', '', '0', 'link', '', 'link', '?m=link&c=link&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:54:32');
INSERT INTO `allwww_log` VALUES ('2307', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:55:45');
INSERT INTO `allwww_log` VALUES ('2308', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:55:50');
INSERT INTO `allwww_log` VALUES ('2309', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:58:00');
INSERT INTO `allwww_log` VALUES ('2310', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 10:58:03');
INSERT INTO `allwww_log` VALUES ('2311', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:01:12');
INSERT INTO `allwww_log` VALUES ('2312', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:02:46');
INSERT INTO `allwww_log` VALUES ('2313', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:03:06');
INSERT INTO `allwww_log` VALUES ('2314', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:03:41');
INSERT INTO `allwww_log` VALUES ('2315', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:03:49');
INSERT INTO `allwww_log` VALUES ('2316', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:04:19');
INSERT INTO `allwww_log` VALUES ('2317', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:04:45');
INSERT INTO `allwww_log` VALUES ('2318', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:05:41');
INSERT INTO `allwww_log` VALUES ('2319', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:06:34');
INSERT INTO `allwww_log` VALUES ('2320', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:06:36');
INSERT INTO `allwww_log` VALUES ('2321', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:07:20');
INSERT INTO `allwww_log` VALUES ('2322', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:07:22');
INSERT INTO `allwww_log` VALUES ('2323', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:07:58');
INSERT INTO `allwww_log` VALUES ('2324', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:07:59');
INSERT INTO `allwww_log` VALUES ('2325', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:08:03');
INSERT INTO `allwww_log` VALUES ('2326', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:08:22');
INSERT INTO `allwww_log` VALUES ('2327', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:08:23');
INSERT INTO `allwww_log` VALUES ('2328', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=setting', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:08:27');
INSERT INTO `allwww_log` VALUES ('2329', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:08:28');
INSERT INTO `allwww_log` VALUES ('2330', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:31:24');
INSERT INTO `allwww_log` VALUES ('2331', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:11');
INSERT INTO `allwww_log` VALUES ('2332', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:26');
INSERT INTO `allwww_log` VALUES ('2333', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:26');
INSERT INTO `allwww_log` VALUES ('2334', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=delete', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:35');
INSERT INTO `allwww_log` VALUES ('2335', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:50');
INSERT INTO `allwww_log` VALUES ('2336', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:56');
INSERT INTO `allwww_log` VALUES ('2337', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:32:57');
INSERT INTO `allwww_log` VALUES ('2338', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:33:15');
INSERT INTO `allwww_log` VALUES ('2339', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:33:16');
INSERT INTO `allwww_log` VALUES ('2340', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:33:19');
INSERT INTO `allwww_log` VALUES ('2341', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:33:33');
INSERT INTO `allwww_log` VALUES ('2342', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:33:39');
INSERT INTO `allwww_log` VALUES ('2343', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:35:43');
INSERT INTO `allwww_log` VALUES ('2344', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:37:23');
INSERT INTO `allwww_log` VALUES ('2345', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:37:32');
INSERT INTO `allwww_log` VALUES ('2346', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:37:37');
INSERT INTO `allwww_log` VALUES ('2347', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:37:53');
INSERT INTO `allwww_log` VALUES ('2348', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:08');
INSERT INTO `allwww_log` VALUES ('2349', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:26');
INSERT INTO `allwww_log` VALUES ('2350', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:30');
INSERT INTO `allwww_log` VALUES ('2351', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:37');
INSERT INTO `allwww_log` VALUES ('2352', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:53');
INSERT INTO `allwww_log` VALUES ('2353', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:38:56');
INSERT INTO `allwww_log` VALUES ('2354', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:39:22');
INSERT INTO `allwww_log` VALUES ('2355', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:25');
INSERT INTO `allwww_log` VALUES ('2356', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:29');
INSERT INTO `allwww_log` VALUES ('2357', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:37');
INSERT INTO `allwww_log` VALUES ('2358', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:39');
INSERT INTO `allwww_log` VALUES ('2359', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:40');
INSERT INTO `allwww_log` VALUES ('2360', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:44');
INSERT INTO `allwww_log` VALUES ('2361', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:42:46');
INSERT INTO `allwww_log` VALUES ('2362', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:19');
INSERT INTO `allwww_log` VALUES ('2363', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:24');
INSERT INTO `allwww_log` VALUES ('2364', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:25');
INSERT INTO `allwww_log` VALUES ('2365', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:33');
INSERT INTO `allwww_log` VALUES ('2366', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:37');
INSERT INTO `allwww_log` VALUES ('2367', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:39');
INSERT INTO `allwww_log` VALUES ('2368', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:41');
INSERT INTO `allwww_log` VALUES ('2369', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:47');
INSERT INTO `allwww_log` VALUES ('2370', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:43:49');
INSERT INTO `allwww_log` VALUES ('2371', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:44:24');
INSERT INTO `allwww_log` VALUES ('2372', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:44:29');
INSERT INTO `allwww_log` VALUES ('2373', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:00');
INSERT INTO `allwww_log` VALUES ('2374', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:01');
INSERT INTO `allwww_log` VALUES ('2375', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:03');
INSERT INTO `allwww_log` VALUES ('2376', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:07');
INSERT INTO `allwww_log` VALUES ('2377', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:08');
INSERT INTO `allwww_log` VALUES ('2378', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:45:17');
INSERT INTO `allwww_log` VALUES ('2379', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:48:23');
INSERT INTO `allwww_log` VALUES ('2380', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:48:40');
INSERT INTO `allwww_log` VALUES ('2381', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:48:43');
INSERT INTO `allwww_log` VALUES ('2382', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:48:52');
INSERT INTO `allwww_log` VALUES ('2383', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:48:53');
INSERT INTO `allwww_log` VALUES ('2384', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:06');
INSERT INTO `allwww_log` VALUES ('2385', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:07');
INSERT INTO `allwww_log` VALUES ('2386', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=edit_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:16');
INSERT INTO `allwww_log` VALUES ('2387', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:16');
INSERT INTO `allwww_log` VALUES ('2388', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=delete_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:19');
INSERT INTO `allwww_log` VALUES ('2389', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:21');
INSERT INTO `allwww_log` VALUES ('2390', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=add', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:23');
INSERT INTO `allwww_log` VALUES ('2391', '', '0', 'kefu', '', 'kefu', '?m=kefu&c=kefu&a=list_type', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:49:37');
INSERT INTO `allwww_log` VALUES ('2392', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:50:11');
INSERT INTO `allwww_log` VALUES ('2393', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '127.0.0.1', '2017-06-02 11:50:12');
INSERT INTO `allwww_log` VALUES ('2394', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 12:06:57');
INSERT INTO `allwww_log` VALUES ('2395', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '127.0.0.1', '2017-06-02 12:07:01');
INSERT INTO `allwww_log` VALUES ('2396', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-07-28 11:33:39');
INSERT INTO `allwww_log` VALUES ('2397', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-07-28 11:33:45');
INSERT INTO `allwww_log` VALUES ('2398', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '127.0.0.1', '2017-07-28 11:33:53');
INSERT INTO `allwww_log` VALUES ('2399', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-07-28 12:15:14');
INSERT INTO `allwww_log` VALUES ('2400', '', '0', 'content', '', 'sitemodel_field', '?m=content&c=sitemodel_field&a=edit', '', '1', 'admin', '127.0.0.1', '2017-07-28 12:15:19');
INSERT INTO `allwww_log` VALUES ('2401', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=export', '', '1', 'admin', '127.0.0.1', '2017-07-28 12:15:57');
INSERT INTO `allwww_log` VALUES ('2402', '', '0', 'content', '', 'sitemodel', '?m=content&c=sitemodel&a=edit', '', '1', 'admin', '127.0.0.1', '2017-07-28 12:16:00');
INSERT INTO `allwww_log` VALUES ('2403', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-07-28 12:16:42');
INSERT INTO `allwww_log` VALUES ('2404', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-07-28 12:17:06');
INSERT INTO `allwww_log` VALUES ('2405', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-07-28 12:17:08');
INSERT INTO `allwww_log` VALUES ('2406', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-07-28 12:17:09');
INSERT INTO `allwww_log` VALUES ('2407', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2017-07-28 12:17:12');
INSERT INTO `allwww_log` VALUES ('2408', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:12:09');
INSERT INTO `allwww_log` VALUES ('2409', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:12:13');
INSERT INTO `allwww_log` VALUES ('2410', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:21:03');
INSERT INTO `allwww_log` VALUES ('2411', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:41');
INSERT INTO `allwww_log` VALUES ('2412', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:50');
INSERT INTO `allwww_log` VALUES ('2413', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:51');
INSERT INTO `allwww_log` VALUES ('2414', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:51');
INSERT INTO `allwww_log` VALUES ('2415', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:52');
INSERT INTO `allwww_log` VALUES ('2416', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:52');
INSERT INTO `allwww_log` VALUES ('2417', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:52');
INSERT INTO `allwww_log` VALUES ('2418', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:53');
INSERT INTO `allwww_log` VALUES ('2419', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:53');
INSERT INTO `allwww_log` VALUES ('2420', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:53');
INSERT INTO `allwww_log` VALUES ('2421', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:54');
INSERT INTO `allwww_log` VALUES ('2422', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:55');
INSERT INTO `allwww_log` VALUES ('2423', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:22:55');
INSERT INTO `allwww_log` VALUES ('2424', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:23:11');
INSERT INTO `allwww_log` VALUES ('2425', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:25:31');
INSERT INTO `allwww_log` VALUES ('2426', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:25:34');
INSERT INTO `allwww_log` VALUES ('2427', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:26:06');
INSERT INTO `allwww_log` VALUES ('2428', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:26:12');
INSERT INTO `allwww_log` VALUES ('2429', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:28:10');
INSERT INTO `allwww_log` VALUES ('2430', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:28:19');
INSERT INTO `allwww_log` VALUES ('2431', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:28:20');
INSERT INTO `allwww_log` VALUES ('2432', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 09:28:36');
INSERT INTO `allwww_log` VALUES ('2433', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:33:13');
INSERT INTO `allwww_log` VALUES ('2434', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:33:14');
INSERT INTO `allwww_log` VALUES ('2435', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:33:29');
INSERT INTO `allwww_log` VALUES ('2436', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:34:42');
INSERT INTO `allwww_log` VALUES ('2437', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:34:58');
INSERT INTO `allwww_log` VALUES ('2438', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:35:09');
INSERT INTO `allwww_log` VALUES ('2439', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:35:13');
INSERT INTO `allwww_log` VALUES ('2440', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:36:07');
INSERT INTO `allwww_log` VALUES ('2441', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:36:22');
INSERT INTO `allwww_log` VALUES ('2442', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:36:27');
INSERT INTO `allwww_log` VALUES ('2443', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:36:30');
INSERT INTO `allwww_log` VALUES ('2444', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:37:16');
INSERT INTO `allwww_log` VALUES ('2445', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:39:42');
INSERT INTO `allwww_log` VALUES ('2446', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:39:45');
INSERT INTO `allwww_log` VALUES ('2447', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:41:42');
INSERT INTO `allwww_log` VALUES ('2448', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:41:43');
INSERT INTO `allwww_log` VALUES ('2449', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:41:43');
INSERT INTO `allwww_log` VALUES ('2450', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:41:51');
INSERT INTO `allwww_log` VALUES ('2451', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:42:18');
INSERT INTO `allwww_log` VALUES ('2452', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:44:14');
INSERT INTO `allwww_log` VALUES ('2453', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:45:21');
INSERT INTO `allwww_log` VALUES ('2454', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:45');
INSERT INTO `allwww_log` VALUES ('2455', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:47');
INSERT INTO `allwww_log` VALUES ('2456', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('2457', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('2458', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('2459', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('2460', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:48:48');
INSERT INTO `allwww_log` VALUES ('2461', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:49:23');
INSERT INTO `allwww_log` VALUES ('2462', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:53:14');
INSERT INTO `allwww_log` VALUES ('2463', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:54:01');
INSERT INTO `allwww_log` VALUES ('2464', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:54:29');
INSERT INTO `allwww_log` VALUES ('2465', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:58:08');
INSERT INTO `allwww_log` VALUES ('2466', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 09:58:21');
INSERT INTO `allwww_log` VALUES ('2467', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:01:57');
INSERT INTO `allwww_log` VALUES ('2468', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:05:01');
INSERT INTO `allwww_log` VALUES ('2469', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:05:34');
INSERT INTO `allwww_log` VALUES ('2470', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:06:47');
INSERT INTO `allwww_log` VALUES ('2471', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:06:59');
INSERT INTO `allwww_log` VALUES ('2472', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:07:17');
INSERT INTO `allwww_log` VALUES ('2473', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:07:28');
INSERT INTO `allwww_log` VALUES ('2474', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:09:17');
INSERT INTO `allwww_log` VALUES ('2475', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:09:51');
INSERT INTO `allwww_log` VALUES ('2476', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:10:03');
INSERT INTO `allwww_log` VALUES ('2477', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:10:15');
INSERT INTO `allwww_log` VALUES ('2478', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:10:23');
INSERT INTO `allwww_log` VALUES ('2479', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:10:42');
INSERT INTO `allwww_log` VALUES ('2480', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:13:43');
INSERT INTO `allwww_log` VALUES ('2481', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:13:45');
INSERT INTO `allwww_log` VALUES ('2482', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:14:01');
INSERT INTO `allwww_log` VALUES ('2483', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:14:07');
INSERT INTO `allwww_log` VALUES ('2484', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:14:12');
INSERT INTO `allwww_log` VALUES ('2485', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:16:05');
INSERT INTO `allwww_log` VALUES ('2486', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:16:25');
INSERT INTO `allwww_log` VALUES ('2487', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:17:32');
INSERT INTO `allwww_log` VALUES ('2488', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:18:22');
INSERT INTO `allwww_log` VALUES ('2489', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:18:29');
INSERT INTO `allwww_log` VALUES ('2490', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:20:09');
INSERT INTO `allwww_log` VALUES ('2491', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:20:10');
INSERT INTO `allwww_log` VALUES ('2492', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:20:46');
INSERT INTO `allwww_log` VALUES ('2493', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:20:49');
INSERT INTO `allwww_log` VALUES ('2494', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:20:51');
INSERT INTO `allwww_log` VALUES ('2495', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:21:05');
INSERT INTO `allwww_log` VALUES ('2496', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:21:31');
INSERT INTO `allwww_log` VALUES ('2497', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:22:07');
INSERT INTO `allwww_log` VALUES ('2498', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:22:50');
INSERT INTO `allwww_log` VALUES ('2499', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:23:23');
INSERT INTO `allwww_log` VALUES ('2500', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:24:21');
INSERT INTO `allwww_log` VALUES ('2501', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:24:42');
INSERT INTO `allwww_log` VALUES ('2502', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:25:05');
INSERT INTO `allwww_log` VALUES ('2503', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:25:34');
INSERT INTO `allwww_log` VALUES ('2504', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:26:39');
INSERT INTO `allwww_log` VALUES ('2505', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:27:12');
INSERT INTO `allwww_log` VALUES ('2506', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:28:18');
INSERT INTO `allwww_log` VALUES ('2507', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:28:44');
INSERT INTO `allwww_log` VALUES ('2508', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:29:39');
INSERT INTO `allwww_log` VALUES ('2509', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:29:42');
INSERT INTO `allwww_log` VALUES ('2510', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:30:39');
INSERT INTO `allwww_log` VALUES ('2511', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:31:23');
INSERT INTO `allwww_log` VALUES ('2512', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:31:35');
INSERT INTO `allwww_log` VALUES ('2513', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:31:44');
INSERT INTO `allwww_log` VALUES ('2514', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:31:52');
INSERT INTO `allwww_log` VALUES ('2515', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:32:07');
INSERT INTO `allwww_log` VALUES ('2516', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:32:23');
INSERT INTO `allwww_log` VALUES ('2517', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:32:32');
INSERT INTO `allwww_log` VALUES ('2518', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:32:38');
INSERT INTO `allwww_log` VALUES ('2519', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:32:47');
INSERT INTO `allwww_log` VALUES ('2520', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:33:00');
INSERT INTO `allwww_log` VALUES ('2521', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:33:07');
INSERT INTO `allwww_log` VALUES ('2522', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:33:24');
INSERT INTO `allwww_log` VALUES ('2523', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:34:02');
INSERT INTO `allwww_log` VALUES ('2524', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:34:09');
INSERT INTO `allwww_log` VALUES ('2525', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:34:26');
INSERT INTO `allwww_log` VALUES ('2526', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:34:29');
INSERT INTO `allwww_log` VALUES ('2527', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:34:51');
INSERT INTO `allwww_log` VALUES ('2528', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:35:13');
INSERT INTO `allwww_log` VALUES ('2529', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:41:09');
INSERT INTO `allwww_log` VALUES ('2530', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:41:19');
INSERT INTO `allwww_log` VALUES ('2531', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:41:51');
INSERT INTO `allwww_log` VALUES ('2532', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:42:59');
INSERT INTO `allwww_log` VALUES ('2533', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:43:05');
INSERT INTO `allwww_log` VALUES ('2534', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:43:23');
INSERT INTO `allwww_log` VALUES ('2535', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:43:45');
INSERT INTO `allwww_log` VALUES ('2536', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:43:49');
INSERT INTO `allwww_log` VALUES ('2537', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:43:53');
INSERT INTO `allwww_log` VALUES ('2538', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:44:04');
INSERT INTO `allwww_log` VALUES ('2539', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 10:45:12');
INSERT INTO `allwww_log` VALUES ('2540', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:17');
INSERT INTO `allwww_log` VALUES ('2541', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:20');
INSERT INTO `allwww_log` VALUES ('2542', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:20');
INSERT INTO `allwww_log` VALUES ('2543', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:21');
INSERT INTO `allwww_log` VALUES ('2544', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:21');
INSERT INTO `allwww_log` VALUES ('2545', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:21');
INSERT INTO `allwww_log` VALUES ('2546', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:47:23');
INSERT INTO `allwww_log` VALUES ('2547', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:49:36');
INSERT INTO `allwww_log` VALUES ('2548', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:49:36');
INSERT INTO `allwww_log` VALUES ('2549', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:49:37');
INSERT INTO `allwww_log` VALUES ('2550', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:49:48');
INSERT INTO `allwww_log` VALUES ('2551', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:49:59');
INSERT INTO `allwww_log` VALUES ('2552', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:50:04');
INSERT INTO `allwww_log` VALUES ('2553', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:50:27');
INSERT INTO `allwww_log` VALUES ('2554', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:52:18');
INSERT INTO `allwww_log` VALUES ('2555', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:52:41');
INSERT INTO `allwww_log` VALUES ('2556', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 10:54:00');
INSERT INTO `allwww_log` VALUES ('2557', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:07:14');
INSERT INTO `allwww_log` VALUES ('2558', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:08:28');
INSERT INTO `allwww_log` VALUES ('2559', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:09:14');
INSERT INTO `allwww_log` VALUES ('2560', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:09:23');
INSERT INTO `allwww_log` VALUES ('2561', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:12:43');
INSERT INTO `allwww_log` VALUES ('2562', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:14:38');
INSERT INTO `allwww_log` VALUES ('2563', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:21:08');
INSERT INTO `allwww_log` VALUES ('2564', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:21:09');
INSERT INTO `allwww_log` VALUES ('2565', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:21:28');
INSERT INTO `allwww_log` VALUES ('2566', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:21:45');
INSERT INTO `allwww_log` VALUES ('2567', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 11:24:37');
INSERT INTO `allwww_log` VALUES ('2568', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:30:25');
INSERT INTO `allwww_log` VALUES ('2569', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:31:17');
INSERT INTO `allwww_log` VALUES ('2570', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:34:43');
INSERT INTO `allwww_log` VALUES ('2571', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:34:48');
INSERT INTO `allwww_log` VALUES ('2572', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:42:41');
INSERT INTO `allwww_log` VALUES ('2573', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:46:44');
INSERT INTO `allwww_log` VALUES ('2574', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:52:32');
INSERT INTO `allwww_log` VALUES ('2575', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:54:59');
INSERT INTO `allwww_log` VALUES ('2576', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:01');
INSERT INTO `allwww_log` VALUES ('2577', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:06');
INSERT INTO `allwww_log` VALUES ('2578', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:13');
INSERT INTO `allwww_log` VALUES ('2579', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:14');
INSERT INTO `allwww_log` VALUES ('2580', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:32');
INSERT INTO `allwww_log` VALUES ('2581', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:42');
INSERT INTO `allwww_log` VALUES ('2582', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:55:43');
INSERT INTO `allwww_log` VALUES ('2583', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:57:48');
INSERT INTO `allwww_log` VALUES ('2584', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:58:09');
INSERT INTO `allwww_log` VALUES ('2585', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 11:59:15');
INSERT INTO `allwww_log` VALUES ('2586', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:02:02');
INSERT INTO `allwww_log` VALUES ('2587', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:04:30');
INSERT INTO `allwww_log` VALUES ('2588', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:05:25');
INSERT INTO `allwww_log` VALUES ('2589', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:06:14');
INSERT INTO `allwww_log` VALUES ('2590', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:06:45');
INSERT INTO `allwww_log` VALUES ('2591', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:07:06');
INSERT INTO `allwww_log` VALUES ('2592', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:07:31');
INSERT INTO `allwww_log` VALUES ('2593', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 12:07:31');
INSERT INTO `allwww_log` VALUES ('2594', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:38:45');
INSERT INTO `allwww_log` VALUES ('2595', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:39:08');
INSERT INTO `allwww_log` VALUES ('2596', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:39:09');
INSERT INTO `allwww_log` VALUES ('2597', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:39:47');
INSERT INTO `allwww_log` VALUES ('2598', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:40:08');
INSERT INTO `allwww_log` VALUES ('2599', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:41:57');
INSERT INTO `allwww_log` VALUES ('2600', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:43:04');
INSERT INTO `allwww_log` VALUES ('2601', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:43:27');
INSERT INTO `allwww_log` VALUES ('2602', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:46:54');
INSERT INTO `allwww_log` VALUES ('2603', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:47:01');
INSERT INTO `allwww_log` VALUES ('2604', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:48:36');
INSERT INTO `allwww_log` VALUES ('2605', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:48:58');
INSERT INTO `allwww_log` VALUES ('2606', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:48:59');
INSERT INTO `allwww_log` VALUES ('2607', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:50:23');
INSERT INTO `allwww_log` VALUES ('2608', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:52:56');
INSERT INTO `allwww_log` VALUES ('2609', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:53:17');
INSERT INTO `allwww_log` VALUES ('2610', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:53:19');
INSERT INTO `allwww_log` VALUES ('2611', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:54:30');
INSERT INTO `allwww_log` VALUES ('2612', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:54:48');
INSERT INTO `allwww_log` VALUES ('2613', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:55:23');
INSERT INTO `allwww_log` VALUES ('2614', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 13:57:50');
INSERT INTO `allwww_log` VALUES ('2615', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:01:01');
INSERT INTO `allwww_log` VALUES ('2616', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:09:36');
INSERT INTO `allwww_log` VALUES ('2617', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:10:52');
INSERT INTO `allwww_log` VALUES ('2618', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:11:01');
INSERT INTO `allwww_log` VALUES ('2619', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:11:49');
INSERT INTO `allwww_log` VALUES ('2620', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:20:08');
INSERT INTO `allwww_log` VALUES ('2621', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:20:25');
INSERT INTO `allwww_log` VALUES ('2622', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:20:41');
INSERT INTO `allwww_log` VALUES ('2623', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:22:20');
INSERT INTO `allwww_log` VALUES ('2624', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:22:23');
INSERT INTO `allwww_log` VALUES ('2625', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:22:25');
INSERT INTO `allwww_log` VALUES ('2626', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:24:47');
INSERT INTO `allwww_log` VALUES ('2627', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:26:57');
INSERT INTO `allwww_log` VALUES ('2628', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:27:05');
INSERT INTO `allwww_log` VALUES ('2629', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:28:17');
INSERT INTO `allwww_log` VALUES ('2630', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:28:24');
INSERT INTO `allwww_log` VALUES ('2631', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:28:33');
INSERT INTO `allwww_log` VALUES ('2632', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:28:40');
INSERT INTO `allwww_log` VALUES ('2633', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:29:30');
INSERT INTO `allwww_log` VALUES ('2634', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:30:33');
INSERT INTO `allwww_log` VALUES ('2635', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:30:38');
INSERT INTO `allwww_log` VALUES ('2636', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:32:14');
INSERT INTO `allwww_log` VALUES ('2637', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:32:24');
INSERT INTO `allwww_log` VALUES ('2638', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:33:02');
INSERT INTO `allwww_log` VALUES ('2639', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:33:11');
INSERT INTO `allwww_log` VALUES ('2640', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:34:07');
INSERT INTO `allwww_log` VALUES ('2641', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:34:29');
INSERT INTO `allwww_log` VALUES ('2642', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:34:55');
INSERT INTO `allwww_log` VALUES ('2643', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:35:13');
INSERT INTO `allwww_log` VALUES ('2644', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:35:23');
INSERT INTO `allwww_log` VALUES ('2645', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:36:16');
INSERT INTO `allwww_log` VALUES ('2646', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:36:34');
INSERT INTO `allwww_log` VALUES ('2647', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:37:39');
INSERT INTO `allwww_log` VALUES ('2648', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:38:11');
INSERT INTO `allwww_log` VALUES ('2649', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:38:49');
INSERT INTO `allwww_log` VALUES ('2650', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:38:52');
INSERT INTO `allwww_log` VALUES ('2651', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:39:16');
INSERT INTO `allwww_log` VALUES ('2652', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:39:20');
INSERT INTO `allwww_log` VALUES ('2653', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:39:21');
INSERT INTO `allwww_log` VALUES ('2654', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:40:33');
INSERT INTO `allwww_log` VALUES ('2655', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:40:51');
INSERT INTO `allwww_log` VALUES ('2656', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:40:53');
INSERT INTO `allwww_log` VALUES ('2657', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:41:47');
INSERT INTO `allwww_log` VALUES ('2658', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:41:48');
INSERT INTO `allwww_log` VALUES ('2659', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:41:48');
INSERT INTO `allwww_log` VALUES ('2660', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:41:48');
INSERT INTO `allwww_log` VALUES ('2661', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:42:29');
INSERT INTO `allwww_log` VALUES ('2662', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:42:29');
INSERT INTO `allwww_log` VALUES ('2663', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:42:52');
INSERT INTO `allwww_log` VALUES ('2664', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:44:17');
INSERT INTO `allwww_log` VALUES ('2665', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:44:39');
INSERT INTO `allwww_log` VALUES ('2666', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:45:46');
INSERT INTO `allwww_log` VALUES ('2667', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:45:50');
INSERT INTO `allwww_log` VALUES ('2668', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:46:04');
INSERT INTO `allwww_log` VALUES ('2669', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:46:31');
INSERT INTO `allwww_log` VALUES ('2670', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:46:49');
INSERT INTO `allwww_log` VALUES ('2671', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:47:12');
INSERT INTO `allwww_log` VALUES ('2672', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:47:39');
INSERT INTO `allwww_log` VALUES ('2673', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:47:52');
INSERT INTO `allwww_log` VALUES ('2674', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:47:58');
INSERT INTO `allwww_log` VALUES ('2675', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:48:41');
INSERT INTO `allwww_log` VALUES ('2676', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:48:49');
INSERT INTO `allwww_log` VALUES ('2677', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:48:59');
INSERT INTO `allwww_log` VALUES ('2678', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:51:28');
INSERT INTO `allwww_log` VALUES ('2679', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:57:20');
INSERT INTO `allwww_log` VALUES ('2680', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:57:22');
INSERT INTO `allwww_log` VALUES ('2681', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:57:57');
INSERT INTO `allwww_log` VALUES ('2682', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:58:16');
INSERT INTO `allwww_log` VALUES ('2683', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:58:32');
INSERT INTO `allwww_log` VALUES ('2684', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:58:45');
INSERT INTO `allwww_log` VALUES ('2685', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:59:15');
INSERT INTO `allwww_log` VALUES ('2686', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:59:21');
INSERT INTO `allwww_log` VALUES ('2687', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:59:39');
INSERT INTO `allwww_log` VALUES ('2688', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 14:59:46');
INSERT INTO `allwww_log` VALUES ('2689', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:00:30');
INSERT INTO `allwww_log` VALUES ('2690', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:00:34');
INSERT INTO `allwww_log` VALUES ('2691', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:00:40');
INSERT INTO `allwww_log` VALUES ('2692', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:00');
INSERT INTO `allwww_log` VALUES ('2693', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:01');
INSERT INTO `allwww_log` VALUES ('2694', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:04');
INSERT INTO `allwww_log` VALUES ('2695', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:08');
INSERT INTO `allwww_log` VALUES ('2696', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:12');
INSERT INTO `allwww_log` VALUES ('2697', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:18');
INSERT INTO `allwww_log` VALUES ('2698', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:01:41');
INSERT INTO `allwww_log` VALUES ('2699', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:02:03');
INSERT INTO `allwww_log` VALUES ('2700', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:45');
INSERT INTO `allwww_log` VALUES ('2701', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:46');
INSERT INTO `allwww_log` VALUES ('2702', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:48');
INSERT INTO `allwww_log` VALUES ('2703', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:48');
INSERT INTO `allwww_log` VALUES ('2704', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:48');
INSERT INTO `allwww_log` VALUES ('2705', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:49');
INSERT INTO `allwww_log` VALUES ('2706', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:03:55');
INSERT INTO `allwww_log` VALUES ('2707', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:04:27');
INSERT INTO `allwww_log` VALUES ('2708', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:04:30');
INSERT INTO `allwww_log` VALUES ('2709', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:05:28');
INSERT INTO `allwww_log` VALUES ('2710', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:05:41');
INSERT INTO `allwww_log` VALUES ('2711', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:05:59');
INSERT INTO `allwww_log` VALUES ('2712', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:10:59');
INSERT INTO `allwww_log` VALUES ('2713', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:01');
INSERT INTO `allwww_log` VALUES ('2714', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:07');
INSERT INTO `allwww_log` VALUES ('2715', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:10');
INSERT INTO `allwww_log` VALUES ('2716', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:11');
INSERT INTO `allwww_log` VALUES ('2717', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:11');
INSERT INTO `allwww_log` VALUES ('2718', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:11');
INSERT INTO `allwww_log` VALUES ('2719', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:12');
INSERT INTO `allwww_log` VALUES ('2720', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:12');
INSERT INTO `allwww_log` VALUES ('2721', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:12');
INSERT INTO `allwww_log` VALUES ('2722', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:12');
INSERT INTO `allwww_log` VALUES ('2723', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:13');
INSERT INTO `allwww_log` VALUES ('2724', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:13');
INSERT INTO `allwww_log` VALUES ('2725', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:13');
INSERT INTO `allwww_log` VALUES ('2726', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:13');
INSERT INTO `allwww_log` VALUES ('2727', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:19');
INSERT INTO `allwww_log` VALUES ('2728', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:24');
INSERT INTO `allwww_log` VALUES ('2729', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:28');
INSERT INTO `allwww_log` VALUES ('2730', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:36');
INSERT INTO `allwww_log` VALUES ('2731', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:39');
INSERT INTO `allwww_log` VALUES ('2732', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:43');
INSERT INTO `allwww_log` VALUES ('2733', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:47');
INSERT INTO `allwww_log` VALUES ('2734', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:50');
INSERT INTO `allwww_log` VALUES ('2735', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:54');
INSERT INTO `allwww_log` VALUES ('2736', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:11:56');
INSERT INTO `allwww_log` VALUES ('2737', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:05');
INSERT INTO `allwww_log` VALUES ('2738', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:08');
INSERT INTO `allwww_log` VALUES ('2739', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:11');
INSERT INTO `allwww_log` VALUES ('2740', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:15');
INSERT INTO `allwww_log` VALUES ('2741', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:18');
INSERT INTO `allwww_log` VALUES ('2742', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:12:26');
INSERT INTO `allwww_log` VALUES ('2743', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:12:40');
INSERT INTO `allwww_log` VALUES ('2744', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:12:48');
INSERT INTO `allwww_log` VALUES ('2745', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:12:58');
INSERT INTO `allwww_log` VALUES ('2746', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:08');
INSERT INTO `allwww_log` VALUES ('2747', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:14');
INSERT INTO `allwww_log` VALUES ('2748', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:25');
INSERT INTO `allwww_log` VALUES ('2749', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:29');
INSERT INTO `allwww_log` VALUES ('2750', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:34');
INSERT INTO `allwww_log` VALUES ('2751', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:13:55');
INSERT INTO `allwww_log` VALUES ('2752', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:07');
INSERT INTO `allwww_log` VALUES ('2753', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:13');
INSERT INTO `allwww_log` VALUES ('2754', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:21');
INSERT INTO `allwww_log` VALUES ('2755', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:25');
INSERT INTO `allwww_log` VALUES ('2756', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:27');
INSERT INTO `allwww_log` VALUES ('2757', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:28');
INSERT INTO `allwww_log` VALUES ('2758', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:30');
INSERT INTO `allwww_log` VALUES ('2759', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:14:59');
INSERT INTO `allwww_log` VALUES ('2760', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:15:03');
INSERT INTO `allwww_log` VALUES ('2761', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:15:08');
INSERT INTO `allwww_log` VALUES ('2762', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:15:32');
INSERT INTO `allwww_log` VALUES ('2763', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:15:34');
INSERT INTO `allwww_log` VALUES ('2764', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-08 15:16:15');
INSERT INTO `allwww_log` VALUES ('2765', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:11');
INSERT INTO `allwww_log` VALUES ('2766', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:20');
INSERT INTO `allwww_log` VALUES ('2767', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:26');
INSERT INTO `allwww_log` VALUES ('2768', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:31');
INSERT INTO `allwww_log` VALUES ('2769', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:34');
INSERT INTO `allwww_log` VALUES ('2770', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:36');
INSERT INTO `allwww_log` VALUES ('2771', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:38');
INSERT INTO `allwww_log` VALUES ('2772', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:40');
INSERT INTO `allwww_log` VALUES ('2773', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 15:17:42');
INSERT INTO `allwww_log` VALUES ('2774', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 16:08:18');
INSERT INTO `allwww_log` VALUES ('2775', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 16:08:24');
INSERT INTO `allwww_log` VALUES ('2776', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-08 16:08:30');
INSERT INTO `allwww_log` VALUES ('2777', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:00:01');
INSERT INTO `allwww_log` VALUES ('2778', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:04:03');
INSERT INTO `allwww_log` VALUES ('2779', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:04:29');
INSERT INTO `allwww_log` VALUES ('2780', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:04:38');
INSERT INTO `allwww_log` VALUES ('2781', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:04:58');
INSERT INTO `allwww_log` VALUES ('2782', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:05:21');
INSERT INTO `allwww_log` VALUES ('2783', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:05:23');
INSERT INTO `allwww_log` VALUES ('2784', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:16');
INSERT INTO `allwww_log` VALUES ('2785', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:21');
INSERT INTO `allwww_log` VALUES ('2786', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:29');
INSERT INTO `allwww_log` VALUES ('2787', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:35');
INSERT INTO `allwww_log` VALUES ('2788', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:39');
INSERT INTO `allwww_log` VALUES ('2789', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:09:51');
INSERT INTO `allwww_log` VALUES ('2790', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:10:18');
INSERT INTO `allwww_log` VALUES ('2791', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:11:11');
INSERT INTO `allwww_log` VALUES ('2792', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:12:39');
INSERT INTO `allwww_log` VALUES ('2793', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:13:27');
INSERT INTO `allwww_log` VALUES ('2794', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:15:35');
INSERT INTO `allwww_log` VALUES ('2795', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:16:13');
INSERT INTO `allwww_log` VALUES ('2796', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:17:03');
INSERT INTO `allwww_log` VALUES ('2797', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:17:13');
INSERT INTO `allwww_log` VALUES ('2798', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:17:52');
INSERT INTO `allwww_log` VALUES ('2799', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:18:00');
INSERT INTO `allwww_log` VALUES ('2800', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:18:16');
INSERT INTO `allwww_log` VALUES ('2801', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:18:26');
INSERT INTO `allwww_log` VALUES ('2802', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:18:34');
INSERT INTO `allwww_log` VALUES ('2803', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:18:46');
INSERT INTO `allwww_log` VALUES ('2804', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:19:01');
INSERT INTO `allwww_log` VALUES ('2805', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:19:27');
INSERT INTO `allwww_log` VALUES ('2806', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:19:33');
INSERT INTO `allwww_log` VALUES ('2807', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:19:47');
INSERT INTO `allwww_log` VALUES ('2808', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:20:16');
INSERT INTO `allwww_log` VALUES ('2809', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:20:39');
INSERT INTO `allwww_log` VALUES ('2810', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:21:18');
INSERT INTO `allwww_log` VALUES ('2811', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:21:49');
INSERT INTO `allwww_log` VALUES ('2812', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:21:59');
INSERT INTO `allwww_log` VALUES ('2813', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:22:16');
INSERT INTO `allwww_log` VALUES ('2814', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:22:28');
INSERT INTO `allwww_log` VALUES ('2815', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:22:54');
INSERT INTO `allwww_log` VALUES ('2816', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:23:27');
INSERT INTO `allwww_log` VALUES ('2817', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:23:57');
INSERT INTO `allwww_log` VALUES ('2818', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:25:13');
INSERT INTO `allwww_log` VALUES ('2819', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:25:29');
INSERT INTO `allwww_log` VALUES ('2820', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:28:12');
INSERT INTO `allwww_log` VALUES ('2821', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:28:17');
INSERT INTO `allwww_log` VALUES ('2822', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:30:10');
INSERT INTO `allwww_log` VALUES ('2823', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:30:11');
INSERT INTO `allwww_log` VALUES ('2824', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:33:25');
INSERT INTO `allwww_log` VALUES ('2825', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:33:51');
INSERT INTO `allwww_log` VALUES ('2826', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:34:21');
INSERT INTO `allwww_log` VALUES ('2827', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:35:01');
INSERT INTO `allwww_log` VALUES ('2828', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:35:33');
INSERT INTO `allwww_log` VALUES ('2829', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:35:35');
INSERT INTO `allwww_log` VALUES ('2830', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:35:35');
INSERT INTO `allwww_log` VALUES ('2831', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:35:35');
INSERT INTO `allwww_log` VALUES ('2832', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:42:25');
INSERT INTO `allwww_log` VALUES ('2833', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:42:30');
INSERT INTO `allwww_log` VALUES ('2834', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:42:31');
INSERT INTO `allwww_log` VALUES ('2835', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:42:31');
INSERT INTO `allwww_log` VALUES ('2836', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:42:31');
INSERT INTO `allwww_log` VALUES ('2837', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:43:30');
INSERT INTO `allwww_log` VALUES ('2838', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:43:51');
INSERT INTO `allwww_log` VALUES ('2839', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:47:09');
INSERT INTO `allwww_log` VALUES ('2840', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:51:16');
INSERT INTO `allwww_log` VALUES ('2841', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:51:27');
INSERT INTO `allwww_log` VALUES ('2842', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:58:35');
INSERT INTO `allwww_log` VALUES ('2843', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 10:58:50');
INSERT INTO `allwww_log` VALUES ('2844', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:10:12');
INSERT INTO `allwww_log` VALUES ('2845', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:10:33');
INSERT INTO `allwww_log` VALUES ('2846', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:11:56');
INSERT INTO `allwww_log` VALUES ('2847', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:13:10');
INSERT INTO `allwww_log` VALUES ('2848', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:14:30');
INSERT INTO `allwww_log` VALUES ('2849', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:19:27');
INSERT INTO `allwww_log` VALUES ('2850', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:19:34');
INSERT INTO `allwww_log` VALUES ('2851', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:20:01');
INSERT INTO `allwww_log` VALUES ('2852', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:24:43');
INSERT INTO `allwww_log` VALUES ('2853', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:24:48');
INSERT INTO `allwww_log` VALUES ('2854', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:25:08');
INSERT INTO `allwww_log` VALUES ('2855', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:25:10');
INSERT INTO `allwww_log` VALUES ('2856', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:25:23');
INSERT INTO `allwww_log` VALUES ('2857', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:27:03');
INSERT INTO `allwww_log` VALUES ('2858', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:27:24');
INSERT INTO `allwww_log` VALUES ('2859', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:27:49');
INSERT INTO `allwww_log` VALUES ('2860', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-09 11:27:50');
INSERT INTO `allwww_log` VALUES ('2861', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-10 09:36:42');
INSERT INTO `allwww_log` VALUES ('2862', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-10 12:30:30');
INSERT INTO `allwww_log` VALUES ('2863', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-13 11:48:23');
INSERT INTO `allwww_log` VALUES ('2864', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-13 11:48:34');
INSERT INTO `allwww_log` VALUES ('2865', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '', '2017-11-13 11:48:54');
INSERT INTO `allwww_log` VALUES ('2866', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=install', '', '1', 'admin', '', '2017-11-13 11:48:56');
INSERT INTO `allwww_log` VALUES ('2867', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '', '2017-11-13 11:48:59');
INSERT INTO `allwww_log` VALUES ('2868', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-15 09:07:50');
INSERT INTO `allwww_log` VALUES ('2869', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-21 15:35:21');
INSERT INTO `allwww_log` VALUES ('2870', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-21 15:35:23');
INSERT INTO `allwww_log` VALUES ('2871', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-21 15:35:32');
INSERT INTO `allwww_log` VALUES ('2872', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-21 15:36:16');
INSERT INTO `allwww_log` VALUES ('2873', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '', '2017-11-21 15:36:43');
INSERT INTO `allwww_log` VALUES ('2874', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:08:49');
INSERT INTO `allwww_log` VALUES ('2875', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:08:58');
INSERT INTO `allwww_log` VALUES ('2876', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:09:09');
INSERT INTO `allwww_log` VALUES ('2877', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:09:44');
INSERT INTO `allwww_log` VALUES ('2878', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:13:51');
INSERT INTO `allwww_log` VALUES ('2879', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-11-23 09:13:59');
INSERT INTO `allwww_log` VALUES ('2880', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-28 09:28:07');
INSERT INTO `allwww_log` VALUES ('2881', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-11-28 09:28:17');
INSERT INTO `allwww_log` VALUES ('2882', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '', '2017-11-28 09:28:27');
INSERT INTO `allwww_log` VALUES ('2883', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '', '2017-11-28 09:28:37');
INSERT INTO `allwww_log` VALUES ('2884', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:29:27');
INSERT INTO `allwww_log` VALUES ('2885', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:29:33');
INSERT INTO `allwww_log` VALUES ('2886', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:29:54');
INSERT INTO `allwww_log` VALUES ('2887', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:30:32');
INSERT INTO `allwww_log` VALUES ('2888', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '', '2017-11-28 09:30:37');
INSERT INTO `allwww_log` VALUES ('2889', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '', '2017-11-28 09:30:53');
INSERT INTO `allwww_log` VALUES ('2890', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=uninstall', '', '1', 'admin', '', '2017-11-28 09:31:26');
INSERT INTO `allwww_log` VALUES ('2891', '', '0', 'admin', '', 'module', '?m=admin&c=module&a=cache', '', '1', 'admin', '', '2017-11-28 09:31:27');
INSERT INTO `allwww_log` VALUES ('2892', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:32:40');
INSERT INTO `allwww_log` VALUES ('2893', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:33:56');
INSERT INTO `allwww_log` VALUES ('2894', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:33:59');
INSERT INTO `allwww_log` VALUES ('2895', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:34:31');
INSERT INTO `allwww_log` VALUES ('2896', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-11-28 09:34:41');
INSERT INTO `allwww_log` VALUES ('2897', '', '0', 'content', '', 'create_html', '?m=content&c=create_html&a=update_urls', '', '1', 'admin', '', '2017-11-28 09:34:59');
INSERT INTO `allwww_log` VALUES ('2898', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '', '2017-11-28 09:35:22');
INSERT INTO `allwww_log` VALUES ('2899', '', '0', 'search', '', 'search_type', '?m=search&c=search_type&a=add', '', '1', 'admin', '', '2017-11-28 09:35:24');
INSERT INTO `allwww_log` VALUES ('2900', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=setting', '', '1', 'admin', '', '2017-11-28 09:35:26');
INSERT INTO `allwww_log` VALUES ('2901', '', '0', 'search', '', 'search_admin', '?m=search&c=search_admin&a=createindex', '', '1', 'admin', '', '2017-11-28 09:35:32');
INSERT INTO `allwww_log` VALUES ('2902', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-12-21 15:19:01');
INSERT INTO `allwww_log` VALUES ('2903', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-12-21 15:19:07');
INSERT INTO `allwww_log` VALUES ('2904', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', 'admin', '', '2017-12-21 15:19:15');
INSERT INTO `allwww_log` VALUES ('2905', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:19:32');
INSERT INTO `allwww_log` VALUES ('2906', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:19:35');
INSERT INTO `allwww_log` VALUES ('2907', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:20:26');
INSERT INTO `allwww_log` VALUES ('2908', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:20:26');
INSERT INTO `allwww_log` VALUES ('2909', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:20:29');
INSERT INTO `allwww_log` VALUES ('2910', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:20:46');
INSERT INTO `allwww_log` VALUES ('2911', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:21:04');
INSERT INTO `allwww_log` VALUES ('2912', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:21:04');
INSERT INTO `allwww_log` VALUES ('2913', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:21:08');
INSERT INTO `allwww_log` VALUES ('2914', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '1', 'admin', '', '2017-12-21 15:21:19');
INSERT INTO `allwww_log` VALUES ('2915', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-12-21 15:21:54');
INSERT INTO `allwww_log` VALUES ('2916', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '', '2017-12-21 15:22:03');
INSERT INTO `allwww_log` VALUES ('2917', '', '0', 'admin', '', 'database', '?m=admin&c=database&a=export', '', '1', 'admin', '', '2017-12-21 15:22:59');
INSERT INTO `allwww_log` VALUES ('2918', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:23:12');
INSERT INTO `allwww_log` VALUES ('2919', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:23:15');
INSERT INTO `allwww_log` VALUES ('2920', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '', '2017-12-21 15:23:27');
INSERT INTO `allwww_log` VALUES ('2921', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '', '2017-12-21 15:23:29');
INSERT INTO `allwww_log` VALUES ('2922', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '', '2017-12-21 15:23:30');
INSERT INTO `allwww_log` VALUES ('2923', '', '0', 'member', '', 'member', '?m=member&c=member&a=add', '', '1', 'admin', '', '2017-12-21 15:23:51');
INSERT INTO `allwww_log` VALUES ('2924', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '', '2017-12-21 15:23:52');
INSERT INTO `allwww_log` VALUES ('2925', '', '0', 'member', '', 'member_group', '?m=member&c=member_group&a=manage', '', '1', 'admin', '', '2017-12-21 15:23:59');
INSERT INTO `allwww_log` VALUES ('2926', '', '0', 'member', '', 'member_verify', '?m=member&c=member_verify&a=manage', '', '1', 'admin', '', '2017-12-21 15:24:03');
INSERT INTO `allwww_log` VALUES ('2927', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '', '2017-12-21 15:24:05');
INSERT INTO `allwww_log` VALUES ('2928', '', '0', 'member', '', 'member', '?m=member&c=member&a=delete', '', '1', 'admin', '', '2017-12-21 15:24:11');
INSERT INTO `allwww_log` VALUES ('2929', '', '0', 'member', '', 'member', '?m=member&c=member&a=manage', '', '1', 'admin', '', '2017-12-21 15:24:12');
INSERT INTO `allwww_log` VALUES ('2930', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:25:36');
INSERT INTO `allwww_log` VALUES ('2931', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:25:39');
INSERT INTO `allwww_log` VALUES ('2932', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:26:44');
INSERT INTO `allwww_log` VALUES ('2933', '', '0', 'admin', '', 'menu', '?m=admin&c=menu&a=edit', '', '1', 'admin', '', '2017-12-21 15:26:47');
INSERT INTO `allwww_log` VALUES ('2934', '', '0', 'admin', '', 'site', '?m=admin&c=site&a=edit', '', '1', 'admin', '', '2017-12-21 15:27:26');
INSERT INTO `allwww_log` VALUES ('2935', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:27:36');
INSERT INTO `allwww_log` VALUES ('2936', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:32:36');
INSERT INTO `allwww_log` VALUES ('2937', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:33:24');
INSERT INTO `allwww_log` VALUES ('2938', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:34:03');
INSERT INTO `allwww_log` VALUES ('2939', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:34:35');
INSERT INTO `allwww_log` VALUES ('2940', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:34:58');
INSERT INTO `allwww_log` VALUES ('2941', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:35:24');
INSERT INTO `allwww_log` VALUES ('2942', '', '0', 'block', '', 'block_admin', '?m=block&c=block_admin&a=add', '', '1', 'admin', '', '2017-12-21 15:35:34');

-- ----------------------------
-- Table structure for allwww_member
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member`;
CREATE TABLE `allwww_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_member_detail
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member_detail`;
CREATE TABLE `allwww_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member_detail
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_member_group
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member_group`;
CREATE TABLE `allwww_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member_group
-- ----------------------------
INSERT INTO `allwww_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `allwww_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `allwww_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `allwww_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `allwww_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `allwww_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `allwww_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for allwww_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member_menu`;
CREATE TABLE `allwww_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member_menu
-- ----------------------------
INSERT INTO `allwww_member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `allwww_member_menu` VALUES ('2', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `allwww_member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

-- ----------------------------
-- Table structure for allwww_member_verify
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member_verify`;
CREATE TABLE `allwww_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_member_vip
-- ----------------------------
DROP TABLE IF EXISTS `allwww_member_vip`;
CREATE TABLE `allwww_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_menu
-- ----------------------------
DROP TABLE IF EXISTS `allwww_menu`;
CREATE TABLE `allwww_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1611 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_menu
-- ----------------------------
INSERT INTO `allwww_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '0', '0', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('32', 'posid_manage', '970', 'admin', 'position', 'init', '', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('29', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '4', '1', '0', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('54', 'admin_manage', '970', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('43', 'category_manage', '821', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('59', 'model_manage', '977', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('64', 'site_management', '970', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('812', 'member_group_manage', '55', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('813', 'member_model_manage', '55', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('857', 'attachment_manage', '977', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('896', 'pay', '29', 'pay', 'payment', 'pay_list', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('906', 'update_urls', '970', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('909', 'fulltext_search', '977', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('982', 'module_manage', '977', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('8', 'phpsso', '0', 'admin', 'phpsso', 'menu', '', '7', '0', '0', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '10', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `allwww_menu` VALUES ('1535', 'poster', '821', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1536', 'add_space', '1535', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1537', 'edit_space', '1535', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1538', 'del_space', '1535', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1539', 'poster_list', '1535', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1540', 'add_poster', '1535', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1541', 'edit_poster', '1535', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1542', 'del_poster', '1535', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1543', 'poster_stat', '1535', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1544', 'poster_setting', '1535', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1545', 'create_poster_js', '1535', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1546', 'poster_template', '1535', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1557', 'wap', '977', 'wap', 'wap_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1558', 'wap_add', '1557', 'wap', 'wap_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1559', 'wap_edit', '1557', 'wap', 'wap_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1560', 'wap_delete', '1557', 'wap', 'wap_admin', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1561', 'wap_type_manage', '1557', 'wap', 'wap_admin', 'type_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1562', 'wap_type_edit', '1557', 'wap', 'wap_admin', 'type_edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1563', 'wap_type_delete', '1557', 'wap', 'wap_admin', 'type_delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1577', 'cm_conf', '977', 'customfield', 'customfield', 'manage_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1578', 'cm_conf', '1577', 'customfield', 'customfield', 'manage_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1579', 'cm_cate', '1577', 'customfield', 'customfield', 'category_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1580', 'customfiled', '821', 'customfield', 'customfield', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1581', 'mobile', '821', 'mobile', 'mobile', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1582', 'mobile_add', '1581', 'mobile', 'mobile', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1583', 'mobile_edit', '1581', 'mobile', 'mobile', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1584', 'mobile_delete', '1581', 'mobile', 'mobile', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `allwww_menu` VALUES ('1585', 'cate_manage', '1581', 'mobile', 'mobile', 'cate_manage', '', '0', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for allwww_mobile
-- ----------------------------
DROP TABLE IF EXISTS `allwww_mobile`;
CREATE TABLE `allwww_mobile` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  `keywords` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_mobile
-- ----------------------------
INSERT INTO `allwww_mobile` VALUES ('1', '手机门户', '', '', '1', '', '');

-- ----------------------------
-- Table structure for allwww_mobile_cate
-- ----------------------------
DROP TABLE IF EXISTS `allwww_mobile_cate`;
CREATE TABLE `allwww_mobile_cate` (
  `catid` smallint(5) unsigned NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `catname` varchar(30) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL,
  `url` varchar(100) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_mobile_cate
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_model
-- ----------------------------
DROP TABLE IF EXISTS `allwww_model`;
CREATE TABLE `allwww_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_model
-- ----------------------------
INSERT INTO `allwww_model` VALUES ('1', '1', '文章模型', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `allwww_model` VALUES ('2', '1', '下载模型', '', 'download', '', '0', '0', '1', '1', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `allwww_model` VALUES ('3', '1', '图片模型', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `allwww_model` VALUES ('10', '1', '普通会员', '普通会员', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `allwww_model` VALUES ('11', '1', '视频模型', '', 'video', '', '0', '0', '1', '1', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for allwww_model_field
-- ----------------------------
DROP TABLE IF EXISTS `allwww_model_field`;
CREATE TABLE `allwww_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_model_field
-- ----------------------------
INSERT INTO `allwww_model_field` VALUES ('1', '1', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('2', '1', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('3', '1', '1', 'title', '标题', '', 'inputtitle', '1', '200', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('4', '1', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '9', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('5', '1', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '100', '', '', 'keyword', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('6', '1', '1', 'description', '摘要', '', '', '0', '600', '', '', 'textarea', '{\"width\":\"99\",\"height\":\"46\",\"defaultvalue\":\"\",\"enablehtml\":\"0\"}', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('7', '1', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('8', '1', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"500\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('9', '1', '1', 'voteid', '添加投票', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('10', '1', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('11', '1', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('12', '1', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('14', '1', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('15', '1', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('16', '1', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('17', '1', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('18', '1', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('19', '1', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('20', '1', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('21', '1', '1', 'copyfrom', '来源', '', '', '0', '80', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('80', '1', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('22', '2', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('23', '2', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('24', '2', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('25', '2', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '100', '', '', 'keyword', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('26', '2', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('27', '2', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('28', '2', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '1', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('29', '2', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('30', '2', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('31', '2', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('32', '2', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('33', '2', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('34', '2', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('36', '2', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('37', '2', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('38', '2', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('39', '2', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('40', '2', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('41', '2', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('42', '2', '1', 'downfiles', '本地下载', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('43', '2', '1', 'downfile', '镜像下载', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('44', '2', '1', 'systems', '软件平台', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('45', '2', '1', 'copytype', '软件授权形式', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('46', '2', '1', 'language', '软件语言', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('47', '2', '1', 'classtype', '软件类型', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('48', '2', '1', 'version', '版本号', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('49', '2', '1', 'filesize', '文件大小', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('50', '2', '1', 'stars', '评分等级', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('51', '3', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('52', '3', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('54', '3', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('55', '3', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('56', '3', '1', 'groupids_view', '阅读权限', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('57', '3', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('58', '3', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('59', '3', '1', 'relation', '相关组图', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('60', '3', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('61', '3', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"500\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('62', '3', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('63', '3', '1', 'description', '摘要', '', '', '0', '500', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('64', '3', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('65', '3', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '100', '', '', 'keyword', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('66', '3', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('67', '3', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('68', '3', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('69', '3', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('70', '3', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('71', '3', '1', 'pictureurls', '组图', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('72', '3', '1', 'copyfrom', '来源', '', '', '0', '0', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('73', '1', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('74', '2', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('75', '3', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('83', '10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '1', '0');
INSERT INTO `allwww_model_field` VALUES ('84', '11', '1', 'catid', '栏目', '', '', '1', '6', '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('85', '11', '1', 'typeid', '类别', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('86', '11', '1', 'title', '标题', '', 'inputtitle', '1', '80', '', '请输入标题', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('87', '11', '1', 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('88', '11', '1', 'description', '摘要', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('89', '11', '1', 'updatetime', '更新时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('90', '11', '1', 'content', '内容', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>', '', '0', '999999', '', '内容不能为空', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('91', '11', '1', 'thumb', '缩略图', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('92', '11', '1', 'relation', '相关文章', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('93', '11', '1', 'pages', '分页方式', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('94', '11', '1', 'inputtime', '发布时间', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('95', '11', '1', 'posids', '推荐位', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('96', '11', '1', 'groupids_view', '阅读权限', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('98', '11', '1', 'listorder', '排序', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('99', '11', '1', 'template', '内容页模板', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('100', '11', '1', 'allow_comment', '允许评论', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('101', '11', '1', 'status', '状态', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('102', '11', '1', 'readpoint', '阅读收费', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('103', '11', '1', 'username', '用户名', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('104', '11', '1', 'islink', '转向链接', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('105', '11', '1', 'video', '视频上传', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('106', '11', '1', 'vision', '画质', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `allwww_model_field` VALUES ('107', '11', '1', 'video_category', '视频分类', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');

-- ----------------------------
-- Table structure for allwww_module
-- ----------------------------
DROP TABLE IF EXISTS `allwww_module`;
CREATE TABLE `allwww_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_module
-- ----------------------------
INSERT INTO `allwww_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `allwww_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'enablcodecheck\' => \'0\',\n  \'mobile_checktype\' => \'0\',\n  \'user_sendsms_title\' => \'\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'0\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `allwww_module` VALUES ('poster', '广告模块', 'poster/', '0', '1.0', '广告模块', 'array (\n  \'enablehits\' => \'0\',\n  \'ext\' => \'\',\n  \'maxsize\' => \'\',\n)', '0', '0', '2014-05-06', '2014-05-06');
INSERT INTO `allwww_module` VALUES ('wap', '手机门户', 'wap/', '0', '1.0', '手机门户', '', '0', '0', '2014-05-06', '2014-05-06');
INSERT INTO `allwww_module` VALUES ('customfield', '自定义变量', 'customfield/', '0', '1.0', 'frontLon', '', '0', '0', '2015-08-01', '2015-08-01');
INSERT INTO `allwww_module` VALUES ('mobile', '手机模块', 'mobile/', '0', '1.0', '手机模块', '', '0', '0', '2016-09-19', '2016-09-19');

-- ----------------------------
-- Table structure for allwww_news
-- ----------------------------
DROP TABLE IF EXISTS `allwww_news`;
CREATE TABLE `allwww_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_news
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_news_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_news_data`;
CREATE TABLE `allwww_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(80) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_news_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_page
-- ----------------------------
DROP TABLE IF EXISTS `allwww_page`;
CREATE TABLE `allwww_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_page
-- ----------------------------
INSERT INTO `allwww_page` VALUES ('3', '1', ';', 'http://localhost/uploadfile/2014/0506/20140506054249396.jpg', '1', '1', '', '0');

-- ----------------------------
-- Table structure for allwww_pay_account
-- ----------------------------
DROP TABLE IF EXISTS `allwww_pay_account`;
CREATE TABLE `allwww_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `allwww_pay_payment`;
CREATE TABLE `allwww_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_pay_spend
-- ----------------------------
DROP TABLE IF EXISTS `allwww_pay_spend`;
CREATE TABLE `allwww_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_picture
-- ----------------------------
DROP TABLE IF EXISTS `allwww_picture`;
CREATE TABLE `allwww_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` varchar(100) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_picture
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_picture_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_picture_data`;
CREATE TABLE `allwww_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_picture_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_position
-- ----------------------------
DROP TABLE IF EXISTS `allwww_position`;
CREATE TABLE `allwww_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_position
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_position_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_position_data`;
CREATE TABLE `allwww_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `inputtime` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_poster
-- ----------------------------
DROP TABLE IF EXISTS `allwww_poster`;
CREATE TABLE `allwww_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_poster
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_poster_space
-- ----------------------------
DROP TABLE IF EXISTS `allwww_poster_space`;
CREATE TABLE `allwww_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_poster_space
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_queue
-- ----------------------------
DROP TABLE IF EXISTS `allwww_queue`;
CREATE TABLE `allwww_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_queue
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_release_point
-- ----------------------------
DROP TABLE IF EXISTS `allwww_release_point`;
CREATE TABLE `allwww_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_search
-- ----------------------------
DROP TABLE IF EXISTS `allwww_search`;
CREATE TABLE `allwww_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `catid` int(5) NOT NULL,
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_search
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_search_keyword
-- ----------------------------
DROP TABLE IF EXISTS `allwww_search_keyword`;
CREATE TABLE `allwww_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_session
-- ----------------------------
DROP TABLE IF EXISTS `allwww_session`;
CREATE TABLE `allwww_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_session
-- ----------------------------
INSERT INTO `allwww_session` VALUES ('kug22d2pfs785acm1t520lmrq1', '1', '', '1513841758', '1', '0', 'customfield', 'customfield', 'init', 'supadmin|i:1;userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"9YgU0e\";lock_screen|i:0;right_enter|i:0;');

-- ----------------------------
-- Table structure for allwww_site
-- ----------------------------
DROP TABLE IF EXISTS `allwww_site`;
CREATE TABLE `allwww_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `iimage` char(255) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `taocan` tinyint(1) DEFAULT '0',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  `sy_date` char(255) DEFAULT '',
  `isshiyong` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_site
-- ----------------------------
INSERT INTO `allwww_site` VALUES ('1', '凡高网络后台管理系统', '', '', 'http://localhost/', '0', '凡高网络后台管理系统', '凡高网络 后台 管理系统 后台管理系统', '凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统凡高网络后台管理系统', '', 'default', 'default', '{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"10\"}', '2c63f97b-d4fa-11e3-8d48-001fc6c932f3', '2017/03/30', '0');

-- ----------------------------
-- Table structure for allwww_special
-- ----------------------------
DROP TABLE IF EXISTS `allwww_special`;
CREATE TABLE `allwww_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_special
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_special_content
-- ----------------------------
DROP TABLE IF EXISTS `allwww_special_content`;
CREATE TABLE `allwww_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_special_c_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_special_c_data`;
CREATE TABLE `allwww_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_sphinx_counter
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sphinx_counter`;
CREATE TABLE `allwww_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_sso_admin
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_admin`;
CREATE TABLE `allwww_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_admin
-- ----------------------------
INSERT INTO `allwww_sso_admin` VALUES ('1', 'admin', '8dd8bc7a18f990c242e3d0433f2e5155', 'mXZBCv', '1', '1513840945', '');

-- ----------------------------
-- Table structure for allwww_sso_applications
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_applications`;
CREATE TABLE `allwww_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_applications
-- ----------------------------
INSERT INTO `allwww_sso_applications` VALUES ('2', 'phpcms_v9', 'v9', 'http://localhost/', 'qvk8k58zocjtk73o6jhr19a37hw6ttmo', '', 'api.php?op=phpsso', 'utf-8', '1');

-- ----------------------------
-- Table structure for allwww_sso_members
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_members`;
CREATE TABLE `allwww_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_members
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_sso_messagequeue
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_messagequeue`;
CREATE TABLE `allwww_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_messagequeue
-- ----------------------------
INSERT INTO `allwww_sso_messagequeue` VALUES ('1', 'member_add', '0', '1', '{\"username\":\"188991519\",\"password\":\"b19a0877ff510e7bc36b6826da431e7b\",\"email\":\"82321006@qq.com\",\"regip\":\"\",\"regdate\":\"1513841031\",\"lastdate\":\"1513841031\",\"appname\":\"\",\"type\":\"app\",\"random\":\"jAvBNV\",\"ucuserid\":\"0\",\"uid\":\"1\",\"action\":\"member_add\"}', '1513841031', '{\"2\":0}');
INSERT INTO `allwww_sso_messagequeue` VALUES ('2', 'member_delete', '0', '1', '{\"uids\":{\"0\":\"1\"},\"action\":\"member_delete\"}', '1513841051', '{\"2\":1}');

-- ----------------------------
-- Table structure for allwww_sso_session
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_session`;
CREATE TABLE `allwww_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_session
-- ----------------------------
INSERT INTO `allwww_sso_session` VALUES ('kug22d2pfs785acm1t520lmrq1', '0', 'ip', '1513840945', '0', '0', 'admin', 'login', 'a', 'code|s:4:\"uetu\";');

-- ----------------------------
-- Table structure for allwww_sso_settings
-- ----------------------------
DROP TABLE IF EXISTS `allwww_sso_settings`;
CREATE TABLE `allwww_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_sso_settings
-- ----------------------------
INSERT INTO `allwww_sso_settings` VALUES ('denyemail', '');
INSERT INTO `allwww_sso_settings` VALUES ('denyusername', '');
INSERT INTO `allwww_sso_settings` VALUES ('creditrate', '');
INSERT INTO `allwww_sso_settings` VALUES ('sp4', '');
INSERT INTO `allwww_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for allwww_template_bak
-- ----------------------------
DROP TABLE IF EXISTS `allwww_template_bak`;
CREATE TABLE `allwww_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_times
-- ----------------------------
DROP TABLE IF EXISTS `allwww_times`;
CREATE TABLE `allwww_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_times
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_type
-- ----------------------------
DROP TABLE IF EXISTS `allwww_type`;
CREATE TABLE `allwww_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_type
-- ----------------------------
INSERT INTO `allwww_type` VALUES ('52', '1', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `allwww_type` VALUES ('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `allwww_type` VALUES ('2', '1', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `allwww_type` VALUES ('3', '1', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');

-- ----------------------------
-- Table structure for allwww_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `allwww_urlrule`;
CREATE TABLE `allwww_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_urlrule
-- ----------------------------
INSERT INTO `allwww_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `allwww_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `allwww_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `allwww_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `allwww_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `allwww_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `allwww_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `allwww_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');
INSERT INTO `allwww_urlrule` VALUES ('31', 'content', 'category', '0', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html', 'news/china/index.html');
INSERT INTO `allwww_urlrule` VALUES ('32', 'content', 'show', '0', '{$categorydir}{$catdir}/{$id}.html|{$categorydir}{$catdir}/{$id}_{$page}.html', 'news/china/1000.html');

-- ----------------------------
-- Table structure for allwww_video
-- ----------------------------
DROP TABLE IF EXISTS `allwww_video`;
CREATE TABLE `allwww_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_video
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_video_data
-- ----------------------------
DROP TABLE IF EXISTS `allwww_video_data`;
CREATE TABLE `allwww_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_video_data
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_wap
-- ----------------------------
DROP TABLE IF EXISTS `allwww_wap`;
CREATE TABLE `allwww_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_wap
-- ----------------------------
INSERT INTO `allwww_wap` VALUES ('1', '网站触屏版', '/statics/images/wap/wlogo.gif', '', 'array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n  \'hotwords\' => \'\',\n)', '0');

-- ----------------------------
-- Table structure for allwww_wap_type
-- ----------------------------
DROP TABLE IF EXISTS `allwww_wap_type`;
CREATE TABLE `allwww_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_wap_type
-- ----------------------------

-- ----------------------------
-- Table structure for allwww_workflow
-- ----------------------------
DROP TABLE IF EXISTS `allwww_workflow`;
CREATE TABLE `allwww_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allwww_workflow
-- ----------------------------
INSERT INTO `allwww_workflow` VALUES ('1', '1', '1', '一级审核', '审核一次', '', '0');
INSERT INTO `allwww_workflow` VALUES ('2', '1', '2', '二级审核', '审核两次', '', '0');
INSERT INTO `allwww_workflow` VALUES ('3', '1', '3', '三级审核', '审核三次', '', '0');
INSERT INTO `allwww_workflow` VALUES ('4', '1', '4', '四级审核', '四级审核', '', '0');

CREATE TABLE `phpcms_customfield` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `phpcms_customfield` VALUES ('2', '0', '1', '联系方式', '', '', 'array (\n  \'status\' => \'1\',\n)', '0');
INSERT INTO `phpcms_customfield` VALUES ('7', '2', '1', '电话', 'contact_mob', '13312341234', 'array (\n  \'status\' => \'1\',\n  \'textarea\' => \'0\',\n)', '0');
INSERT INTO `phpcms_customfield` VALUES ('9', '2', '1', 'QQ', 'contact_qq', '123456789', 'array (\n  \'status\' => \'1\',\n  \'textarea\' => \'0\',\n)', '0');


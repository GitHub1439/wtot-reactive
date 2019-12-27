DROP TABLE IF EXISTS `phpcms_iplog`;
CREATE TABLE IF NOT EXISTS `phpcms_iplog` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `modelid` int(5) unsigned NOT NULL,
  `arid` mediumint(8) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL,
  `updatetime` int(10) unsigned,
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

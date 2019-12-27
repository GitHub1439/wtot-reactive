DROP TABLE IF EXISTS `phpcms_performance`;
CREATE TABLE IF NOT EXISTS `phpcms_performance` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `modelid` int(5) unsigned NOT NULL,
  `arid` mediumint(8) unsigned NOT NULL,
  `title` varchar(70),
  `url` char(100),
  `ips` int(10) unsigned,
  `pvs` int(10) unsigned,
  `username` varchar(64),
  `realname` varchar(64),
  `updatetime` int(10) unsigned,
  PRIMARY KEY (`id`)
) TYPE=MyISAM;

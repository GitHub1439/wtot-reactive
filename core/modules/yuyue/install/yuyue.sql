DROP TABLE IF EXISTS `phpcms_yuyue`;

CREATE TABLE IF NOT EXISTS `phpcms_yuyue` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `beizhu` varchar(255) NOT NULL,
  `ischeck` tinyint(1) NOT NULL DEFAULT '1',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;




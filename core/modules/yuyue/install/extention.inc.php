<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');
$parentid = $menu_db->insert(array('name'=>'在线预约', 'parentid'=>821, 'm'=>'yuyue', 'c'=>'yuyue', 'a'=>'list_yuyue', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);

?>
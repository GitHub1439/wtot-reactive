<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');

$parentid = $menu_db->insert(array('name'=>'performance', 'parentid'=>'10', 'm'=>'performance', 'c'=>'performance', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'),true);
$second_pid = $menu_db->insert(array('name'=>'init', 'parentid'=>$parentid, 'm'=>'performance', 'c'=>'performance', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'),true);
$menu_db->insert(array('name'=>'plist', 'parentid'=>$second_pid, 'm'=>'performance', 'c'=>'performance', 'a'=>'plist', 'data'=>'', 'listorder'=>1, 'display'=>'1'),true);

$language = array('performance'=>'绩效统计','init'=>'绩效管理','plist'=>'详细列表');
?>


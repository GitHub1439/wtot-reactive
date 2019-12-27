<?php
defined('IN_PHPCMS') or exit('Access Denied');
defined('INSTALL') or exit('Access Denied');
$parentid = $menu_db->insert(array('name'=>'kefu', 'parentid'=>821, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'init', 'data'=>'', 'listorder'=>0, 'display'=>'1'), true);
$menu_db->insert(array('name'=>'add_kefu', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'add', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'edit_kefu', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'edit', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'delete_kefu', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'delete', 'data'=>'', 'listorder'=>0, 'display'=>'0'));
$menu_db->insert(array('name'=>'link_setting', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'setting', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'add_type', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'add_type', 'data'=>'', 'listorder'=>0, 'display'=>'1'));
$menu_db->insert(array('name'=>'list_type', 'parentid'=>$parentid, 'm'=>'kefu', 'c'=>'kefu', 'a'=>'list_type', 'data'=>'', 'listorder'=>0, 'display'=>'1'));

$link_db = pc_base::load_model('link_model');

$language = array('kefu'=>'在线客服', 'add_link'=>'添加客服', 'edit_link'=>'编辑客服', 'delete_link'=>'删除客服', 'link_setting'=>'模块配置', 'add_type'=>'添加类别', 'list_type'=>'分类管理');
?>
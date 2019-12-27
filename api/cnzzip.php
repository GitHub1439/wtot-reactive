<?php
/**
 * BY 杨飞 2017/5/19
 **/
defined('IN_PHPCMS') or exit ('No permission resources.');


/**
 * iplog更新
 **/
//检查在一天时间内IP是否重复
$db_ip = '';
$db = '';
$db_ip = pc_base::load_model('cnzzip_model');
$db = pc_base::load_model('cnzzip_conut_model');
$ip = ip();

//清理昨日IP
// $days = '';
// $daysU = '';
// $days = date('Ymd', SYS_TIME);
// $daysU = strtotime($days);
$yesterday = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
$db_ip->delete($where="updatetime<$yesterday");
cnzz_byip($ip);

function cnzz_byip($ip){
    global $db,$ip,$db_ip;
    $d = date('j', SYS_TIME);
    $h = date('H', SYS_TIME);
    $r_ip = $db_ip->get_one(array('ip'=>$ip,'d'=>$d));
    //如果IP不存在，创建ip并更新pvs和ips。如果IP存在则只更新pvs。
    if(empty($r_ip)){
        $arr_ip = array('id'=>null,'ip'=>$ip,'updatetime'=>SYS_TIME,'ips'=>1,'pvs'=>1,'h'=>$h,'d'=>$d);
        $db_ip->insert($arr_ip);
        $db->update(array('pvs'=>'+=1','ips'=>'+=1'),array('id'=>1));
    }else{
       $h_ip = $db_ip->get_one(array('ip'=>$ip,'d'=>$d,'h'=>$h));
       if (empty($h_ip)) {
            $arr_ip = array('id'=>null,'ip'=>$ip,'updatetime'=>SYS_TIME,'ips'=>1,'pvs'=>1,'h'=>$h,'d'=>$d);
            $db_ip->insert($arr_ip);
            $db->update(array('pvs'=>'+=1'),array('id'=>1));
       }else{
            $pvs = $h_ip['pvs']+1;
            $db_ip->update(array('pvs'=>$pvs,'updatetime'=>SYS_TIME),array('id'=>$h_ip['id']));
            $db->update(array('pvs'=>'+=1'),array('id'=>1));
       }
    }
}


?>


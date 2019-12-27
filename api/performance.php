<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_PHPCMS') or exit ('No permission resources.');
/**
 * IP/PV统计
 **/
$db = '';
$modelid = '';
$arid = '';
$db = pc_base::load_model('performance_model');
$modelid =  isset($_GET['modelid']) ? intval($_GET['modelid']) : "0";;
$arid =  isset($_GET['id']) ? intval($_GET['id']) : "0";
/**
 * iplog更新
 **/
//检查在一天时间内IP是否重复
$db_ip = '';
$db_ip = pc_base::load_model('iplog_model');
$ip = '';
$ip = ip();

//清理昨日IP
$days = '';
$daysU = '';
$days = date('Ymd', SYS_TIME);
$daysU = strtotime($days);

cnzz_byip($ip);

//$db_ip->delete($where="updatetime<$daysU");

//ippv($arid,$modelid);

/**
 * IP,PV统计
 **/
function ippv($arid,$modelid){
    global $db,$ip,$db_ip;
    $db_con = '';
    $db_con = pc_base::load_model('content_model');
    $db_admin = '';
    $db_admin = pc_base::load_model('admin_model');
    $model = array();
    $model = getcache('model', 'commons');
    $db_con->table_name = $db_con->db_tablepre.$model[$modelid]['tablename'];
    $r_con = $db_con->get_one(array('id'=>$arid));
    $r = $db->get_one(array('arid'=>$arid));
    $r_adm = $db_admin->get_one(array('username'=>$r_con['username']));
    //根据年月日周
    //没有数据创建数据，有数据更新数据。
    $r_ip = $db_ip->get_one(array('arid'=>$arid,'ip'=>$ip));
    //如果IP不存在，创建ip并更新pvs和ips。如果IP存在则只更新pvs。
    if(empty($r_ip)){
        $arr_ip = array('id'=>null,'modelid'=>$modelid,'arid'=>$arid,'ip'=>$ip,'updatetime'=>SYS_TIME);
        $db_ip->insert($arr_ip);
        if(empty($r)){
            $arr = array('id'=>null,'modelid'=>$modelid,'arid'=>$arid,'title'=>$r_con['title'],'url'=>$r_con['url'],'ips'=>1,'pvs'=>1,'username'=>$r_con['username'],'realname'=>$r_adm['realname'],'updatetime'=>$r_con['inputtime']);
            return $db->insert($arr);
        }else{
            $pvs = $r['pvs']+1;
            $ips = $r['ips']+1;
            return $db->update(array('pvs'=>$pvs,'ips'=>$ips),array('arid'=>$arid));
        }
    }else{
        $pvs = $r['pvs']+1;
        return $db->update(array('pvs'=>$pvs),array('arid'=>$arid));
    }
}


function cnzz_byip($ip){
    global $ip,$db_ip;
    $r_ip = $db_ip->get_one(array('ip'=>$ip));
    //如果IP不存在，创建ip并更新pvs和ips。如果IP存在则只更新pvs。
    if(empty($r_ip)){
        $arr_ip = array('id'=>null,'modelid'=>'','arid'=>'','ip'=>$ip,'updatetime'=>SYS_TIME,'ips'=>1,'pvs'=>1);
        $db_ip->insert($arr_ip);
    }else{
        $pvs = $r_ip['pvs']+1;
        return $db_ip->update(array('pvs'=>$pvs),array('id'=>$r_ip['id']));
    }
}

?>


<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('admin','admin',0);
pc_base::load_sys_class('form','',0);
pc_base::load_sys_class('format','',0);
pc_base::load_app_func('global');
class performance extends admin {
    
    function __construct() {
        parent::__construct();//调用父类的构造函数
        $this->db = pc_base::load_model('performance_model');
        $this->db_con = pc_base::load_model('content_model');
        $this->db_adm = pc_base::load_model('admin_model');
    }

    //绩效默认方法，获取当日IP，PV以及文章数
    public function init(){
        require ('setting.php');
        $alladm = $this->db_adm->select("`roleid` NOT IN ($roleid)",$data = 'username,realname');//获取所有管理员
        if(isset($_POST['username']) && $_POST['username']){
            $username = $_POST['username'];
            $where .= "username = '$username' AND";
        }
        if(isset($_POST['start_time']) && $_POST['start_time'] && isset($_POST['end_time']) && $_POST['end_time']){
            $startTime = strtotime($_POST['start_time']);
            $endTime = strtotime($_POST['end_time']);
            $where .="(updatetime between $startTime and $endTime)";
        }else{
            $startTime = strtotime(date('Y-m-d 00:00:00', SYS_TIME));
            $endTime = strtotime(date('Y-m-d 0:0:0',strtotime('+1 day')));
            $where .="(updatetime between $startTime and $endTime)";
        }
        if(isset($_POST['listorder']) && $_POST['listorder']){
            $listorder = $_POST['listorder'];
            $order .="$listorder desc";
        }else{
            $listorder = $_POST['listorder'];
            $order .="ac desc";
        }

        $data = $this->db->select($where,$data="`username`,`realname`,sum(`pvs`) pvs,sum(`ips`) ips,count(`id`) ac",$limit,$order,$group = "username");
        include $this->admin_tpl('index');

    }

    //获取详细列表  
    public function plist(){
        require ('setting.php');
        $alladm = $this->db_adm->select("`roleid` NOT IN ($roleid)",$data = 'username,realname');//获取所有管理员
        if(isset($_GET['username']) && $_GET['username']){
            $username = $_GET['username'];
            $where .= "username = '$username' AND";
        }
        if(isset($_GET['start_time']) && $_GET['start_time'] && isset($_GET['end_time']) && $_GET['end_time']){
            $startTime = strtotime($_GET['start_time']);
            $endTime = strtotime($_GET['end_time']);
            $where .="(updatetime between $startTime and $endTime)";
        }else{
            $startTime = strtotime(date('Y-m-d 00:00:00', SYS_TIME));
            $endTime = strtotime(date('Y-m-d 0:0:0',strtotime('+1 day')));
            $where .="(updatetime between $startTime and $endTime)";
        }
        if(isset($_GET['listorder']) && $_GET['listorder']){
            $listorder = $_GET['listorder'];
            $order .="$listorder desc";
        }else{
            $listorder = $_GET['listorder'];
            $order .="pvs desc";
        }
        
        $data = $this->db->listinfo($where,$order,$_GET['page']); 
        $pages = $this->db->pages;
        include $this->admin_tpl('plist');
    }
}
?>

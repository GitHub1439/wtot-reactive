<?php
	//网站前台管理预约控制器:
	defined('IN_PHPCMS') or exit('No permission resources.');
	//index控制器
	class index {
		//构造函数
		function __construct() {
			pc_base::load_app_func('global');
				$siteid = isset($_GET['siteid']) ? intval($_GET['siteid']) : get_siteid();
  		        define("SITEID",$siteid);
			
		}
		//显示在线预约模版
		public function init() {
		
				include template('yuyue', 'index');
		}
		//保存在线预约提交数据
		public function register() { 
 		
 		if(isset($_POST['dosubmit'])){
 			if($_POST['username']==""){
 				showmessage(L('用户名不能为空'),HTTP_REFERER);
				exit();
 			}
			
			if($_POST['mobile']=="" || !preg_match('/^(1)[0-9]{10}$/', $_POST['mobile'])){
 				showmessage(L('用户手机号不能为空或者格式不正确'),HTTP_REFERER);
				exit();
 			}	
			
 			if($_POST['useremail']=="" || !preg_match('/^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$/', $_POST['useremail'])){
 				showmessage(L('用户邮箱不能为空或者格式不正确'),HTTP_REFERER);
				exit();
 			}	
			if($_POST['beizhu']==""){
 				showmessage(L('信息备注不能为空'),HTTP_REFERER);
				exit();
 			}
		
		
 			$yuyue_db = pc_base::load_model(yuyue_model);	
			
			$username = safe_replace(strip_tags($_POST['username']));
			$mobile = safe_replace(strip_tags($_POST['mobile']));
			$useremail = safe_replace(strip_tags($_POST['useremail']));
			$beizhu = safe_replace(strip_tags($_POST['beizhu']));
			$createtime = time();
						
 			$sql = array('username'=>$username,'mobile'=>$mobile,'useremail'=>$useremail,'beizhu'=>$beizhu,'createtime'=>$createtime);		
			
 			
 			$result = $yuyue_db->insert($sql);
			
			if ($result) {
					showmessage(L('在线预约成功！'),HTTP_REFERER);
					exit();
			}else {
					showmessage(L('在线预约失败！'),HTTP_REFERER);
					exit();
			}
 		
 		} else {
  				showmessage(L('请重新提交在线预约表单数据！'),HTTP_REFERER);
				exit();
 		}
	} 
	
	
	}
?>
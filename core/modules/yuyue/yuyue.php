<?php
	//网站后台管理预约控制器:
	defined('IN_PHPCMS') or exit('No permission resources.');
	//加载网站后台操作权限类:
		pc_base::load_app_class('admin','admin',0);
	//yuyue后台控制器:
class yuyue extends admin{
		//yuyue构造函数：
			function __construct() {
				
				$this->db = pc_base::load_model('yuyue_model');
			}	
		
		/**
		*显示在线预约数据列表：
		*/
		
		public function list_yuyue() {
				
				$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
				$infos = $this->db->listinfo($where = '', $order = 'createtime DESC',$page, $pages = '10');		
				$pages = $this->db->pages;
				//print_r($infos);
				//echo $pages;
				include $this->admin_tpl('list_yuyue');
			
		}
		
		
		/**
		*在线预约审核状态：
		*/
		public function check_yuyue() {
			
			if((!isset($_GET['userid']) || empty($_GET['userid'])) && (!isset($_POST['userid']) || empty($_POST['userid']))) {
			showmessage(L('illegal_parameters'), HTTP_REFERER);
		     } else { 		
						$userid = intval($_GET['userid']);
						if($userid < 1) return false;
						//更新在线预约审核状态
						$result = $this->db->update(array('ischeck'=>2),array('userid'=>$userid));
						if($result){
							showmessage(L('在线预约记录审核成功！'),'?m=yuyue&c=yuyue&a=list_yuyue');
						}else {
							showmessage(L("在线预约记录审核失败！"),'?m=yuyue&c=yuyue&a=list_yuyue');
						}		 
			}			
}
		
		
		/**
		*修改在线预约数据：
		*/
		public function edit_yuyue() {
		
			if(isset($_POST['dosubmit'])) {
		
						$userid = intval($_POST['userid']);
						if ($userid <1) {
								showmessage(L('用户ID不合法！'), HTTP_REFERER); 	
								exit();
						}
						
						if((!$_POST['yuyue']['username']) || empty($_POST['yuyue']['username'])) {
									showmessage(L('用户名不能为空！'), HTTP_REFERER); 	
								exit();
						}
						
						if((!$_POST['yuyue']['mobile']) || empty($_POST['yuyue']['mobile'])) {
									showmessage(L('用户手机号不能为空！'), HTTP_REFERER); 	
								exit();
						}
						
						if((!$_POST['yuyue']['useremail']) || empty($_POST['yuyue']['useremail'])) {
									showmessage(L('用户名不能为空！'), HTTP_REFERER); 	
								exit();
						}
						
						if((!$_POST['yuyue']['beizhu']) || empty($_POST['yuyue']['beizhu'])) {
									rshowmessage(L('信息备注不能为空！'), HTTP_REFERER); 	
								exit();
						}
						
						if((!$_POST['yuyue']['ischeck']) || empty($_POST['yuyue']['ischeck'])) {
									showmessage(L('审核状态不能为空！'), HTTP_REFERER); 	
								exit();
						}
						
						$this->db->update($_POST['yuyue'],array('userid'=>$userid));
						
						showmessage(L('在线预约数据编辑成功！'),'?m=yuyue&c=yuyue&a=list_yuyue');
						exit();
				
			}else {
				
						$info = $this->db->get_one(array('userid'=>$_GET['userid']));
							
						if(!$info)  showmessage(L('在线预约数据无记录！'), HTTP_REFERER); 	
						extract($info);
						
						include $this->admin_tpl('edit_yuyue');
						
						
			}
}
		
		/**
		*删除在线预约数据：
		*/
		public function delete_yuyue() {
		
					if((!isset($_GET['userid']) || empty($_GET['userid'])) && (!isset($_POST['userid']) || empty($_POST['userid']))) {
			
					showmessage(L('在线预约用户ID错误！'), HTTP_REFERER);
						exit();
			
			
					} else {
			
							$userid = intval($_GET['userid']);
							
							if($userid < 1) return false;
							$result = $this->db->delete(array('userid'=>$userid));
							if($result){
								showmessage(L('在线预约记录删除成功！'),HTTP_REFERER);
									exit();
							}else {
								showmessage(L("在线预约记录删除失败！"),HTTP_REFERER);
									exit();
							}	
					}				
				
		}

}
	
?>
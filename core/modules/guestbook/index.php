<?php

defined('IN_PHPCMS') or exit('No permission resources.');

pc_base::load_sys_class('form', '', 0);

class index {

	function __construct() {

		pc_base::load_app_func('global');

		$siteid = isset($_GET['siteid']) ? intval($_GET['siteid']) : get_siteid();

		$this->db = pc_base::load_model('guestbook_model');

  		define("SITEID",$siteid);

	}



	private function _session_start() {

		$session_storage = 'session_'.pc_base::load_config('system','session_storage');

		pc_base::load_sys_class($session_storage);

	}

	public function checkcode() {

			$this->_session_start();

			echo json_encode(array('status'=>(int)($_SESSION["code"] == $_POST['code'])));
			exit;

	}

	

	public function init() {

		$siteid = SITEID; 

 		$setting = getcache('guestbook', 'commons');

		$SEO = seo(SITEID, '', L('guestbook'), '', '');

		include template('guestbook', 'index');

	}

	/*	public function init() {

		if($_GET['typeid']!=''){

			$where = array('typeid'=>$_GET['typeid'],'siteid'=>$this->get_siteid());

		}else{

			$where = array('siteid'=>$this->get_siteid());

		}

 		$page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;

		$infos = $this->db->listinfo($where,$order = 'listorder DESC,guestid DESC',$page, $pages = '1');

		$pages = $this->db->pages;

		$types = $this->db2->listinfo(array('module'=>ROUTE_M,'siteid'=>$this->get_siteid()),$order = 'typeid DESC');

		$types = new_html_special_chars($types);

 		$type_arr = array ();

 		foreach($types as $typeid=>$type){

			$type_arr[$type['typeid']] = $type['name'];

		}

		include $this->admin_tpl('guestbook_list');

	}*/

	

	 /**

	 *	留言板列表页

	 */

	public function list_type() {

		$siteid = SITEID;

  		$type_id = trim(urldecode($_GET['type_id']));

		$type_id = intval($type_id);

  		if($type_id==""){

 			$type_id ='0';

 		}

   		$setting = getcache('guestbook', 'commons');

		$SEO = seo(SITEID, '', L('guestbook'), '', '');

  		include template('guestbook', 'list_type');

	} 

 	

	 /**

	 *	留言板留言 

	 */

	public function register_code() { 

 		$siteid = SITEID;

 		if(isset($_POST['dosubmit'])){



 			$this->_session_start();

			$code = isset($_POST['code']) && trim($_POST['code']) ? trim($_POST['code']) : showmessage(L('input_code'), HTTP_REFERER);

			if ($_SESSION['code'] != strtolower($code)) {

					showmessage(L('code_error'), HTTP_REFERER);

			}







 			if($_POST['name']==""){

 				showmessage(L('usename_noempty'),HTTP_REFERER);

 			}

 			//if($_POST['lxqq']==""){

// 				showmessage(L('email_not_empty'),"?m=guestbook&c=index&a=register&siteid=$siteid");

// 			}

// 			if($_POST['email']==""){

// 				showmessage(L('email_not_empty'),"?m=guestbook&c=index&a=register&siteid=$siteid");

// 			}

           

			if($_POST['shouji']==""){

 				showmessage(L('shouji_not_empty'),HTTP_REFERER);

 			}

 			$guestbook_db = pc_base::load_model(guestbook_model);

 		

			 /*添加用户数据*/

 			$sql = array('siteid'=>$siteid,'typeid'=>$_POST['typeid'],'name'=>$_POST['name'],'sex'=>$_POST['sex'],'lxqq'=>$_POST['lxqq'],'email'=>$_POST['email'],'shouji'=>$_POST['shouji'],'introduce'=>$_POST['introduce'],'addtime'=>time());

 			 

 			$guestbook_db->insert($sql);

 			showmessage(L('add_success'), HTTP_REFERER);

 		}else {

  			$setting = getcache('guestbook', 'commons');

 			if($setting[$siteid]['is_post']=='0'){

 				showmessage(L('suspend_application'), HTTP_REFERER);

 			}

 			$this->type = pc_base::load_model('type_model');

 			$types = $this->type->get_types($siteid);//获取站点下所有留言板分类

 			pc_base::load_sys_class('form', '', 0);

 			$setting = getcache('guestbook', 'commons');

 			$SEO = seo(SITEID, '', L('application_guestbook'), '', '');

   			include template('guestbook', 'register');

 		}

	} 



		public function register() { 

 		$siteid = SITEID;

 		if(isset($_POST['dosubmit'])){



 			if($_POST['name']==""){

 				showmessage(L('usename_noempty'),HTTP_REFERER);

 			}

 			//if($_POST['lxqq']==""){

// 				showmessage(L('email_not_empty'),"?m=guestbook&c=index&a=register&siteid=$siteid");

// 			}

// 			if($_POST['email']==""){

// 				showmessage(L('email_not_empty'),"?m=guestbook&c=index&a=register&siteid=$siteid");

// 			}

           

			if($_POST['shouji']==""){

 				showmessage(L('shouji_not_empty'),HTTP_REFERER);

 			}

 			$guestbook_db = pc_base::load_model(guestbook_model);

 		

			 /*添加用户数据*/

 			$sql = array('siteid'=>$siteid,'typeid'=>$_POST['typeid'],'name'=>$_POST['name'],'sex'=>$_POST['sex'],'lxqq'=>$_POST['lxqq'],'email'=>$_POST['email'],'shouji'=>$_POST['shouji'],'introduce'=>$_POST['introduce'],'addtime'=>time());

 			 

 			$guestbook_db->insert($sql);

 			showmessage(L('add_success'), HTTP_REFERER);

 		}else {

  			$setting = getcache('guestbook', 'commons');

 			if($setting[$siteid]['is_post']=='0'){

 				showmessage(L('suspend_application'), HTTP_REFERER);

 			}

 			$this->type = pc_base::load_model('type_model');

 			$types = $this->type->get_types($siteid);//获取站点下所有留言板分类

 			pc_base::load_sys_class('form', '', 0);

 			$setting = getcache('guestbook', 'commons');

 			$SEO = seo(SITEID, '', L('application_guestbook'), '', '');

   			include template('guestbook', 'register');

 		}

	} 

	

}

?>




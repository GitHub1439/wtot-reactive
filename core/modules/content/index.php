<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型缓存路径
define('CACHE_MODEL_PATH',CACHE_PATH.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
pc_base::load_sys_class('form', '', 0);
pc_base::load_app_func('util','content');
class index {
	private $db;
	function __construct() {
		$this->db = pc_base::load_model('content_model');
		$this->_userid = param::get_cookie('_userid');
		$this->_username = param::get_cookie('_username');
		$this->_groupid = param::get_cookie('_groupid');
		//手机模块配置
		$this->siteid = isset($_GET['siteid']) && (intval($_GET['siteid']) > 0) ? intval(trim($_GET['siteid'])) : (param::get_cookie('siteid') ? param::get_cookie('siteid') : 1);
		$this->wap_site = getcache('wap_site','wap');
		$this->types = getcache('wap_type','wap');
		$this->wap = $this->wap_site[$this->siteid];
	}
	private function _session_start() {
		$session_storage = 'session_'.pc_base::load_config('system','session_storage');
		pc_base::load_sys_class($session_storage);
	}
	//首页
	public function init() {
		if(isset($_GET['siteid'])) {
			$siteid = intval($_GET['siteid']);
		} else {
			$siteid = 1;
		}
		$siteid = $GLOBALS['siteid'] = max($siteid,1);
		define('SITEID', $siteid);
		$_userid = $this->_userid;
		$_username = $this->_username;
		$_groupid = $this->_groupid;
		//SEO
		$SEO = seo($siteid);
		$sitelist  = getcache('sitelist','commons');
		$default_style = $sitelist[$siteid]['default_style'];
		$CATEGORYS = getcache('category_content_'.$siteid,'commons');
		//杨飞添加
		if ($this->wap['status']==1) {
			if(stristr($_SERVER['HTTP_VIA'],"wap")){ 
			// 先检查是否为wap代理，准确度高
			include template('wap','index');
			}elseif(strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0){ 
			// 检查浏览器是否接受 WML.
			include template('wap','index');
			}elseif(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera|Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){ 
			//检查USER_AGENT
			include template('wap','index');
			}else{
			include template('content','index',$default_style);
			}
		}else{
			include template('content','index',$default_style);
		}		
		
	}
	
	function get_fang_diy() {	   
	       $db = pc_base::load_model('content_model');
	       $sql = "SELECT count(*) as count FROM allwww_news WHERE catid =9 and title ='".$_POST['title']."'";
		   $query = $db->query($sql);
	       $result = $db->fetch_array($query);
		   if($result[0]['count']==0){	   
			   $number = 0; 
			   }else{
			   $number = 1; 
			   }	   
		   echo $number ;
   }

   function public_up_youji() {
    $db = pc_base::load_model('content_model');
    $b = $_POST['page_num'];
    $a = $b * ($_POST['page'] - 1);
    $catidarr = diy_child($_POST['catid']);
    $moduleid = moduleid_by($_POST['catid']);
    $tablename = $db->db_tablepre.tablename_by($moduleid);
    $tablename_data = $tablename."_data";
    $sql = "SELECT a.*, b.pictureurls FROM ".$tablename." as a left join ".$tablename_data." as b  on a.id=b.id WHERE a.catid in (" . $catidarr . ") and a.status = 99 order by a.listorder DESC limit " . $a . "," . $b;
    // echo $this->JSON(array('name' => $tablename,'name2' => $sql ));
    // die();
    $query = $db->query($sql);
    $result = $db->fetch_array($query);
    $array = array();
    $i=0;
	  foreach ($result as $value) {
	  	foreach ($value as $k => $v) {
	  		if ($k=='inputtime') {
	  			$value[$k] = date('Y-m-d',$v);
	  		}
	  		if ($k=='description') {
	  			$value[$k] = str_cut($v,450,'...') ;
	  		}
	  		if ($k=='pictureurls') {
	  			$j=1;
	  			foreach (string2array($v) as $t) {
	  				if ($j < 5) {
	  					$tuk = 'tu'.$j;
	  					$value[$tuk] = $t[url];
	  				}
	  				$j++;
	  			}
	  		}
	  	}
	  	$array[$i]=$value;
	  	$i++;
	  }
   echo $this->JSON($array);
   }

/**************************************************************
 *
 *	将数组转换为JSON字符串（兼容中文）
 *	@param	array	$array		要转换的数组
 *	@return string		转换得到的json字符串
 *	@access public
 *
 *************************************************************/
private function JSON($array) {
	$json = json_encode($array,JSON_UNESCAPED_UNICODE);
	return urldecode($json);
}
	//内容页
	public function show() {
		
        if(isset ($_GET['catid'])){
                $catid = intval($_GET['catid']);
        }else{
                $catid=$this->_getCategoryId($_GET['dir']);
        }

		$id = intval($_GET['id']);

		if(!$catid || !$id) showmessage(L('information_does_not_exist'),'blank');
		$_userid = $this->_userid;
		$_username = $this->_username;
		$_groupid = $this->_groupid;

		$page = intval($_GET['page']);
		$page = max($page,1);
		$siteids = getcache('category_content','commons');
		$siteid = $siteids[$catid];
		$CATEGORYS = getcache('category_content_'.$siteid,'commons');
		
		if(!isset($CATEGORYS[$catid]) || $CATEGORYS[$catid]['type']!=0) showmessage(L('information_does_not_exist'),'blank');
		$this->category = $CAT = $CATEGORYS[$catid];
		$this->category_setting = $CAT['setting'] = string2array($this->category['setting']);
		$siteid = $GLOBALS['siteid'] = $CAT['siteid'];
		
		$MODEL = getcache('model','commons');
		$modelid = $CAT['modelid'];
		
		$tablename = $this->db->table_name = $this->db->db_tablepre.$MODEL[$modelid]['tablename'];
		$r = $this->db->get_one(array('id'=>$id));
		if(!$r || $r['status'] != 99) showmessage(L('info_does_not_exists'),'blank');
		
		$this->db->table_name = $tablename.'_data';
		$r2 = $this->db->get_one(array('id'=>$id));
		$rs = $r2 ? array_merge($r,$r2) : $r;

		//再次重新赋值，以数据库为准
		$catid = $CATEGORYS[$r['catid']]['catid'];
		$modelid = $CATEGORYS[$catid]['modelid'];
		
		require_once CACHE_MODEL_PATH.'content_output.class.php';
		$content_output = new content_output($modelid,$catid,$CATEGORYS);
		$data = $content_output->get($rs);
		extract($data);
		
		//检查文章会员组权限
		if($groupids_view && is_array($groupids_view)) {
			$_groupid = param::get_cookie('_groupid');
			$_groupid = intval($_groupid);
			if(!$_groupid) {
				$forward = urlencode(get_url());
				showmessage(L('login_website'),APP_PATH.'index.php?m=member&c=index&a=login&forward='.$forward);
			}
			if(!in_array($_groupid,$groupids_view)) showmessage(L('no_priv'));
		} else {
			//根据栏目访问权限判断权限
			$_priv_data = $this->_category_priv($catid);
			if($_priv_data=='-1') {
				$forward = urlencode(get_url());
				showmessage(L('login_website'),APP_PATH.'index.php?m=member&c=index&a=login&forward='.$forward);
			} elseif($_priv_data=='-2') {
				showmessage(L('no_priv'));
			}
		}
		if(module_exists('comment')) {
			$allow_comment = isset($allow_comment) ? $allow_comment : 1;
		} else {
			$allow_comment = 0;
		}
		//阅读收费 类型
		$paytype = $rs['paytype'];
		$readpoint = $rs['readpoint'];
		$allow_visitor = 1;
		if($readpoint || $this->category_setting['defaultchargepoint']) {
			if(!$readpoint) {
				$readpoint = $this->category_setting['defaultchargepoint'];
				$paytype = $this->category_setting['paytype'];
			}
			
			//检查是否支付过
			$allow_visitor = self::_check_payment($catid.'_'.$id,$paytype);
			if(!$allow_visitor) {
				$http_referer = urlencode(get_url());
				$allow_visitor = sys_auth($catid.'_'.$id.'|'.$readpoint.'|'.$paytype).'&http_referer='.$http_referer;
			} else {
				$allow_visitor = 1;
			}
		}
		//最顶级栏目ID
		$arrparentid = explode(',', $CAT['arrparentid']);
		$top_parentid = $arrparentid[1] ? $arrparentid[1] : $catid;
		
		$wap_template =  $CAT['setting']['wap_show_template'];
		$template = $template ? $template : $CAT['setting']['show_template'];

		if(!$template) $template = 'show';
		if(!$wap_template) $wap_template = 'show';
		//SEO
		$seo_keywords = '';
		if(!empty($keywords)) $seo_keywords = implode(',',$keywords);
		$SEO = seo($siteid, $catid, $title, $description, $seo_keywords);
		
		define('STYLE',$CAT['setting']['template_list']);
		if(isset($rs['paginationtype'])) {
			$paginationtype = $rs['paginationtype'];
			$maxcharperpage = $rs['maxcharperpage'];
		}
		$pages = $titles = '';
		if($rs['paginationtype']==1) {
			//自动分页
			if($maxcharperpage < 10) $maxcharperpage = 500;
			$contentpage = pc_base::load_app_class('contentpage');
			$content = $contentpage->get_data($content,$maxcharperpage);
		}
		if($rs['paginationtype']!=0) {
			//手动分页
			$CONTENT_POS = strpos($content, '[page]');
			if($CONTENT_POS !== false) {
				$this->url = pc_base::load_app_class('url', 'content');
				$contents = array_filter(explode('[page]', $content));
				$pagenumber = count($contents);
				if (strpos($content, '[/page]')!==false && ($CONTENT_POS<7)) {
					$pagenumber--;
				}
				for($i=1; $i<=$pagenumber; $i++) {
					$pageurls[$i] = $this->url->show($id, $i, $catid, $rs['inputtime']);
				}
				$END_POS = strpos($content, '[/page]');
				if($END_POS !== false) {
					if($CONTENT_POS>7) {
						$content = '[page]'.$title.'[/page]'.$content;
					}
					if(preg_match_all("|\[page\](.*)\[/page\]|U", $content, $m, PREG_PATTERN_ORDER)) {
						foreach($m[1] as $k=>$v) {
							$p = $k+1;
							$titles[$p]['title'] = strip_tags($v);
							$titles[$p]['url'] = $pageurls[$p][0];
						}
					}
				}
				//当不存在 [/page]时，则使用下面分页
				$pages = content_pages($pagenumber,$page, $pageurls);
				//判断[page]出现的位置是否在第一位 
				if($CONTENT_POS<7) {
					$content = $contents[$page];
				} else {
					if ($page==1 && !empty($titles)) {
						$content = $title.'[/page]'.$contents[$page-1];
					} else {
						$content = $contents[$page-1];
					}
				}
				if($titles) {
					list($title, $content) = explode('[/page]', $content);
					$content = trim($content);
					if(strpos($content,'</p>')===0) {
						$content = '<p>'.$content;
					}
					if(stripos($content,'<p>')===0) {
						$content = $content.'</p>';
					}
				}
			}
		}



		// $content = trim($content);//文字内容
       
  //           $text="你好";
  //           $ch = curl_init();
  //           $url = 'http://tsn.baidu.com//text2audio?text='.$text.'&lan=zh&tok=3e942004ed6f4139bad90e2deee90c71&ctp=1&cuid=AC-22-OB-28-2D-F3';
  //           $header = array(
  //           	'username' => 'sVXvMrr6qcRRApWZH3XG3bS7',
  //           	'secretKey' => 'adf1c0f2dfaad79d4072737a39ac6534',
  //           );
  //           // 添加apikey到header
  //           curl_setopt($ch, CURLOPT_HTTPHEADER  , $header);
  //           curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  //           // 执行HTTP请求
  //           curl_setopt($ch , CURLOPT_URL , $url);
  //           $res = curl_exec($ch);
  //           $he=json_decode($res,true);
          
  //           if($he['errNum']=='0'&& $he['retMsg']=='success'){
  //           	 echo json_encode($he);
                
  //           }else{
  //               echo $res;
  //               }
  //               die();
		// header("Content-Type:audio/mp3");
		
		$this->db->table_name = $tablename;
		//上一页
		$previous_page = $this->db->get_one("`catid` = '$catid' AND `id`>'$id' AND `status`=99",'*','id ASC');
		//下一页
		$next_page = $this->db->get_one("`catid`= '$catid' AND `id`<'$id' AND `status`=99",'*','id DESC');
		if(empty($previous_page)) {
		 $previous_page['url'] = "javascript:void(0);";
		 $previous_page['title'] = "没有了";
		}

		if(empty($next_page)) {
		 $next_page['url'] = "javascript:void(0);";
		 $next_page['title'] = "没有了";
		}
		//杨飞添加
		if ($this->wap['status']==1) {
			if(stristr($_SERVER['HTTP_VIA'],"wap")){ 
			// 先检查是否为wap代理，准确度高
			include template('wap',$wap_template);
			}elseif(strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0){ 
			// 检查浏览器是否接受 WML.
			include template('wap',$wap_template);
			}elseif(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera|Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){ 
			//检查USER_AGENT
			include template('wap',$wap_template);
			}else{
			include template('content',$template);
			}
		}else{
			include template('content',$template);
		}
	}
	//列表页
	public function lists() {
		
		
		if(isset ($_GET['catid'])){
                $catid = intval($_GET['catid']);
        }else{
                $catid=$this->_getCategoryId($_GET['dir']);
        }
		$_priv_data = $this->_category_priv($catid);
		if($_priv_data=='-1') {
			$forward = urlencode(get_url());
			showmessage(L('login_website'),APP_PATH.'index.php?m=member&c=index&a=login&forward='.$forward);
		} elseif($_priv_data=='-2') {
			showmessage(L('no_priv'));
		}
		$_userid = $this->_userid;
		$_username = $this->_username;
		$_groupid = $this->_groupid;

		if(!$catid) showmessage(L('category_not_exists'),'blank');
		$siteids = getcache('category_content','commons');
		$siteid = $siteids[$catid];
		$CATEGORYS = getcache('category_content_'.$siteid,'commons');
		if(!isset($CATEGORYS[$catid])) showmessage(L('category_not_exists'),'blank');
		$CAT = $CATEGORYS[$catid];
		$siteid = $GLOBALS['siteid'] = $CAT['siteid'];
		extract($CAT);
		$setting = string2array($setting);
		//SEO
		if(!$setting['meta_title']) $setting['meta_title'] = $catname;
		$SEO = seo($siteid, '',$setting['meta_title'],$setting['meta_description'],$setting['meta_keywords']);
		define('STYLE',$setting['template_list']);
		$page = intval($_GET['page']);

		$template = $setting['category_template'] ? $setting['category_template'] : 'category';
		$template_list = $setting['list_template'] ? $setting['list_template'] : 'list';

		$wap_template = $setting['wap_category_template'] ? $setting['wap_category_template'] : 'category';
		$wap_template_list = $setting['wap_list_template'] ? $setting['wap_list_template'] : 'list';
		
		if($type==0) {
			if ($is_category_index == 0) {
				$template = $child ? $template : $template_list;
			}
			//$template = $child ? $template : $template_list;
			$wap_template = $child ? $wap_template : $wap_template_list;
			$arrparentid = explode(',', $arrparentid);
			$top_parentid = $arrparentid[1] ? $arrparentid[1] : $catid;
			$array_child = array();
			$self_array = explode(',', $arrchildid);
			//获取一级栏目ids
			foreach ($self_array as $arr) {
				if($arr!=$catid && $CATEGORYS[$arr][parentid]==$catid) {
					$array_child[] = $arr;
				}
			}
			$arrchildid = implode(',', $array_child);
			//URL规则
			$urlrules = getcache('urlrules','commons');
			$urlrules = str_replace('|', '~',$urlrules[$category_ruleid]);
			$tmp_urls = explode('~',$urlrules);
			$tmp_urls = isset($tmp_urls[1]) ?  $tmp_urls[1] : $tmp_urls[0];
			preg_match_all('/{\$([a-z0-9_]+)}/i',$tmp_urls,$_urls);
			if(!empty($_urls[1])) {
				foreach($_urls[1] as $_v) {
					$GLOBALS['URL_ARRAY'][$_v] = $_GET[$_v];
				}
			}
			if (trim($parentdir,"/")=='' && $parentid > 0) {
				$parentdir = $this->_parentdir($catid);
			}
			
			define('URLRULE', $urlrules);
			$GLOBALS['URL_ARRAY']['categorydir'] = '/'.$parentdir;
			$GLOBALS['URL_ARRAY']['catdir'] = $catdir;
			$GLOBALS['URL_ARRAY']['catid'] = $catid;
			//杨飞添加
			if ($this->wap['status']==1) {
				if(stristr($_SERVER['HTTP_VIA'],"wap")){ 
				// 先检查是否为wap代理，准确度高
				include template('wap',$wap_template);
				}elseif(strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0){ 
				// 检查浏览器是否接受 WML.
				include template('wap',$wap_template);
				}elseif(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera|Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){ 
				//检查USER_AGENT
				include template('wap',$wap_template);
				}else{
				include template('content',$template);
				}
			}else{
				include template('content',$template);
			}
		} else {
		//单网页
			$this->page_db = pc_base::load_model('page_model');
			$r = $this->page_db->get_one(array('catid'=>$catid));
			if($r) extract($r);
			$template = $setting['page_template'] ? $setting['page_template'] : 'page';
			$wap_template = $setting['wap_page_template'] ? $setting['wap_page_template'] : 'page';
			$arrchild_arr = $CATEGORYS[$parentid]['arrchildid'];
			if($arrchild_arr=='') $arrchild_arr = $CATEGORYS[$catid]['arrchildid'];
			$arrchild_arr = explode(',',$arrchild_arr);
			array_shift($arrchild_arr);
			$keywords = $keywords ? $keywords : $setting['meta_keywords'];
			$SEO = seo($siteid, 0, $title,$setting['meta_description'],$keywords);
			//杨飞添加
			if ($this->wap['status']==1) {
				if(stristr($_SERVER['HTTP_VIA'],"wap")){ 
				// 先检查是否为wap代理，准确度高
				include template('wap',$wap_template);
				}elseif(strpos(strtoupper($_SERVER['HTTP_ACCEPT']),"VND.WAP.WML") > 0){ 
				// 检查浏览器是否接受 WML.
				include template('wap',$wap_template);
				}elseif(preg_match('/(blackberry|configuration\/cldc|hp |hp-|htc |htc_|htc-|iemobile|kindle|midp|mmp|motorola|mobile|nokia|opera mini|opera|Googlebot-Mobile|YahooSeeker\/M1A1-R2D2|android|iphone|ipod|mobi|palm|palmos|pocket|portalmmm|ppc;|smartphone|sonyericsson|sqh|spv|symbian|treo|up.browser|up.link|vodafone|windows ce|xda |xda_)/i', $_SERVER['HTTP_USER_AGENT'])){ 
				//检查USER_AGENT
				include template('wap',$wap_template);
				}else{
				include template('content',$template);
				}
			}else{
				include template('content',$template);
			}
		}
	}
	
	/**
	 * 找parentdir
	 * @param array $parentdir
	 */
	private function _parentdir($catid) {
		$this->category_db = pc_base::load_model('category_model');
	    $result = $this->category_db->get_one(array('catid'=>$catid));
		return $result['parentdir'];
	}
	//JSON 输出
	public function json_list() {
		if($_GET['type']=='keyword' && $_GET['modelid'] && $_GET['keywords']) {
		//根据关键字搜索
			$modelid = intval($_GET['modelid']);
			$id = intval($_GET['id']);

			$MODEL = getcache('model','commons');
			if(isset($MODEL[$modelid])) {
				$keywords = safe_replace(new_html_special_chars($_GET['keywords']));
				$keywords = addslashes(iconv('utf-8','gbk',$keywords));
				$this->db->set_model($modelid);
				$result = $this->db->select("keywords LIKE '%$keywords%'",'id,title,url',10);
				if(!empty($result)) {
					$data = array();
					foreach($result as $rs) {
						if($rs['id']==$id) continue;
						if(CHARSET=='gbk') {
							foreach($rs as $key=>$r) {
								$rs[$key] = iconv('gbk','utf-8',$r);
							}
						}
						$data[] = $rs;
					}
					if(count($data)==0) exit('0');
					echo json_encode($data);
				} else {
					//没有数据
					exit('0');
				}
			}
		}

	}
	
	
	/**
	 * 检查支付状态
	 */
	protected function _check_payment($flag,$paytype) {
		$_userid = $this->_userid;
		$_username = $this->_username;
		if(!$_userid) return false;
		pc_base::load_app_class('spend','pay',0);
		$setting = $this->category_setting;
		$repeatchargedays = intval($setting['repeatchargedays']);
		if($repeatchargedays) {
			$fromtime = SYS_TIME - 86400 * $repeatchargedays;
			$r = spend::spend_time($_userid,$fromtime,$flag);
			if($r['id']) return true;
		}
		return false;
	}
	
	/**
	 * 检查阅读权限
	 *
	 */
	protected function _category_priv($catid) {
		$catid = intval($catid);
		if(!$catid) return '-2';
		$_groupid = $this->_groupid;
		$_groupid = intval($_groupid);
		if($_groupid==0) $_groupid = 8;
		$this->category_priv_db = pc_base::load_model('category_priv_model');
		$result = $this->category_priv_db->select(array('catid'=>$catid,'is_admin'=>0,'action'=>'visit'));
		if($result) {
			if(!$_groupid) return '-1';
			foreach($result as $r) {
				if($r['roleid'] == $_groupid) return '1';
			}
			return '-2';
		} else {
			return '1';
		}
	 }
	/*用于将`catdir`转换为`catid`*/
	private function _getCategoryId($catdir){
	                if(!strpos($catdir,'/')) {
	                        $dirname = $catdir;
	                }else {
	                        $dirname = end(explode('/',$catdir));
	                }
	                $parentdir='';
                	$hz = strrpos($catdir,$dirname);
					if ($hz>0) {
						$parentdir = substr($catdir,0,$hz); 
					}
	                $this->category_db = pc_base::load_model('category_model');
	                $result = $this->category_db->get_one(array('catdir'=>$dirname,'parentdir'=>$parentdir));
	                if (empty($result['catid'])) {
	                	$this->repair();
	                	$result = $this->category_db->get_one(array('catdir'=>$dirname,'parentdir'=>$parentdir));
	                	if (empty($result['catid'])) {
	                		showmessage(L('category_not_exists'),'blank');
	                	}
	                }
	                return $result['catid'];
	        }

	/**
	* 修复栏目数据
	*/
	private function repair() {
		$this->db = pc_base::load_model('category_model');
		pc_base::load_sys_func('iconv');
		@set_time_limit(600);
		$html_root = pc_base::load_config('system','html_root');
		$this->categorys = $categorys = array();
		$this->categorys = $categorys = $this->db->select(array('siteid'=>$this->siteid,'module'=>'content'), '*', '', 'listorder ASC, catid ASC', '', 'catid');
		
		$this->get_categorys($categorys);
		if(is_array($this->categorys)) {
			foreach($this->categorys as $catid => $cat) {
				if($cat['type'] == 2) continue;
				$arrparentid = $this->get_arrparentid($catid);
				$setting = string2array($cat['setting']);
				$arrchildid = $this->get_arrchildid($catid);
				$child = is_numeric($arrchildid) ? 0 : 1;
				if($categorys[$catid]['arrparentid']!=$arrparentid || $categorys[$catid]['arrchildid']!=$arrchildid || $categorys[$catid]['child']!=$child) $this->db->update(array('arrparentid'=>$arrparentid,'arrchildid'=>$arrchildid,'child'=>$child),array('catid'=>$catid));
				$parentdir = $this->get_parentdir($catid);
				$catname = $cat['catname'];
				$letters = gbk_to_pinyin($catname);
				$letter = strtolower(implode('', $letters));
				$listorder = $cat['listorder'] ? $cat['listorder'] : $catid;
				
				$this->sethtml = $setting['create_to_html_root'];
				//检查是否生成到根目录
				$this->get_sethtml($catid);
				$sethtml = $this->sethtml ? 1 : 0;
				
				if($setting['ishtml']) {
				//生成静态时
					$url = $this->update_url($catid);
					if(!preg_match('/^(http|https):\/\//i', $url)) {
						$url = $sethtml ? '/'.$url : $html_root.'/'.$url;
					}
				} else {
				//不生成静态时
					$url = $this->update_url($catid);
					$url = APP_PATH.$url;
				}
				if($cat['url']!=$url) $this->db->update(array('url'=>$url), array('catid'=>$catid));
				
				
				
				if($categorys[$catid]['parentdir']!=$parentdir || $categorys[$catid]['sethtml']!=$sethtml || $categorys[$catid]['letter']!=$letter || $categorys[$catid]['listorder']!=$listorder) $this->db->update(array('parentdir'=>$parentdir,'sethtml'=>$sethtml,'letter'=>$letter,'listorder'=>$listorder), array('catid'=>$catid));
			}
		}
		
		//删除在非正常显示的栏目
		foreach($this->categorys as $catid => $cat) {
			if($cat['parentid'] != 0 && !isset($this->categorys[$cat['parentid']])) {
				$this->db->delete(array('catid'=>$catid));
			}
		}
		return true;
	}
	/**
	 * 找出子目录列表
	 * @param array $categorys
	 */
	private function get_categorys($categorys = array()) {
		if (is_array($categorys) && !empty($categorys)) {
			foreach ($categorys as $catid => $c) {
				$this->categorys[$catid] = $c;
				$result = array();
				foreach ($this->categorys as $_k=>$_v) {
					if($_v['parentid']) $result[] = $_v;
				}
				$this->get_categorys($r);
			}
		} 
		return true;
	}
	/**
	 * 
	 * 获取父栏目ID列表
	 * @param integer $catid              栏目ID
	 * @param array $arrparentid          父目录ID
	 * @param integer $n                  查找的层次
	 */
	private function get_arrparentid($catid, $arrparentid = '', $n = 1) {
		if($n > 5 || !is_array($this->categorys) || !isset($this->categorys[$catid])) return false;
		$parentid = $this->categorys[$catid]['parentid'];
		$arrparentid = $arrparentid ? $parentid.','.$arrparentid : $parentid;
		if($parentid) {
			$arrparentid = $this->get_arrparentid($parentid, $arrparentid, ++$n);
		} else {
			$this->categorys[$catid]['arrparentid'] = $arrparentid;
		}
		$parentid = $this->categorys[$catid]['parentid'];
		return $arrparentid;
	}
	/**
	 * 
	 * 获取子栏目ID列表
	 * @param $catid 栏目ID
	 */
	private function get_arrchildid($catid) {
		$arrchildid = $catid;
		if(is_array($this->categorys)) {
			foreach($this->categorys as $id => $cat) {
				if($cat['parentid'] && $id != $catid && $cat['parentid']==$catid) {
					$arrchildid .= ','.$this->get_arrchildid($id);
				}
			}
		}
		return $arrchildid;
	}
	/**
	 * 获取父栏目路径
	 * @param  $catid
	 */
	function get_parentdir($catid) {
		if($this->categorys[$catid]['parentid']==0) return '';
		$r = $this->categorys[$catid];
		$setting = string2array($r['setting']);
		$url = $r['url'];
		$arrparentid = $r['arrparentid'];
		unset($r);
		if (strpos($url, '://')===false) {
			if ($setting['creat_to_html_root']) {
				return '';
			} else {
				$arrparentid = explode(',', $arrparentid);
				$arrcatdir = array();
				foreach($arrparentid as $id) {
					if($id==0) continue;
					$arrcatdir[] = $this->categorys[$id]['catdir'];
				}
				return implode('/', $arrcatdir).'/';
			}
		} else {
			if ($setting['create_to_html_root']) {
				if (preg_match('/^((http|https):\/\/)?([^\/]+)/i', $url, $matches)) {
					$url = $matches[0].'/';
					$rs = $this->db->get_one(array('url'=>$url), '`parentdir`,`catid`');
					if ($catid == $rs['catid']) return '';
					else return $rs['parentdir'];
				} else {
					return '';
				}
			} else {
				$arrparentid = explode(',', $arrparentid);
				$arrcatdir = array();
				krsort($arrparentid);
				foreach ($arrparentid as $id) {
					if ($id==0) continue;
					$arrcatdir[] = $this->categorys[$id]['catdir'];
					if ($this->categorys[$id]['parentdir'] == '') break;
				}
				krsort($arrcatdir);
				return implode('/', $arrcatdir).'/';
			}
		}
	}
		/**
	 * 获取父栏目是否生成到根目录
	 */
	private function get_sethtml($catid) {
		foreach($this->categorys as $id => $cat) {
			if($catid==$id) {
				$parentid = $cat['parentid'];
				if($this->categorys[$parentid]['sethtml']) {
					$this->sethtml = 1;
				}
				if($parentid) {
					$this->get_sethtml($parentid);
				}
			}
		}
	}
	/**
	* 更新栏目链接地址
	*/
	private function update_url($catid) {
		$catid = intval($catid);
		if (!$catid) return false;
		$url = pc_base::load_app_class('url', 'content'); //调用URL实例
		return $url->category_url($catid);
	}	
}
?>
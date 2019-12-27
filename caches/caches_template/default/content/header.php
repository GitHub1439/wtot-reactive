<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?> <!doctype html>
<html lang="zh-cmn-Hans"><head>
<meta charset="utf-8">
 <!-- 技术支持：凡高网络 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title><?php if(isset($SEO['title']) && !empty($SEO['title'])) { ?><?php echo $SEO['title'];?><?php } ?><?php echo $SEO['site_title'];?></title>
<meta name="keywords" content="<?php echo $SEO['keyword'];?>">
<meta name="description" content="<?php echo $SEO['description'];?>">
<link rel="shortcut icon" href="<?php echo APP_PATH;?>favicon.ico"/>
   <!-- Style file -->
     <link rel="stylesheet" href="/statics/css/j_reset.css">
      <link rel="stylesheet" href="/statics/css/j_web.css">
      <link rel="stylesheet" href="/statics/css/j_animate.css">  
       <script type="text/javascript" src="/statics/js/jquery-1.9.1.min.js"></script>
      <script type="text/javascript" src="/statics/js/j_reset.js"></script>
      <script type="text/javascript" src="/statics/js/j_web.js"></script>
      <script type="text/javascript" src="/statics/js/j_div_scoll.js"></script>
    <!-- Compatible files -->
    <!--[if lt IE 9]>
      <script src="/statics/js/j_ijr.js"></script>
    <![endif]--> 
</head> 
<body>
<link rel="shortcut icon" href="favicon.ico">
<div id="j_body">
<!--=============================================header=============================================-->
  <?php $tid = intval(diy_top_id($catid))?>  
  <?php $allFields = customField()?>
<?php if(isshiyong()==1) { ?>
<?php include template("content","shiyong"); ?>
<?php } ?>
<!--=============================================header=============================================-->
<header id="header">
  <div class="main_box">
  
    <div id="logo"> <a href="<?php echo siteurl($siteid);?>" title=""><img src="/statics/images/logo.png" alt="" /></a> </div>
    <aside id="lan_box">
      <div class="box">
        <h1>中文简体</h1>
      <div class="content">
        <a href="http://www.zzmcoin.com/">English </a>
        <a href="http://qklft.zzmcoin.com/"">中文繁体</a>
        <a href="http://qklhw.zzmcoin.com/""> 한글 </a>
        <a href="http://qklrw.zzmcoin.com/"">日本語の</a>
      </div>
      </div>
      
    </aside>
    <a href="javascript:void(0)" id="bnt_site_map"></a>
    
  <div id="nav">
        <img class="nav_logo" src="/statics/images/logo.png" width="50px" />
        <ul>
            <li><a href="<?php echo siteurl($siteid);?>#banner" title="" class="a"><strong>首页</strong><span><i></i></span></a></li>
            <li  ><a href="<?php echo siteurl($siteid);?>#section1" title="" class="a"><strong>关于ZZM</strong><span><i></i></span></a> </li>
            <li ><a href="<?php echo siteurl($siteid);?>#section2" title="" class="a"><strong>应用场景</strong><span><i></i></span></a>
               
            </li>
            <li><a href="<?php echo siteurl($siteid);?>#section3" title="" class="a"><strong>下载专区</strong><span><i></i></span></a>
               
            </li>
            <li><a href="<?php echo siteurl($siteid);?>#section4" title="" class="a"><strong>管理团队</strong><span><i></i></span></a>
               
            </li>
            <li><a href="<?php echo siteurl($siteid);?>#section5" title="" class="a"><strong>合作媒体</strong><span><i></i></span></a>
               
            </li>
            <li><a href="<?php echo siteurl($siteid);?>#section6" title="" class="a"><strong>升值理念</strong><span><i></i></span></a>
               
            </li>
            <li><a href="<?php echo siteurl($siteid);?>#section7" title="" class="a"><strong>社区</strong><span><i></i></span></a>
               
            </li>
             
            <div class="clear"></div>
        </ul>
        <div id="bnt_nav_close">CLOSE</div>
    </div>
  
    <div class="clear"></div>
  </div>
</header>
<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>提示信息</title>

<link type="text/css" href="<?php echo CSS_PATH;?>reset.css" rel="stylesheet" rev="stylesheet" />



<style type="text/css">

*{ padding:0; margin:0; font-size:12px}

.showMsg .guery {white-space: pre-wrap; /* css-3 */white-space: -moz-pre-wrap; /* Mozilla, since 1999 */white-space: -pre-wrap; /* Opera 4-6 */white-space: -o-pre-wrap; /* Opera 7 */	word-wrap: break-word; /* Internet Explorer 5.5+ */}

a:link,a:visited{text-decoration:none;color:#eee }

a:hover,a:active{color:#eee ;text-decoration: underline}

.showMsg{border: 1px solid #ddd; border-radius: 5px; box-shadow: 2px 2px 2px #ddd; overflow: hidden; zoom:1; width:450px;  position:absolute;top:50%;left:50%;margin:-112px 0 0 -225px}

.showMsg h5{ color:#222; text-align: center;  padding-top: 30px; height:25px; line-height:26px;*line-height:28px; overflow:hidden; font-size:18px; }

.showMsg .content{ padding:46px 12px 10px 45px; font-size:14px; height:66px; color: #444;}

.showMsg .bottom{ background:#eee ; color: #666;  line-height:45px; *line-height:45px; height:45px; text-align:center}

.showMsg .ok,.showMsg .guery{background: url(<?php echo IMG_PATH?>/msg_img/msg_bg.png) no-repeat 0px -560px;}

.showMsg .guery{background-position: left -460px;}

.showMsg .bottom a{ color: #666; height: 45px; line-height: 45px;}

</style>

<script type="text/javaScript" src="<?php echo JS_PATH;?>jquery.min.js"></script>

<script language="JavaScript" src="<?php echo JS_PATH;?>admin_common.js"></script>

</head>

<body>

<div class="showMsg" style="text-align:center">

	<h5>提示信息</h5>

    <div class="content guery" style="display:inline-block;display:-moz-inline-stack;zoom:1;*display:inline; max-width:280px"><?php echo $msg;?></div>

    <div class="bottom">

    <?php if($url_forward=='goback' || $url_forward=='') { ?>

	<a href="javascript:history.back();" >[点这里返回上一页]</a>

	<?php } elseif ($url_forward=="close") { ?>

	<input type="button" name="close" value=" 关闭 " onClick="window.close();">

	<?php } elseif ($url_forward=="blank") { ?>

	<?php } elseif ($url_forward) { ?>

	<a href="<?php echo strip_tags($url_forward);?>">如果您的浏览器没有自动跳转，请点击这里</a>

	<script language="javascript">setTimeout("redirect('<?php echo strip_tags($url_forward);?>');",<?php echo $ms;?>);</script> 

	<?php } ?>

	<?php if($dialog) { ?><script style="text/javascript">window.top.location.reload();window.top.art.dialog({id:"<?php echo $dialog;?>"}).close();</script><?php } ?>

        </div>

</div>

<script style="text/javascript">

	function close_dialog() {

		window.top.location.reload();window.top.art.dialog({id:"<?php echo $dialog?>"}).close();

	}

</script>

</body>

</html>
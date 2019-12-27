<?php

	require_once "smtp.class.php";
	//******************** 配置信息 ********************************
	$smtpserver = "smtp.126.com";//SMTP服务器
	$smtpserverport =25;//SMTP服务器端口
	$smtpusermail = "sykzqj@126.com";//SMTP服务器的用户邮箱
	$smtpemailto = $_POST['toemail'];//发送给谁
	$smtpuser = "sykzqj";//SMTP服务器的用户帐号
	$smtppass = "baiduinf@123";//SMTP服务器的用户密码
	$mailtitle = $_POST['title'];//邮件主题
	$mailcontent = "<h1>".$_POST['content']."</h1>";//邮件内容
	$mailtype = "HTML";//邮件格式（HTML/TXT）,TXT为文本邮件
	//************************ 配置信息 ****************************
	$smtp = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);//这里面的一个true是表示使用身份验证,否则不使用身份验证.
	$smtp->debug = false;//是否显示发送的调试信息
	$state = $smtp->sendmail($smtpemailto, $smtpusermail, $mailtitle, $mailcontent, $mailtype);

	echo "<div style='width:300px; margin:36px auto;'>";
	if($state==""){
		echo "error。";
		echo "<a href='send.html'>return</a>";
		exit();
	}
	echo "send ok！";
	echo "<a href='send.html'>return</a>";
	echo "</div>";

?>

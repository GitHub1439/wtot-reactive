<?php

	require_once "smtp.class.php";
	//******************** ������Ϣ ********************************
	$smtpserver = "smtp.126.com";//SMTP������
	$smtpserverport =25;//SMTP�������˿�
	$smtpusermail = "sykzqj@126.com";//SMTP���������û�����
	$smtpemailto = $_POST['toemail'];//���͸�˭
	$smtpuser = "sykzqj";//SMTP���������û��ʺ�
	$smtppass = "baiduinf@123";//SMTP���������û�����
	$mailtitle = $_POST['title'];//�ʼ�����
	$mailcontent = "<h1>".$_POST['content']."</h1>";//�ʼ�����
	$mailtype = "HTML";//�ʼ���ʽ��HTML/TXT��,TXTΪ�ı��ʼ�
	//************************ ������Ϣ ****************************
	$smtp = new smtp($smtpserver,$smtpserverport,true,$smtpuser,$smtppass);//�������һ��true�Ǳ�ʾʹ�������֤,����ʹ�������֤.
	$smtp->debug = false;//�Ƿ���ʾ���͵ĵ�����Ϣ
	$state = $smtp->sendmail($smtpemailto, $smtpusermail, $mailtitle, $mailcontent, $mailtype);

	echo "<div style='width:300px; margin:36px auto;'>";
	if($state==""){
		echo "error��";
		echo "<a href='send.html'>return</a>";
		exit();
	}
	echo "send ok��";
	echo "<a href='send.html'>return</a>";
	echo "</div>";

?>

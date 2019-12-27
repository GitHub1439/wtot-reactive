<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header','admin');
?>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>formvalidator.js"></script>

<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>formvalidatorregex.js"></script>

<script type="text/javascript">
<!--
	$(function(){
	
			$.formValidator.initConfig({
			
			autotip:true,
			formid:"myform",
			onerror:function(msg){
				}
			});
	
			$("#username").formValidator({onshow:"请输入用户名",onfocus:"请输入用户名"}).inputValidator({min:1,max:999,onerror:"用户名不能为空"});	
				$("#mobile").formValidator({onshow:"请输入用户手机号",onfocus:"请输入用户手机号"}).inputValidator({min:11,onerror:"请输入用户手机号"}).regexValidator({regexp:"^(1)[0-9]{10}$",onerror:"格式应该为15900000000"})
	
	
	
			$("#useremail").formValidator({onshow:"请输入用户邮箱",onfocus:"请输入用户邮箱"}).inputValidator({min:1,onerror:"请输入用户邮箱"}).regexValidator({regexp:"^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$",onerror:"格式应该为***@***.***"})
	
	
			$("#beizhu").formValidator({onshow:"请输入信息备注",onfocus:"请输入信息备注"}).inputValidator({min:1,max:9999,onerror:"信息备注不能为空"});
			
 	});
//-->
</script>
<div class="pad-lr-10">
<form action="?m=yuyue&amp;c=yuyue&amp;a=edit_yuyue" method="post" name="myform" id="myform">
<table cellpadding="2" cellspacing="1" class="table_form" width="100%">

	<tr>
		<th width="60">用户名：</th>
		<td><input type="text" name="yuyue[username]" id="username"
			size="30" class="input-text" value="<?php echo $username;?>"></td>
	</tr>
	
	<tr>
		<th width="100">用户手机号：</th>
		<td><input type="text" name="yuyue[mobile]" id="mobile"
			size="30" class="input-text" value="<?php echo $mobile;?>"></td>
	</tr>
	
	<tr>
	  <th>用户邮件：</th>
	  <td><input type="text" name="yuyue[useremail]" id="useremail"
			size="30" class="input-text" value="<?php echo $useremail;?>"></td>
	  </tr>
	<tr>
		<th>信息备注：</th>
		<td><p>
		  <textarea name="yuyue[beizhu]" id="beizhu" cols="60"
			rows="10"><?php echo $beizhu;?>
        </textarea>
	    </p></td>
	</tr>
	<tr>
	  <th>状态：</th>
	  <td><input name="yuyue[ischeck]" type="radio" value="2" <?php if ($ischeck==2) { 
	  				echo "checked='checked'";
	   }?> 
	    />
	    通过 
	      <input type="radio" name="yuyue[ischeck]" value="1"  <?php
		   if ($ischeck==1) { 
		   echo "checked='checked'";
		   }?>
		   />
不通过 </td>
	  </tr> 
</table>

  <div align="left" style="padding-left:280px;">
    <input 	type="submit" name="dosubmit" id="submit" value="   编    辑  " />
    <input name="userid" type="hidden" id="userid" value="<?php echo $userid;?>" />
  </div>
  <table cellpadding="2" cellspacing="1" class="table_form" width="100%">
</table>
</form>
</div>
</body>
</html>

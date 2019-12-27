<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html>
<head>
<title>后台管理中心 v 1.1</title>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<meta name="author" content="muntime.com" />
<link href="<?php echo CSS_PATH?>muntime/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo CSS_PATH?>muntime/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles1.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles2.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo CSS_PATH?>muntime/styles3.css" title="styles3" media="screen" />


<script type="text/javascript" src="<?php echo JS_PATH?>jquery.min.js"></script>
<script type="text/javascript" src="<?php echo JS_PATH?>styleswitch.js"></script>
<script type="text/javascript" src="<?php echo CSS_PATH?>muntime/Particleground.js"></script>


<link href="<?php echo CSS_PATH?>muntime/drag.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="<?php echo JS_PATH?>drag.js"></script>



<style type="text/css">html,body{height: 100%;position: relative;}</style>
<script language="JavaScript">
<!--
  if(top!=self)
  if(self!=top) top.location=self.location;
//-->
</script>

<script>
$(document).ready(function() {
    $('body').particleground({
      dotColor: 'rgba(224,224,232,1)',
      lineColor: 'rgba(224,224,232,1)'
    });

    $(".btn1").click(function(event){
    $(".hint").css({"display":"block"});
    $(".box").css({"display":"block"});
    });
  

    $(".hint3").click(function(event) {
      $(this).parent().parent().css({"display":"none"});
      $(".box").css({"display":"none"});
    });

});
</script>


<!-- <link rel="stylesheet" type="text/css" href="/statics/verify/css/verify.css"> -->


</head>
<body onload="javascript:document.myform.username.focus();" id="canvas">
<div class="box"></div>
  <div class="admin_login">
    <form action="index.php?m=admin&c=index&a=login&dosubmit=1" method="post" name="myform">
    <div class="admin_title">
       <img  src="<?php echo IMG_PATH.'admin_img/admin_logo_login.png'?>" height="120"  alt="">
    </div>
    <div class="admin_user">
       <input type="text" name="username" placeholder="账号" class="login_txt">
    </div>
    <div class="admin_pwd">
       <input type="password" name="password" placeholder="密码" class="login_txt">
    </div>
    <div id="drag"></div>
<!--     <div id="mpanel4"></div> -->
<!--     <div class="admin_val">
       <input type="text" name="code" placeholder="验证码" maxlength="4" class="login_txt left">
       <div id="yzm" class="right"><?php echo form::checkcode('code_img')?></div>
    </div> -->
    <div class="admin_sub" id="submit" style="margin-top: 20px;">
      <span href="javascript:void(0)" id="no_submit" class="no_submit_btn">立即登陆</span>  
    </div>
    </form>   
    <div class="admin_info">
       <p>忘记密码？<a style="cursor: pointer;" class="btn1">点这里</a></p>
    </div>
  </div>



<div class="hint">
  <div class="hint-in1">
    <div class="hint2">密码找回</div>
    <div class="hint3"></div>
  </div>
  <div class="hint-in2">请联系管理员</div>

</div>

<!-- 
<script type="text/javascript" src="/statics/verify/js/verify.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#mpanel4").mouseenter(function() {
          $(".verify-img-panel").stop(true, true).fadeIn(0);
          $(".verify-sub-block").stop(true, true).fadeIn(0);
          $(".verify-img-panel").css('display', 'block');
          $(".verify-sub-block").css('display', 'block');
    });
   $("#mpanel4").mouseleave(function() {
          $(".verify-img-panel,.verify-sub-block").fadeOut(1000, function () {
              $(".verify-img-panel").css('display', 'none');
              $(".verify-sub-block").css('display', 'none');
          });
    });
    $("#mpanel4").click(function(mouseleave){
      mouseleave.preventDefault();
    });
});
</script>
<script type="text/javascript">
  $('#mpanel4').slideVerify({
    type : 2,   //类型
    vOffset : 2,  //误差量，根据需求自行调整
    vSpace : 5, //间隔
    imgName : ['1.jpg', '2.jpg', '3.jpg'],
    imgSize : {
      width: '378px',
      height: '150px',
    },
    blockSize : {
      width: '40px',
      height: '40px',
    },
    barSize : {
      width : '378px',
      height : '40px',
    },
    ready : function() {
    },
    success : function() {
      //alert('验证成功，添加你自己的代码！');
      $('#no_submit').css('display','none');
      $('#submit').append('<input type="submit" value="立即登陆" class="submit_btn">');
      //......后续操作
    },
    error : function() {
//              alert('验证失败！');
    }
    
  });

</script> -->


<script type="text/javascript">
$('#drag').drag();
</script>
</body>
</html>
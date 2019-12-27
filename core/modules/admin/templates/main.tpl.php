<?php
defined('IN_ADMIN') or exit('No permission resources.');
include PC_PATH.'modules'.DIRECTORY_SEPARATOR.'admin'.DIRECTORY_SEPARATOR.'templates'.DIRECTORY_SEPARATOR.'header.tpl.php';
?>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>j_admin.js"></script>
<!--[if lt IE 9]>
      <script src="<?php echo JS_PATH?>/html5shiv.min.js"></script>
      <script src="<?php echo JS_PATH?>/respond.min.js"></script>
    <![endif]-->
<div id="admin_index_box">
                    <div class="admin_index " >
                
                        <div class="index_up admin_box">
                            <div class="line">
                                <div class="xs12 xm6 xb6 left_box">
                                    <div class="xs12 xm6 xb6 left">
                                        <div class="xs12 xm4 xb4 admin_tx">
                                            <img class="admin_tx" src="<?php if($sitelogo){ echo $sitelogo; }else{ echo "fgico.jpg"; }?>" alt="">
                                        </div>
                                        <div class="xs12 xm8 xb8 admin_info ">
                                            <div class="jj_company" style="white-space:nowrap; margin-right:20px;" >
                                            <h1 class="tips text_sd" data-place="bottom" title="<?php echo $sitename?>" ><?php echo $sitename?></h1>
                                            <h2>
                                                <strong>所享套餐：</strong>
                                                <?php if($sitetaocan == 0){ ?>
                                                 <span class="button">标准型</span>
                                                <?php } ?>
                                                <?php if($sitetaocan == 1){ ?>
                                                 <span class="button">增强型</span>
                                                <?php } ?>
                                                <?php if($sitetaocan == 2){ ?>
                                                 <span class="button">至尊型</span>
                                                <?php } ?>
                                                <?php if($sitetaocan == 3){ ?>
                                                 <span class="button">定制型</span>
                                                <?php } ?>
                                            </h2>
                                            <h2><strong  class="tips text_sd" data-place="bottom" title=""><?php echo L('main_last_loginip')?><?php echo $loginip?></strong></h2>
                                             <h2><strong  class="tips text_sd" data-place="bottom" title=""><?php echo L('main_last_logintime')?><?php echo date('Y-m-d H:i:s',$logintime)?></strong></h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="xs12 xm6 xb6 right">
                                        <div class="li xs6 xm3 xb3 <?php echo $sitetaocan==0 ? ' on ' : ''?>">
                                            <a href="javascript:void(0);" class="tips" data-toggle="hover" data-place="top" data-style="bg-dot border-red" title="升级？">标准</a>
                                        </div>
                                        <div class="li xs6 xm3 xb3 <?php echo $sitetaocan==1 ? ' on ' : ''?>">
                                            <a href="javascript:void(0);" class="tips" data-toggle="hover" data-place="top" data-style="bg-dot border-red" title="升级？">增强</a>
                                        </div>
                                       <div class="li xs6 xm3 xb3 <?php echo $sitetaocan==2 ? ' on ' : ''?>">
                                            <a href="javascript:void(0);" class="tips" data-toggle="hover" data-place="top" data-style="bg-dot border-red" title="升级？">至尊</a>
                                        </div>
                                        <div class="li xs6 xm3 xb3 <?php echo $sitetaocan==3 ? ' on ' : ''?>">
                                            <a href="javascript:void(0);" class="tips" data-toggle="hover" data-place="top" data-style="bg-dot border-red" title="定制……">定制</a>
                                        </div>
                                    </div>
                                </div> 
                                <div class="xs12 xm6 xb6 right_box">
                                    <div class="box ">
                                    <div class="xs3 xm2 xb2 hot_news">
                                        <span><img src="<?php echo IMG_PATH.'admin_img/icon_lingdang.png'?>" width="30" height="30" /></span>
                                       <h3> 通知公告</h3>
                                    </div>
                                    <div class="xs9 xm10 xb10 news_right">
                                       
                                        <iframe src="http://www.fgkj.cc/plus/list.php?tid=38" width="100%" height="112"  frameborder="no"></iframe> 
                                  
                                    </div>
                                    </div>
                                </div>  
                                <div class="clear"></div>  
                            </div>
                        </div>
                        <div class="index_md">
                            <div class="line">
                                <div class="li li1 xs12 xm6 xb3">
                                    <a href="?m=content&c=content&a=init&menuid=822&pc_hash=<?php echo $_SESSION['pc_hash'];?>">
                                    <div class="box">
                                        <img src="<?php echo IMG_PATH.'admin_img/admin_icon_1.png'?>">
                                        <h1>添加内容</h1>   
                                    </div>
                                    </a>
                                </div>
                                <div class="li li2 xs12 xm6 xb3">
                                 <a href="?m=poster&c=space&a=init&menuid=1535&pc_hash=<?php echo $_SESSION['pc_hash'];?>">
                                    <div class="box">
                                        <img src="<?php echo IMG_PATH.'admin_img/admin_icon_2.png'?>">
                                        <h1>广告管理</h1>
                                   
                                    </div>
                                 </a>
                                </div>
                                <div class="li li3 xs12 xm6 xb3">
                                <a href="?m=block&c=block_admin&a=init&menuid=945&pc_hash=<?php echo $_SESSION['pc_hash'];?>">
                                    <div class="box">
                                        <img src="<?php echo IMG_PATH.'admin_img/admin_icon_3.png'?>">
                                        <h1>碎片管理</h1>  
                                    </div>
                                </a>
                                </div>
                                <div class="li li4 xs12 xm6 xb3">
                                <a href="?m=admin&c=site&a=init&menuid=64&pc_hash=<?php echo $_SESSION['pc_hash'];?>">
                                    <div class="box">
                                        <img src="<?php echo IMG_PATH.'admin_img/admin_icon_4.png'?>">
                                        <h1>SEO优化</h1>        
                                    </div>
                                </a>   
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="index_un">
                            <div class="line">
                                <div class="xs12 xm12 xb6 left_box" style="width: 100%;">
                                    
                                    <div class="panel box" style="margin-right:0px;"> 
                                        <div class="panel-head"><strong>网站昨日流量统计</strong></div> 
                                        <div class="panel-body">
 <!--[if IE]>
 <script type="text/javascript" src="<?php echo JS_PATH?>tongji/excanvas.js" onload="explorercanvasload"></script>
     <![endif]-->
        <script src="<?php echo JS_PATH?>tongji/Chart.js"></script>                                   
                                				<div class="line">
<canvas id="canvas" style="background: #fffdf7;" height="230" width="1200"></canvas>
    <script>
                 window.onload = function() {
                 var ctx = document.getElementById("canvas").getContext("2d");
                 ctx.fillRect(10, 10, 20, 20);
             };
        var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
        var lineChartData = {
            labels : ["00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"],
            datasets : [
                {
                    label: "IP",
                    fillColor : "rgba(220,220,220,0)",
                    strokeColor : "rgba(235,163,40,1)",
                    pointColor : "rgba(235,163,40,1)",
                    pointStrokeColor : "#fff",
                    pointHighlightFill : "#fff",
                    pointHighlightStroke : "rgba(235,163,40,1)",
                    data : [
                    <?php
                    foreach ($ip as $value){
                        echo $value.',';
                    }
                    ?>
                    ]
                },
                {
                    label: "PV",
                    fillColor : "rgba(151,187,205,0)",
                    strokeColor : "rgba(94,171,120,1)",
                    pointColor : "rgba(94,171,120,1)",
                    pointStrokeColor : "#fff",
                    pointHighlightFill : "#fff",
                    pointHighlightStroke : "rgba(94,171,120,1)",
                    data : [
                    <?php
                    foreach ($pv as $value){
                        echo $value.',';
                    }
                    ?>
                    ]
                }
            ]

        }
    window.onload = function(){
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myLine = new Chart(ctx).Line(lineChartData, {
            responsive: true
        });
    }
    </script>
    <div style="text-align: center; margin-top: 20px;">
    <span style="background: rgb(235,163,40); display: inline-block; height: 10px; width: 10px;"></span> IP <span style="padding-left: 5px"></span>
    <span style="background: rgb(94,171,120); display: inline-block; height: 10px; width: 10px;"></span> PV   
    <strong style=" padding-left: 20px; font-weight: normal; font-size: 12px; color: #333;">总IP：<i style=" color: rgb(235,163,40); font-style: normal;"><?php echo $count['ips']; ?></i><span style="padding-left: 10px;"></span>  总PV：<i style="color: rgb(94,171,120); font-style: normal;"><?php echo $count['pvs']; ?></i></strong>
    </div>
                                                    <div class="clear"></div>
                                                </div>
                                        </div> 
                                    </div>
                                </div>

                                <div class="clear"></div>
                            </div>
                        </div>
    
                    </div>
                </div>


</body></html>
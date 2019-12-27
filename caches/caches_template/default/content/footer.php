<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><div class="bar_fot" ><div class="line_bar"></div></div>
<footer id="footer">
  
    <div class="main_box">
        <div class="copyright"> 
        <img src="/statics/images/logo_fot.png" />
      <?php echo $allFields[$siteid]['banquan'];?><br>
      <a href="mailto:<?php echo $allFields[$siteid]['email'];?>" title="zzmcoin@gmail.com" target="_blank"> E-mail：zzmcoin@gmail.com
</a> 
      </div>
       <div id="fot_nav">
         <dl>
           <dd>
             <h1>关于ZZM</h1>
             <a href="<?php echo siteurl($siteid);?>#section1" title="" >ZZM介绍</a>
             <a href="<?php echo siteurl($siteid);?>#section4" title="">研发团队</a>
             <a href="mailto:<?php echo $allFields[$siteid]['email'];?>" title="">联系我们</a>
               
           </dd>
           <dd>
             <h1>下载专区</h1>
             <a href="<?php echo $allFields[$siteid]['baipishu'];?>" target="_blank" title="">白皮书</a>
             <a href="<?php echo $allFields[$siteid]['qianbao'];?>" title="">ZZM钱包</a>
             <a href="<?php echo siteurl($siteid);?>#section3" title="">秒你APP</a>
             
           </dd>
           <dd>
             <h1>资讯中心</h1>
             <a href="<?php echo $CATEGORYS['14']['trueurl'];?>" title="">公示公告</a>
             <a href="<?php echo $CATEGORYS['15']['trueurl'];?>" title="">行业动态</a>
             
           </dd>
           <dd>
             <h1>合作单位</h1>
<!--             <a href="<?php echo siteurl($siteid);?>#section5" title="">合作公司</a>-->
             <a href="<?php echo siteurl($siteid);?>#section5" title="">合作媒体</a>
              
           </dd>
           <div class="clear"></div>
         </dl>
       </div>
       
       
       <div class="clear"></div>
  </div>
 
  
</footer>



</div>

<script language="JavaScript" src="<?php echo APP_PATH;?>api.php?op=cnzzip"></script>
<?php echo $allFields[$siteid]['seo_tongji'];?>   <?php echo $allFields[$siteid]['seo_360'];?> <?php echo $allFields[$siteid]['seo_baidu'];?>
 <script type="text/jscript" src="/statics/js/j_animate.js"></script>
</body>
</html> 

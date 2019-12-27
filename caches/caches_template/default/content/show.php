<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
  <script src="/statics/js/n_banner.js"></script>
 <style type="text/css">
	 canvas{ top: -50px; height: 700px !important; opacity:.9;filter:alpha(opacity=90);}	
</style>
<!--=============================================header_end=============================================-->
 
<section id="n_banner"  class="section">
   
    
</section>

<!--=============================================content=============================================-->
 <section id="n_main_box">
    <section class="n_up_box" id="n_nav_bar">
    <div class="main_box">
   
        <section class="position">
          <span>您当前位置：</span><?php echo catpos($catid,' <i>&gt;</i> ');?>
        </section>
        <section id="n_nav">
            <div class="main_box">
            <?php $arrparentid = explode(",", $CAT[arrparentid])?>
            <?php if(subcat($tid)) { ?>
            <?php $n=1;if(is_array(subcat($tid))) foreach(subcat($tid) AS $r) { ?>
            <a <?php if(in_array($r[catid], $arrparentid) || $r[catid]==$catid) { ?> class="on"<?php } ?> href="<?php echo $r['trueurl'];?>" title=""><span></span><strong><?php echo $r['catname'];?></strong></a>
            <?php $n++;}unset($n); ?>
            <?php } else { ?>
            <a class="on" href="<?php echo $CATEGORYS[$catid]['trueurl'];?>" title=""><span></span><strong><?php echo $CATEGORYS[$catid]['catname'];?></strong></a>
            <?php } ?>
            <div class="clear"></div>
            </div>
         </section>
      </div>
    
    </section>
    <section class="n_content">
      <div class="main_box">
        <article class="n_article">
          
             
                    <div class="ar_title"   aos="fade-left" aos-duration="3000">
                    
                      <h2><strong><?php echo date('Y-m-d',strtotime($inputtime));?></strong>  </h2>
                        <h1><?php echo $title;?></h1>
                        
                        
                    </div>
                    <article class="ar_article">
                        
                         
                          <?php echo $content;?>
             
                         
                    </article>
                    
                   <section id="ar_fot">
                      <h1><span>上一篇：</span><a href="<?php echo $previous_page['url'];?>"><?php echo $previous_page['title'];?></a></h1>
                      <h1><span>下一篇：</span><a href="<?php echo $next_page['url'];?>"><?php echo $next_page['title'];?></a></h1>
                   <div class="shart_box">
            <div class="bdsharebuttonbox" id="j_shart_s_24" data-tag="share_1">
              <strong> 分享到：</strong>
               <a class="bds_tqq" data-cmd="tqq" title="腾讯微博"></a>
               <a class="bds_qzone" data-cmd="qzone" title="QQ空间"></a> 
               <a class="bds_sqq" data-cmd="sqq" title="QQ好友"></a> 
               <a class="bds_tsina" data-cmd="tsina" title="新浪微博"></a>
               <a class="bds_weixin" data-cmd="weixin" title="微信"></a>  
              </div>
          </div>
          <script>
            window._bd_share_config = {

              share : [{
                "bdSize" : 24
              }],


            }
            with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
          </script>
              </section>
            
      
            </article>
      <div class="clear"></div>
        </div>
      
    </section>
</section>
<!--============================footer============================= -->
<?php include template("content","footer"); ?>
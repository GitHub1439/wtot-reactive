<?php defined('IN_PHPCMS') or exit('No permission resources.'); ?><?php include template("content","header"); ?>
  <script src="/statics/js/n_banner.js"></script>
 <style type="text/css">
	 canvas{ top: -50px; height: 700px !important; opacity:.9;filter:alpha(opacity=90);}	
</style>
<!--=============================================header_end=============================================-->
 
<section id="n_banner"  class="section">
  <div class="an_n_banner">
      
  </div>
   
    
    
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
        <section id="n_news" class="img_size">
            <ul>
<?php if(defined('IN_ADMIN')  && !defined('HTML')) {echo "<div class=\"admin_piao\" pc_action=\"content\" data=\"op=content&tag_md5=29c6e6fd64c83c9b58d2dc6fe5494edb&action=lists&catid=%24catid&num=6&order=listorder+DESC&page=%24page\"><a href=\"javascript:void(0)\" class=\"admin_piao_edit\">编辑</a>";}$content_tag = pc_base::load_app_class("content_tag", "content");if (method_exists($content_tag, 'lists')) {$pagesize = 6;$page = intval($page) ? intval($page) : 1;if($page<=0){$page=1;}$offset = ($page - 1) * $pagesize;$content_total = $content_tag->count(array('catid'=>$catid,'order'=>'listorder DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));$pages = pages($content_total, $page, $pagesize, $urlrule);$data = $content_tag->lists(array('catid'=>$catid,'order'=>'listorder DESC','limit'=>$offset.",".$pagesize,'action'=>'lists',));}?>
<?php $n=1;if(is_array($data)) foreach($data AS $r) { ?>
                     <li>
                        <div class="pic_box" ><a href="<?php echo $r['url'];?>" target="_blank"><img  src="<?php echo $r['thumb'];?>" alt="<?php echo $r['title'];?>" /></a></div>
                        <div class="text_box">
                        <h1><a href="<?php echo $r['url'];?>" title="<?php echo $r['title'];?>"><?php echo str_cut($r['title'],110,'...');?></a></h1>
                           <span><?php echo date('Y/m/d',$r['inputtime']);?></span>
                            <div class="p">
                            <?php echo str_cut($r['description'],230,'...');?>
                            </div>
                             <i> </i>
                        </div>
                    </li>
<?php $n++;}unset($n); ?>
<?php if(defined('IN_ADMIN') && !defined('HTML')) {echo '</div>';}?>
                   <div class="clear"></div>
                </ul>
        </section>
        
        <div class="clear"></div>
        
        <div class="page"> 
                 <?php echo $pages;?>
        </div>
        <div class="clear"></div>
        </div>
        
    </section>
</section>
<!--============================footer============================= -->
<?php include template("content","footer"); ?>
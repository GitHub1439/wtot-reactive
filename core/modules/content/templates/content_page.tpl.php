<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header','admin');?>
<div id="closeParentTime" style="display:none"></div>
<SCRIPT LANGUAGE="JavaScript">
<!--
if(window.top.$("#current_pos").data('clicknum')==1) {
	parent.document.getElementById('display_center_id').style.display='';
	parent.document.getElementById('center_frame').src = '?m=content&c=content&a=public_categorys&type=add&menuid=<?php echo $_GET['menuid'];?>';
	window.top.$("#current_pos").data('clicknum',0);
}
$(document).ready(function(){
	setInterval(closeParent,3000);
});
function closeParent() {
	if($('#closeParentTime').html() == '') {
		window.top.$(".left_menu").addClass("left_menu_on");
		window.top.$("#openClose").addClass("close");
		window.top.$("html").addClass("on");
		$('#closeParentTime').html('1');
		window.top.$("#openClose").data('clicknum',1);
	}
}
//-->
</SCRIPT>
<div class="pad-lr-10">
<div class="pad-10">
<div class="content-menu ib-a blue line-x"><a href="javascript:;" class=on><em><?php echo L('page_manage');?></em></a><span>|</span> <a href="<?php if(strpos($category['url'],'http://')===false) echo siteurl($this->siteid);echo $category['url'];?>" target="_blank"><em><?php echo L('click_vistor');?></em></a> <span>|</span> <a href="?m=block&c=block_admin&a=public_visualization&catid=<?php echo $catid;?>&type=page"><em><?php echo L('visualization_edit');?></em></a> 
</div>
</div>

<form name="myform" action="?m=content&c=content&a=add" method="post" enctype="multipart/form-data">
<div class="pad_10">
<div style='overflow-y:auto;overflow-x:hidden' class='scrolltable'>
<table width="100%" cellspacing="0" class="table_form contentWrap">
<tr>
	 <th width="80"> <?php echo L('title');?>	  </th>
      <td><input type="text" style="width:400px;" name="info[title]" id="title" value="<?php echo $title?>" style="color:<?php echo $style;?>" class="measure-input " onBlur="$.post('api.php?op=get_keywords&number=3&sid='+Math.random()*5, {data:$('#title').val()}, function(data){if(data && $('#keywords').val()=='') $('#keywords').val(data); })"/>
		<input type="hidden" name="style_color" id="style_color" value="<?php echo $style_color;?>">
		<input type="hidden" name="style_font_weight" id="style_font_weight" value="<?php echo $style_font_weight;?>">
		<img src="statics/images/icon/colour.png" width="15" height="16" onclick="colorpicker('title_colorpanel','set_title_color');" style="cursor:hand"/> 
		<img src="statics/images/icon/bold.png" width="10" height="10" onclick="input_font_bold()" style="cursor:hand"/> <span id="title_colorpanel" style="position:absolute; z-index:200" class="colorpanel"></span>  </td>
    </tr>

<!--     <tr>
	 <th width="80"> <?php echo 缩略图 ?> </th>
      <td>
      <div class="upload-pic img-wrap"><div class="bk10"></div>
      <input type="hidden" name="info[thumb]" id="thumb" value="<?php echo $thumb?>">
						<a style="float:left;" href="javascript:;" onclick="javascript:flashupload('thumb_images', '<?php echo L('file_upload')?>','thumb',thumb_images,'1,jpg|jpeg|gif|bmp|png,1000,1000','content','39','<?php echo upload_key('1,jpg|jpeg|gif|bmp|png,1000,1000')?>')"><?php  if($thumb){ ?><img src="<?php echo $thumb?>" id="thumb_preview" width="135" height="113" style="cursor:hand" /> <?php } else{ ?><img src="statics/images/icon/upload-pic.png" id="thumb_preview" width="135" height="113" style="cursor:hand" /><?php } ?></a></div>
                        <br>
      <input type="button" style="width: 66px;" class="button" onclick="crop_cut($('#thumb').val());return false;" value="<?php echo 裁剪图片?>"><script type="text/javascript">function crop_cut(id){
	if (id=='') { alert('<?php echo L('please_upload_thumb')?>');return false;}
	window.top.art.dialog({title:'<?php echo L('crop_thumb')?>', id:'crop', iframe:'index.php?m=content&c=content&a=public_crop&module=phpcms&picurl='+encodeURIComponent(id)+'&input=thumb&preview=thumb_preview', width:'680px', height:'480px'}, 	function(){var d = window.top.art.dialog({id:'crop'}).data.iframe;
	d.uploadfile();return false;}, function(){window.top.art.dialog({id:'crop'}).close()});
};</script>
<input type="button" value="<?php echo 取消图片?>" onclick="$('#thumb_preview').attr('src','statics/images/icon/upload-pic.png');$('#thumb').val(' ');return false;" class="button" style="width: 66px;">
       </td>
 </tr> -->
 
	<tr>
      <th width="80"> <?php echo L('keywords');?>	  </th>
      <td><input type="text" name="info[keywords]" id="keywords" value="<?php echo $keywords?>" size="50">  <?php echo L('explode_keywords');?></td>
    </tr>

  <tr>
    <th><?php echo '缩略图' ?> ：</th>
    <td><?php echo form::images('info[thumb]', 'thumb', $thumb, 'content');?></td>
  </tr>

<tr>
 <th width="80"> <?php echo L('content');?>	  </th>
<td>
<textarea name="info[content]" id="content"><?php echo $content?></textarea>
<?php echo form::editor('content','desc','','','',1,1,'',350)?>
</td></tr>
</table>
</div>
<div class="bk10"></div>
<div class="btn">
<input type="hidden" name="info[catid]" value="<?php echo $catid;?>" />
<input type="hidden" name="edit" value="<?php echo $title ? 1 : 0;?>" />
<input type="submit" class="button" style="margin: 0 auto; display: block; width:200px;" name="dosubmit" value="<?php echo L('submit');?>" />
</div> 
  </div>

</form>
</div>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>content_addtop.js"></script>
<script language="javascript" type="text/javascript" src="<?php echo JS_PATH?>colorpicker.js"></script>

</body>
</html>
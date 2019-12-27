<?php $show_header = $show_validator = $show_scroll = 1; include $this->admin_tpl('header', 'attachment'); ?>


		<!-- 引用控制层插件样式 -->
		<link rel="stylesheet" href="<?php echo JS_PATH?>zyFile/control/css/zyUpload.css" type="text/css">
		
		<!--图片弹出层样式 必要样式-->
		<script type="text/javascript" src="<?php echo JS_PATH?>zyFile/jquery-1.7.2.js"></script>
		<!-- 引用核心层插件 -->
		<script type="text/javascript" src="<?php echo JS_PATH?>zyFile/core/zyFile.js"></script>
		<!-- 引用控制层插件 -->
		<script type="text/javascript" src="<?php echo JS_PATH?>zyFile/control/js/zyUpload.js"></script>
		<!-- 引用初始化JS -->
		<script type="text/javascript">
			$(function(){
			// 初始化插件
			$("#demo").zyUpload({
				width            :   "100%",                 // 宽度
				height           :   "",                 // 宽度
				itemWidth        :   "120px",                 // 文件项的宽度
				itemHeight       :   "100px",                 // 文件项的高度
				//url              :   "/upload/UploadAction",  // 上传文件的路径
				
				<?php
				echo 'url        : "'.APP_PATH.'index.php?m=attachment&c=attachments&a=zyfile",';  						      // 上传文件的路径
					if ($file_upload_limit==1) {
						echo "multiple         : false,";  						      // 是否可以多个文件上传
					}else{
						echo "multiple         : true,";  						      // 是否可以多个文件上传
					}
				$file__types = str_replace(array('*.',';'),array('','|'),$file_types);
				$file_accept = str_replace(array('*.',';'),array('.',','),$file_types);
				echo 'file_accept        : "'.$file_accept.'",';  			          // 只能选择的类型
				echo 'file__number       : "'.$file_upload_limit.'",';  			  // 上传文件个数
				echo 'file__size         : "'.$file_size.'",';  				      // 单位件大小
				echo 'file__types        : "'.$file__types.'",';  					  // 文件类型
				echo 'module       		 : "'.$_GET['module'].'",';  				  // 模型
				echo 'catid       		 : "'.$_GET['catid'].'",';  				  // 栏目
				echo 'userid       		 : "'.$this->userid.'",';  				      // userid
				?>
			
				
				dragDrop         : false,  						      // 是否可以拖动上传文件
				del              : true,  						      // 是否可以删除文件
				edit             : false,  						      // 是否可以重新上传文件
				tailor           : false,  						      // 是否可以截取图片
				finishDel        : false,  						      // 是否在上传文件完成后删除预览

				/* 外部获得的回调接口 */
				onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
					console.info("当前选择了以下文件：");
					console.info(selectFiles);
				},
				onProgress: function(file, loaded, total){    // 正在上传的进度的回调方法
					console.info("当前正在上传此文件：");
					console.info(file.name);
					console.info("进度等信息如下：");
					console.info(loaded);
					console.info(total);
				},   
				onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
					console.info("当前删除了此文件：");
					console.info(file.name);
				},
				onSuccess: function(file, response){          // 文件上传成功的回调方法
					console.info("此文件上传成功：");
					console.info(file.name);
				},
				onFailure: function(file, response){          // 文件上传失败的回调方法
					console.info("此文件上传失败：");
					console.info(file.name);
				},
				onComplete: function(response){           	  // 上传完成的回调方法
					console.info("文件上传完成");
					console.info(response);
				}
			});
			
		});

		</script>

<link href="<?php echo JS_PATH?>swfupload/swfupload.css" rel="stylesheet" type="text/css" />

<div class="pad-10">
    <div class="col-tab">
        <ul class="tabBut cu-li">
            <li id="tab_swf_1" <?php echo $tab_status?> onclick="SwapTab('swf','on','',5,1);"><?php echo L('upload_attachment')?></li>
            <li id="tab_swf_2" onclick="SwapTab('swf','on','',5,2);"><?php echo L('net_file')?></li>
            <?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
            <li id="tab_swf_3" onclick="SwapTab('swf','on','',5,3);set_iframe('album_list','index.php?m=attachment&c=attachments&a=album_load&args=<?php echo $args?>');"><?php echo L('gallery')?></li>
            <li id="tab_swf_4" onclick="SwapTab('swf','on','',5,4);set_iframe('album_dir','index.php?m=attachment&c=attachments&a=album_dir&args=<?php echo $args?>');"><?php echo L('directory_browse')?></li>
            <?php }?>
            <?php if($att_not_used!='') {?>
            <li id="tab_swf_5" class="on icon" onclick="SwapTab('swf','on','',5,5);"><?php echo L('att_not_used')?></li>
            <?php }?>
        </ul>
         <div id="div_swf_1" class="content pad-10 <?php echo $div_status?>">
        	<div style=" margin-right: -10px;">

			<div id="nameTip"><?php echo L('upload_up_to')?><font color="red"> <?php echo $file_upload_limit?></font> <?php echo L('attachments')?>,<?php echo L('largest')?> <font color="red"><?php echo $file_size_limit?></font>。<?php echo L('supported')?> <font style="font-family: Arial, Helvetica, sans-serif"><?php echo str_replace(array('*.',';'),array('','、'),$file_types);?></font></div>
			<!-- zyfile上传 -->
	   		<div id="demo" class="demo"></div>
	   		<!-- 记录上传的图片 删除用 -->
  			<ul id="imgbox" style="display: none;"></ul>
        	</div> 	
    		<div class="bk10"></div>
    	</div>
        <div id="div_swf_2" class="contentList pad-10 hidden">
        <div class="bk10"></div>
        	<?php echo L('enter_address')?><div class="bk3"></div><input type="text" name="info[filename]" class="input-text" value=""  style="width:350px;"  onblur="addonlinefile(this)">
		<div class="bk10"></div>
        </div>    	
    	<?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
        <div id="div_swf_3" class="contentList pad-10 hidden">
            <ul class="attachment-list">
        	 <iframe name="album-list" src="#" frameborder="false" scrolling="no" style="overflow-x:hidden;border:none" width="100%" height="345" allowtransparency="true" id="album_list"></iframe>   
        	</ul>
        </div>
        <div id="div_swf_4" class="contentList pad-10 hidden">
            <ul class="attachment-list">
        	 <iframe name="album-dir" src="#" frameborder="false" scrolling="auto" style="overflow-x:hidden;border:none" width="100%" height="330" allowtransparency="true" id="album_dir"></iframe>   
        	</ul>
        </div>
        <?php }?>
        <?php if($att_not_used!='') {?>
        <div id="div_swf_5" class="contentList pad-10">
        	<div class="explain-col"><?php echo L('att_not_used_desc')?></div>
            <ul class="attachment-list" id="album">
            <?php if(is_array($att) && !empty($att)){ foreach ($att as $_v) {?>
			<li>
				<div class="img-wrap">
					<a onclick="javascript:album_cancel(this,<?php echo $_v['aid']?>,'<?php echo $_v['src']?>')" href="javascript:;" class="off"  title="<?php echo $_v['filename']?>"><div class="icon"></div><img width="<?php echo $_v['width']?>"  path="<?php echo $_v['src']?>" src="<?php echo $_v['fileimg']?>" title="<?php echo $_v['filename']?>"></a>
				</div>
			</li>
			<?php }}?>
        	</ul>
        </div>   
        <?php }?>     
    <div id="att-status" class="hidden"></div>
     <div id="att-status-del" class="hidden"></div>
    <div id="att-name" class="hidden"></div>
<!-- swf -->
</div>
</body>
<script type="text/javascript">
if ($.browser.mozilla) {
	window.onload=function(){
	  if (location.href.indexOf("&rand=")<0) {
			location.href=location.href+"&rand="+Math.random();
		}
	}
}
function imgWrap(obj){
	$(obj).hasClass('on') ? $(obj).removeClass("on") : $(obj).addClass("on");
}

function SwapTab(name,cls_show,cls_hide,cnt,cur) {
    for(i=1;i<=cnt;i++){
		if(i==cur){
			 $('#div_'+name+'_'+i).show();
			 $('#tab_'+name+'_'+i).addClass(cls_show);
			 $('#tab_'+name+'_'+i).removeClass(cls_hide);
		}else{
			 $('#div_'+name+'_'+i).hide();
			 $('#tab_'+name+'_'+i).removeClass(cls_show);
			 $('#tab_'+name+'_'+i).addClass(cls_hide);
		}
	}
}

function addonlinefile(obj) {
	var strs = $(obj).val() ? '|'+ $(obj).val() :'';
	$('#att-status').html(strs);
}

function change_params(){
	if($('#watermark_enable').attr('checked')) {
		swfu.addPostParam('watermark_enable', '1');
	} else {
		swfu.removePostParam('watermark_enable');
	}
}
function set_iframe(id,src){
	$("#"+id).attr("src",src); 
}
function album_cancel(obj,id,source){
	var src = $(obj).children("img").attr("path");
	var filename = $(obj).attr('title');
	if($(obj).hasClass('on')){
		$(obj).removeClass("on");
		var imgstr = $("#att-status").html();
		var length = $("a[class='on']").children("img").length;
		var strs = filenames = '';
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json_del&aid='+id+'&src='+source+'&filename='+filename);
		for(var i=0;i<length;i++){
			strs += '|'+$("a[class='on']").children("img").eq(i).attr('path');
			filenames += '|'+$("a[class='on']").children("img").eq(i).attr('title');
		}
		$('#att-status').html(strs);
		$('#att-status').html(filenames);
	} else {
		var num = $('#att-status').html().split('|').length;
		var file_upload_limit = '<?php echo $file_upload_limit?>';
		if(num > file_upload_limit) {alert('<?php echo L('attachment_tip1')?>'+file_upload_limit+'<?php echo L('attachment_tip2')?>'); return false;}
		$(obj).addClass("on");
		$.get('index.php?m=attachment&c=attachments&a=swfupload_json&aid='+id+'&src='+source+'&filename='+filename);
		$('#att-status').append('|'+src);
		$('#att-name').append('|'+filename);
	}
}
</script>
</html>

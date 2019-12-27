<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header','admin');
if (empty($types)) {
	showmessage(L('请先添加类别'));
}
?>
<script type="text/javascript">
<!--
	$(function(){
	$.formValidator.initConfig({formid:"myform",autotip:true,onerror:function(msg,obj){window.top.art.dialog({content:msg,lock:true,width:'200',height:'50'}, function(){this.close();$(obj).focus();})}}); 

	$("#link_name").formValidator({onshow:"<?php echo L("input").L('link_name')?>",onfocus:"<?php echo L("input").L('link_name')?>"}).inputValidator({min:1,onerror:"<?php echo L("input").L('link_name')?>"}).ajaxValidator({type : "get",url : "",data :"m=kefu&c=kefu&a=public_name&linkid=<?php echo $linkid;?>",datatype : "html",async:'false',success : function(data){	if( data == "1" ){return true;}else{return false;}},buttons: $("#dosubmit"),onerror : "<?php echo L('link_name').L('exists')?>",onwait : "<?php echo L('connecting')?>"}).defaultPassed(); 

	// $("#link_url").formValidator({onshow:"<?php echo L("input").L('url')?>",onfocus:"<?php echo L("input").L('url')?>"}).inputValidator({min:1,onerror:"<?php echo L("input").L('url')?>"}).regexValidator({regexp:"^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&]*([^<>])*$",onerror:"<?php echo L('link_onerror')?>"})
	
	})
//-->
</script>

<div class="pad_10">
<form action="?m=kefu&c=kefu&a=add" method="post" name="myform" id="myform">
<table cellpadding="2" cellspacing="1" class="table_form" width="100%">


	<tr>
		<th width="20%"><?php echo L('typeid')?>：</th>
		<td><select name="link[typeid]" id="">
		<?php
		  $i=0;
		  foreach($types as $typeid=>$type){
		  $i++;
		?>
		<option value="<?php echo $type['typeid'];?>"><?php echo $type['name'];?></option>
		<?php }?>
		</select></td>
	</tr>
	
	<tr>
		<th width="100"><?php echo L('link_type')?>：</th>
		<td>
	<input type="radio" name="link[linktype]" value="2" checked="checked" style="border:0" onclick="$('#logolink').hide()" class="radio_style">
	<?php echo L('qq_link')?>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="link[linktype]" value="0" style="border:0" onclick="$('#logolink').hide()" class="radio_style">
	<?php echo L('word_link')?>&nbsp;&nbsp;&nbsp;&nbsp;
	<input name="link[linktype]" type="radio" value="1" style="border:0" onclick="$('#logolink').show()" class="radio_style">
	<?php echo L('logo_link')?>

		</td>
	</tr>
	<tr>
		<th width="100"><?php echo L('link_name')?>：</th>
		<td><input type="text" name="link[name]" id="link_name"
			size="30" class="input-text" value=""></td>
	</tr>

	
	<tr>
		<th width="100"><?php echo L('url')?>：</th>
		<td><input type="text" name="link[url]" id="link_url"
			size="30" class="input-text">QQ客服请填写QQ号码</td>
	</tr>
	
	<tr id="logolink" style="display: none;">
		<th width="100"><?php echo L('logo')?>：</th>
		<td><?php echo form::images('link[logo]', 'logo', '', 'kefu')?></td>
	</tr>
	
<!-- 	<tr>
		<th width="100"><?php echo L('username')?>：</th>
		<td><input type="text" name="link[username]" id="link_username"
			size="30" class="input-text"></td>
	</tr> -->

 
<!-- 	<tr>
		<th><?php echo L('web_description')?>：</th>
		<td><textarea name="link[introduce]" id="introduce" cols="50"
			rows="6"></textarea></td>
	</tr> -->

 
<!-- 	<tr>
		<th><?php echo L('elite')?>：</th>
		<td><input name="link[elite]" type="radio" value="1" >&nbsp;<?php echo L('yes')?>&nbsp;&nbsp;<input
			name="link[elite]" type="radio" value="0" checked>&nbsp;<?php echo L('no')?></td>
	</tr> -->
	 
	<tr>
		<th><?php echo L('passed')?>：</th>
		<td><input name="link[passed]" type="radio" value="1" checked>&nbsp;<?php echo L('yes')?>&nbsp;&nbsp;<input
			name="link[passed]" type="radio" value="0">&nbsp;<?php echo L('no')?></td>
	</tr>

<tr>
		<th></th>
		<td><input type="hidden" name="forward" value="?m=kefu&c=kefu&a=add"> <input
		type="submit" name="dosubmit" id="dosubmit" class="dialog"
		value=" <?php echo L('submit')?> "></td>
	</tr>

</table>
</form>
</div>
</body>
</html> 
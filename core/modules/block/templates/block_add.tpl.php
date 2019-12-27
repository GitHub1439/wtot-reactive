<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');
?>
<script type="text/javascript" src="<?php echo JS_PATH ?>jQuery.Hz2Py-min.js"></script>
<script type="text/javascript">
<!--
  $(function(){
    $("#name").live("keyup keydown change blur",function (){
      var pinyin = $(this).toPinyin();
      pinyin = pinyin.replace(/\s/g, "");
      $("#pos").val(pinyin.toLowerCase());
    });
  })
//-->
</script>
<div class="pad-10">
<form action="?m=block&c=block_admin&a=<?php echo ROUTE_A?>" method="post" id="myform">
<div>
<fieldset>
	<legend><?php echo L('block_configuration')?></legend>
	<table width="100%"  class="table_form">
    <tr>
    <th width="80"><?php echo L('name')?>：</th>
    <td class="y-bg"><input type="text" name="name" id="name" size="30" value="<?php echo isset($data['name']) ?  $data['name'] : '';?>" /></td>
  	</tr>
    <tr>
    <th width="80"><?php echo L('display_position')?>：</th>
    <td class="y-bg"><input type="text" name="pos" id="pos" size="30" value="" /></td>
  	</tr>
  	<tr>
    <th width="80"><?php echo L('type')?>：</th>
    <td class="y-bg"><?php echo form::radio(array('1'=>L('code'), '2'=>L('table_style'), '3'=>L('文本型')), (isset($data['type']) ? $data['type'] : 3), 'name="type"'.(ROUTE_A=='edit' ? ' disabled = "disabled"' : ''))?></td>
  	</tr>
</table>
</fieldset>
<div class="bk15"></div>
<fieldset>
	<legend><?php echo L('permission_configuration')?></legend>
	<table width="100%"  class="table_form">
    <tr>
    <th width="80"><?php echo L('role')?>：</th>
    <td class="y-bg"><?php echo form::checkbox($administrator, (isset($priv_list) ? implode(',', $priv_list) : ''), 'name="priv[]"')?></td>
  	</tr>
</table>
</fieldset>
    <input type="submit" class="dialog" id="dosubmit" name="dosubmit" value="" />
</div>
</div>
</form>
</body>
</html>
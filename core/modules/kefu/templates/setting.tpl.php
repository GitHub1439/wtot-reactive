<?php 
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');
?>
<form method="post" action="?m=kefu&c=kefu&a=setting">
<table width="100%" cellpadding="0" cellspacing="1" class="table_form"> 
 
	<tr>
		<th width="20%"><?php echo L('application_or_not')?>：</th>
		<td><input type='radio' name='setting[is_open]' value='1' <?php if($is_open == 1) {?>checked<?php }?>> <?php echo L('yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	  <input type='radio' name='setting[is_open]' value='0' <?php if($is_open == 0) {?>checked<?php }?>> <?php echo L('no')?></td>
	</tr>
	<tr>
		<th><?php echo L('code_or_not')?>：</th>
		<td>
		<input type='radio' name='setting[typeid]' value='1' <?php if($typeid == 1) {?>checked<?php }?>> 1 &nbsp;&nbsp;&nbsp;&nbsp;
	<!--   <input type='radio' name='setting[typeid]' value='2' <?php if($typeid == 2) {?>checked<?php }?>> 2</td> -->
	</tr>
	 
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" name="dosubmit" id="dosubmit" value=" <?php echo L('ok')?> " class="button">&nbsp;</td>
	</tr>
</table>
</form>
</body>
</html>
 
<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_ADMIN') or exit('No permission resources.');
$show_dialog = 1;
include $this->admin_tpl('header','admin');
?>
<div class="pad-lr-10">
<form name="searchform" action="" method="post" >

<table width="100%" cellspacing="0" class="search-form">
    <tbody>
		<tr>
		<td><div class="explain-col">指定编辑:  <select id="username" name="username">
        											<option value='' style='text-align:center'>全体编辑</option>
        											<?php
														 
														foreach($alladm as $v){
															echo "<option value='$v[username]'>$v[realname]</option>";	
														}
													?>
                                               </select>   指定时间段:  <?php
											    echo form::date('start_time',0,'');?> <?php echo L('to')?>   <?php echo form::date('end_time',0,'');?>
                                              　排序方法:  
              <select name="listorder" id="listorder">
                <option value="pvs">PV</option>
                <option value="ips">IP</option>
                <option value="ac">文章数</option>
              </select>                                           
<input type="submit" value=" 查看 " class="button" name="dosubmit" />
		</div>
		</td>
		</tr>
    </tbody>
</table>
</form>
<script>
	$('#username').val('<?php echo $username;?>');
	$('#start_time').val('<?php echo date('Y-m-d',$startTime);?>');
	$('#end_time').val('<?php echo date('Y-m-d',$endTime);?>');
	$('#listorder').val('<?php echo $listorder;?>');
</script>
<div class="table-list" style="">
<table width="380" cellspacing="0" style="float:left; margin-right:20px;">
	<thead>
		<tr>
			<th width="20%" align="left">编辑姓名&nbsp;</th>
			<th width='20%' align="left">文章数</th>
            <th width="20%" align="left">PV</th>
            <th width="20%" align="left">IP</th>
            <th width="20%" align="left">有效外部IP</th>
          </tr>
	</thead>
<tbody>
<?php
foreach($data as $v){
?>
    <tr>
        <td align="left" style="color:#06C"><?php echo $v['realname'];?>&nbsp;</td>
        <td align="left" style="text-indent:0px;"><strong><?php echo $v['ac'];?></strong></td>
        <td align="left" style="color:#F60"><strong><?php echo $v['pvs'];?></strong></td>
        <td align="left" style="color:#090"><strong><?php echo $v['ips'];?></strong></td>
        <td align="center" style="color:#090"><strong><?php echo ($v['ips'])-($v['ac']);?></strong></td>
        </tr>
<?php
	}
?>
</tbody>
</table>
</div>
</div>
</body>
</html>


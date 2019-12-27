<?php
defined('IN_ADMIN') or exit('No permission resources.');

include $this->admin_tpl('header', 'admin');
?>
<div class="pad-lr-10">

<div class="table-list">
<table width="100%" cellspacing="0">
	<thead>
		<tr>
			<th width="59" align="center">用户ID</th>
			<th width="81">用户名</th> 
			<th width="124">用户手机号</th>
			<th width="98">用户邮件</th>
			<th width="114">信息备注</th>
			<th width="45" align="center">状态</th> 
			<th width="131" align="center">在线预约管理</th>
		</tr>
	</thead>
<tbody>
<?php
if(is_array($infos)){
	foreach($infos as $info){
?>
	<tr>
		<td align="center" width="59"><div align="center"><?php echo $info['userid'];
?></div></td>
		<td align="center"><div align="center"><?php echo $info['username'];
?></div></td> 
		<td><div align="center"><?php echo $info['mobile'];
?></div></td>
		<td><div align="center"><?php echo $info['useremail'];
?></div></td>
		<td><div align="center"><?php echo $info['beizhu'];
?></div></td>
		<td align="center" width="45"> <div align="center"><?php 
		if ($info['ischeck']==2) {	
			echo "<font color='green'>通过</font>";
		}else {
			echo "<a href='?m=yuyue&c=yuyue&a=check_yuyue&userid={$info['userid']}'><font color='red'>审核</font></a>";
		}
?></div></td>
		 <td align="center" width="131"><div align="center"><a href="?m=yuyue&c=yuyue&a=edit_yuyue&userid=<?php echo $info['userid']?>"
			><?php echo L('edit')?></a> |  <a
			href='?m=yuyue&c=yuyue&a=delete_yuyue&userid=<?php echo $info['userid']?>'
			onClick="return confirm('<?php echo L('confirm', array('message' => new_addslashes($info['username'])))?>')"><?php echo L('delete')?></a> </div></td>
	</tr>
	<?php
	}
}
?>
</tbody>
</table>
<div class="btn"></div>

<div id="pages" class="text-c"><?php echo $pages;?></div>
</div>
</body>
</html>

<?php
/**
 * BY 魏磐 2014/2/26
 **/
defined('IN_ADMIN') or exit('No permission resources.');
$show_dialog = 1;
include $this->admin_tpl('header','admin');
?>
<div class="pad-lr-10">
<form name="searchform" action="" method="get" >
<input type="hidden" value="performance" name="m">
<input type="hidden" value="performance" name="c">
<input type="hidden" value="plist" name="a">
<input type="hidden" value="<?php echo $pc_hash;?>" name="pc_hash">
<input type="hidden" value="<?php echo $_GET['menuid']; ?>" name="menuid">
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
                <option value="updatetime">发布时间</option>
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
<table width="100%" cellspacing="0" style="float:left; margin-right:20px;">
	<thead>
		<tr>
			<th>文章标题连接</th>
            <th>PV</th>
            <th>IP</th>
            <th>编辑姓名</th>
            <th>发表时间</th>
          </tr>
	</thead>
<tbody>
<?php
foreach($data as $v){
?>
    <tr>
        <td align="center" style="color:#06C"><a href="<?php echo $v['url'];?>" target="_blank"><?php echo $v['title'];?></a></td>        
        <td align="center" style="color:#F60"><strong><?php echo $v['pvs'];?></strong></td>
        <td align="center" style="color:#090"><strong><?php echo $v['ips'];?></strong></td>
        <td align="center"><strong><?php echo $v['realname'];?></strong></td>
        <td align="center"><strong><?php echo date("Y-m-d H:i:s",$v['updatetime']);?></strong></td>
        </tr>
<?php
	}
?>
</tbody>
</table>
<div id="pages"><?php echo $pages;?></div>
</div>
</div>
</body>
</html>


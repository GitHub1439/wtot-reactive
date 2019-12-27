<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');
?>
<div class="subnav">
    <div class="content-menu ib-a blue line-x">
    <a class="add fb" href="javascript:add()"><em>添加碎片</em></a><span>|</span>
    <a class="fb" href="javascript:visual()"><em>可视化编辑</em></a>
    </div>
</div>
<div class="pad_10">
<div class="table-list">

    <table width="100%" cellspacing="0">
        <thead>
		<tr>
		<th><?php echo L('name')?></th>
		<th><?php echo L('内容')?></th>
		<th width="100"><?php echo L('type')?></th>
		<th width="200"><?php echo L('display_position')?></th>
		<th width="200"><?php echo L('operations_manage')?></th>
		</tr>
        </thead>
        <tbody>
<?php 
if(is_array($list)):
	foreach($list as $v):
?>
<tr>
<td align="center"><?php echo $v['name']?></td>
<td><?php if($v['type']!=2) { echo str_cut(strip_tags($v['data']),100,'...');} ?></td>
<td align="center"><?php if($v['type']==1) {echo L('code');} elseif($v['type']==3) {echo L('文本型');} else {echo L('table_style');}?></td>
<td><?php echo '{pc:block pos='.$v['pos'].'}{/pc}' ?></td>
<td align="center"><a href="javascript:block_update(<?php echo $v['id']?>, '<?php echo $v['name']?>')"><?php echo L('updates')?></a> | <a href="javascript:edit(<?php echo $v['id']?>, '<?php echo $v['name']?>')"><?php echo L('修改类型')?></a> | <a href="?m=block&c=block_admin&a=del&id=<?php echo $v['id']?>" onclick="return confirm('<?php echo L('confirm', array('message'=>$v['name']))?>')"><?php echo L('delete')?></a></td>
</tr>
<?php 
	endforeach;
endif;
?>
</tbody>
</table>
</div>
</div>
<div id="pages"><?php echo $pages?></div>
<div id="closeParentTime" style="display:none"></div>
<script type="text/javascript">
<!--
function visual(id, name) {
	if(window.top.$("#current_pos").data('clicknum')==1 || window.top.$("#current_pos").data('clicknum')==null) {
		parent.document.getElementById('display_center_id').style.display='';
		parent.document.getElementById('center_frame').src = '?m=content&c=content&a=public_categorys&type=add&from=block&pc_hash=<?php echo $_SESSION['pc_hash'];?>';
		window.top.$("#current_pos").data('clicknum',0);
	}
}

function block_update(id, name) {
	window.top.art.dialog({id:'edit'}).close();
	window.top.art.dialog({title:'<?php echo L('edit')?>《'+name+'》',id:'edit',iframe:'?m=block&c=block_admin&a=block_update&id='+id,width:'1000',height:'500'}, function(){var d = window.top.art.dialog({id:'edit'}).data.iframe;d.document.getElementById('dosubmit').click();return false;}, function(){window.top.art.dialog({id:'edit'}).close()});
}

function edit(id, name) {
	window.top.art.dialog({id:'edit'}).close();
	window.top.art.dialog({title:'<?php echo L('edit')?>《'+name+'》',id:'edit',iframe:'?m=block&c=block_admin&a=edit&id='+id,width:'1000',height:'500'}, function(){var d = window.top.art.dialog({id:'edit'}).data.iframe;d.document.getElementById('dosubmit').click();return false;}, function(){window.top.art.dialog({id:'edit'}).close()});
}

function add() {
	window.top.art.dialog({id:'edit'}).close();
	window.top.art.dialog({title:'添加碎片',id:'edit',iframe:'?m=block&c=block_admin&a=add',width:'1000',height:'500'}, function(){var d = window.top.art.dialog({id:'edit'}).data.iframe;d.document.getElementById('dosubmit').click();return false;}, function(){window.top.art.dialog({id:'edit'}).close()});
}
//-->
</script>
</body>
</html>
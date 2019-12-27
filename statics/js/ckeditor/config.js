/*
Copyright (c) 2003-2010, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	config.uiColor = '#f7f5f4';
	config.width = '';
	config.removePlugins = 'elementspath,scayt';
	config.disableNativeSpellChecker = false;
	config.resize_dir = 'vertical';
	config.keystrokes =[[ CKEDITOR.CTRL + 13 /*Enter*/, 'maximize' ]];	
	config.extraPlugins = 'capture,videoforpc';
	config.enterMode = CKEDITOR.ENTER_BR; 
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.indentOffset = 2;
	config.indentUnit = 'em';

	//对address标签进行格式化 plugins/format/plugin.js
    config.format_address = { element : 'address', attributes : { class : 'styledAddress' } };
    //对DIV标签自动进行格式化 plugins/format/plugin.js
    config.format_div = { element : 'div', attributes : { class : 'normalDiv' } };
    //对H1标签自动进行格式化 plugins/format/plugin.js
    config.format_h1 = { element : 'h1', attributes : { class : 'contentTitle1' } };
    //对H2标签自动进行格式化 plugins/format/plugin.js
    config.format_h2 = { element : 'h2', attributes : { class : 'contentTitle2' } };
    //对H3标签自动进行格式化 plugins/format/plugin.js
    config.format_h1 = { element : 'h3', attributes : { class : 'contentTitle3' } };
    //对H4标签自动进行格式化 plugins/format/plugin.js
    config.format_h1 = { element : 'h4', attributes : { class : 'contentTitle4' } };
    //对H5标签自动进行格式化 plugins/format/plugin.js
    config.format_h1 = { element : 'h5', attributes : { class : 'contentTitle5' } };
    //对H6标签自动进行格式化 plugins/format/plugin.js
    config.format_h1 = { element : 'h6', attributes : { class : 'contentTitle6' } };
    //对P标签自动进行格式化 plugins/format/plugin.js
    config.format_p = { element : 'p', attributes : { class : 'normalPara' } };
    //对PRE标签自动进行格式化 plugins/format/plugin.js
    config.format_pre = { element : 'pre', attributes : { class : 'code' } };

    //当从word里复制文字进来时，是否进行文字的格式化去除 plugins/pastefromword/plugin.js
    config.pasteFromWordIgnoreFontFace = true; //默认为忽略格式
    //是否使用<h1><h2>等标签修饰或者代替从word文档中粘贴过来的内容 plugins/pastefromword/plugin.js
    config.pasteFromWordKeepsStructure = true;
    //从word中粘贴内容时是否移除格式 plugins/pastefromword/plugin.js
    config.pasteFromWordRemoveStyle = true;

	config.format_tags = 'p;h1;h2;h3;h4;h5;h6;pre;address';

	config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;

};
CKEDITOR.on( 'instanceReady', function( ev ){ with (ev.editor.dataProcessor.writer) { setRules("p", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("h1", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("h2", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("h3", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("h4", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("h5", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("div", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("table", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("tr", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("td", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("iframe", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("li", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("ul", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); setRules("ol", {indent : false, breakAfterOpen : false, breakBeforeClose : false} ); } }); 
//CKEDITOR.plugins.load('pgrfilemanager');
function insert_page(editorid)
{
	var editor = CKEDITOR.instances[editorid];
	editor.insertHtml('[page]');
	if($('#paginationtype').val()) {
		$('#paginationtype').val(2);
		$('#paginationtype').css("color","red");
	}
}

function insert_page_title(editorid,insertdata)
{
	if(insertdata)
	{
		var editor = CKEDITOR.instances[editorid];
		var data = editor.getData();
		var page_title_value = $("#page_title_value").val();
		if(page_title_value=='')
		{
			$("#msg_page_title_value").html("<font color='red'>请输入子标题</font>");
			return false;
		}
		page_title_value = '[page]'+page_title_value+'[/page]';
		editor.insertHtml(page_title_value);
		$("#page_title_value").val('');
		$("#msg_page_title_value").html('');
		if($('#paginationtype').val()) {
			$('#paginationtype').val(2);
			$('#paginationtype').css("color","red");
		}
	}
	else
	{
		$("#page_title_div").slideDown("fast");
	}
}
var objid = MM_objid = key = 0;
function file_list(fn,url,obj) {
	$('#MM_file_list_editor1').append('<div id="MM_file_list_'+fn+'">'+url+' <a href=\'#\' onMouseOver=\'javascript:FilePreview("'+url+'", 1);\' onMouseout=\'javascript:FilePreview("", 0);\'>查看</a> | <a href="javascript:insertHTMLToEditor(\'<img src='+url+'>\',\''+fn+'\')">插入</A> | <a href="javascript:del_file(\''+fn+'\',\''+url+'\','+fn+')">删除</a><br>');
}


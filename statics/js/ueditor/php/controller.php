<?php
//header('Access-Control-Allow-Origin: http://www.baidu.com'); //设置http://www.baidu.com允许跨域访问
//header('Access-Control-Allow-Headers: X-Requested-With,X_Requested_With'); //设置允许的跨域header
date_default_timezone_set("Asia/chongqing");
error_reporting(E_ERROR);
header("Content-Type: text/html; charset=utf-8");

$configs = include "../../../../caches/configs/system.php";
//$CONFIG = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents("config.json")), true);
$CONFIG = array (
    /* 上传图片配置项 */
    'imageActionName'=>'uploadimage', /* 执行上传图片的action名称 */
    'siteid'=>$_GET["siteid"],
    'imageFieldName'=>'upfile', /* 提交的图片表单名称 */
    'imageMaxSize'=>2048000, /* 上传大小限制，单位B */
    'imageAllowFiles'=>array('.png', '.jpg', '.jpeg', '.gif', '.bmp'), /* 上传图片格式显示 */
    'imageCompressEnable'=>true, /* 是否压缩图片,默认是true */
    'imageCompressBorder'=>1600, /* 图片压缩最长边限制 */
    'imageInsertAlign'=>'none', /* 插入的图片浮动方式 */
    'imageUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 图片访问路径前缀 */
    'imagePathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
                                /* {filename} 会替换成原文件名,配置这项需要注意中文乱码问题 */
                                /* {rand:6} 会替换成随机数,后面的数字是随机数的位数 */
                                /* {time} 会替换成时间戳 */
                                /* {yyyy} 会替换成四位年份 */
                                /* {yy} 会替换成两位年份 */
                                /* {mm} 会替换成两位月份 */
                                /* {dd} 会替换成两位日期 */
                                /* {hh} 会替换成两位小时 */
                                /* {ii} 会替换成两位分钟 */
                                /* {ss} 会替换成两位秒 */
                                /* 非法字符 \ =>* ? ' < > | */
                                /* 具请体看线上文档=>fex.baidu.com/ueditor/#use-format_upload_filename */

    /* 涂鸦图片上传配置项 */
    'scrawlActionName'=>'uploadscrawl', /* 执行上传涂鸦的action名称 */
    'siteid'=>$_GET["siteid"],
    'scrawlFieldName'=>'upfile', /* 提交的图片表单名称 */
    'scrawlPathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'scrawlMaxSize'=>2048000, /* 上传大小限制，单位B */
    'scrawlUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 图片访问路径前缀 */
    'scrawlInsertAlign'=>'none',

    /* 截图工具上传 */
    'snapscreenActionName'=>'uploadimage', /* 执行上传截图的action名称 */
    'snapscreenPathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'snapscreenUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 图片访问路径前缀 */
    'snapscreenInsertAlign'=>'none', /* 插入的图片浮动方式 */

    /* 抓取远程图片配置 */
    'catcherLocalDomain'=>array('127.0.0.1', 'localhost', 'img.baidu.com'),
    'catcherActionName'=>'catchimage', /* 执行抓取远程图片的action名称 */
    'siteid'=>$_GET["siteid"],
    'catcherFieldName'=>'source', /* 提交的图片列表表单名称 */
    'catcherPathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'catcherUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 图片访问路径前缀 */
    'catcherMaxSize'=>2048000, /* 上传大小限制，单位B */
    'catcherAllowFiles'=>array('.png', '.jpg', '.jpeg', '.gif', '.bmp'), /* 抓取图片格式显示 */

    /* 上传视频配置 */
    'videoActionName'=>'uploadvideo', /* 执行上传视频的action名称 */
    'siteid'=>$_GET["siteid"],
    'videoFieldName'=>'upfile', /* 提交的视频表单名称 */
    'videoPathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'videoUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 视频访问路径前缀 */
    'videoMaxSize'=>512000000, /* 上传大小限制，单位B，默认500MB */
    'videoAllowFiles'=>array(
        '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
        '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid'), /* 上传视频格式显示 */

    /* 上传文件配置 */
    'fileActionName'=>'uploadfile', /* controller里,执行上传视频的action名称 */
    'siteid'=>$_GET["siteid"],
    'fileFieldName'=>'upfile', /* 提交的文件表单名称 */
    'filePathFormat'=>$configs["web_path"].'uploadfile/{yyyy}{mm}{dd}/{time}{rand:6}', /* 上传保存路径,可以自定义保存路径和文件名格式 */
    'fileUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 文件访问路径前缀 */
    'fileMaxSize'=>51200000, /* 上传大小限制，单位B，默认50MB */
    'fileAllowFiles'=>array(
        '.png', '.jpg', '.jpeg', '.gif', '.bmp',
        '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
        '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid',
        '.rar', '.zip', '.tar', '.gz', '.7z', '.bz2', '.cab', '.iso',
        '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.pdf', '.txt', '.md', '.xml'
    ), /* 上传文件格式显示 */

    /* 列出指定目录下的图片 */
    'imageManagerActionName'=>'listimage', /* 执行图片管理的action名称 */
    'siteid'=>$_GET["siteid"],
    'imageManagerListPath'=>$configs["web_path"].'uploadfile/', /* 指定要列出图片的目录 */
    'imageManagerListSize'=>20, /* 每次列出文件数量 */
    'imageManagerUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 图片访问路径前缀 */
    'imageManagerInsertAlign'=>'none', /* 插入的图片浮动方式 */
    'imageManagerAllowFiles'=>array('.png', '.jpg', '.jpeg', '.gif', '.bmp'), /* 列出的文件类型 */

    /* 列出指定目录下的文件 */
    'fileManagerActionName'=>'listfile', /* 执行文件管理的action名称 */
    'siteid'=>$_GET["siteid"],
    'fileManagerListPath'=>$configs["web_path"].'uploadfile/', /* 指定要列出文件的目录 */
    'fileManagerUrlPrefix'=>substr($configs["app_path"],0,-strlen($configs["web_path"])), /* 文件访问路径前缀 */
    'fileManagerListSize'=>20, /* 每次列出文件数量 */
    'fileManagerAllowFiles'=>array(
        '.png', '.jpg', '.jpeg', '.gif', '.bmp',
        '.flv', '.swf', '.mkv', '.avi', '.rm', '.rmvb', '.mpeg', '.mpg',
        '.ogg', '.ogv', '.mov', '.wmv', '.mp4', '.webm', '.mp3', '.wav', '.mid',
        '.rar', '.zip', '.tar', '.gz', '.7z', '.bz2', '.cab', '.iso',
        '.doc', '.docx', '.xls', '.xlsx', '.ppt', '.pptx', '.pdf', '.txt', '.md', '.xml'
    ) /* 列出的文件类型 */
);
$action = $_GET['action'];

switch ($action) {
    case 'config':
        $result =  json_encode($CONFIG);
        break;

    /* 上传图片 */
    case 'uploadimage':
    /* 上传涂鸦 */
    case 'uploadscrawl':
    /* 上传视频 */
    case 'uploadvideo':
    /* 上传文件 */
    case 'uploadfile':
        $result = include("action_upload.php");
        break;

    /* 列出图片 */
    case 'listimage':
        $result = include("action_list.php");
        break;
    /* 列出文件 */
    case 'listfile':
        $result = include("action_list.php");
        break;

    /* 抓取远程文件 */
    case 'catchimage':
        $result = include("action_crawler.php");
        break;

    default:
        $result = json_encode(array(
            'state'=> '请求地址出错'
        ));
        break;
}

/* 输出结果 */
if (isset($_GET["callback"])) {
    if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
        echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
    } else {
        echo json_encode(array(
            'state'=> 'callback参数不合法'
        ));
    }
} else {
    echo $result;
}
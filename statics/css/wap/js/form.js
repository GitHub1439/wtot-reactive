/**
 * Created by Administrator on 2016/4/19.
 */
function  toSubmit(){
    var user_dw=document.getElementById('user_dw').value;
    var user_name=document.getElementById('user_name').value;
    var user_year=document.getElementById('user_year').value;
    var user_nation=document.getElementById('user_nation').value;
    var user_grad=document.getElementById('user_grad').value;
    var user_edu=document.getElementById('user_edu').value;
    var user_en=document.getElementById('user_en').value;
    var user_phone=document.getElementById('user_phone').value;
    var user_email=document.getElementById('user_email').value;
    var user_work=document.getElementById('user_work').value;
    var numb=/^0?1[3|4|5|8][0-9]\d{8}$/;
    var reyrule=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/ //邮箱
    if( user_dw==""){
        alert("对不起，应聘职位不能为空！");
        return false;
    }
    else if(user_name==""){
        alert("对不起，姓名不能为空！");
        return false;
    }
    else if(user_name.length<4||user_name.length>12){
        alert("对不起，姓名长度限制为：4-16位之间 ");
        return false;
    }
    else if(user_year==""){
        alert("对不起，出生年月不能为空!");
        return false;
    }
    else if(user_nation==""){
        alert("对不起，民族不能为空！");
        return false;
    }
    else if(user_grad==""){
        alert("对不起，毕业时间不能为空！");
        return false;
    }
    else if(user_edu==""){
        alert("对不起，学历不能为空！");
        return false;
    }
    else if(user_en==""){
        alert("对不起，外语不能为空！");
        return false;
    }
    else if(user_phone==""){
        alert("对不起，电话不能为空！");
        return false;
    }else if(!numb.test(user_phone)){
        alert("对不起，电话格式不正确！");
        return false;
    }else if(user_email==""){
        alert("对不起，注册邮箱不能为空！");
        return false;
    }else if (!reyrule.test(user_email)){
        alert("对不起，您输入的邮箱格式不正确！！");
        return false;
    }else if(user_work==""){
        alert("对不起，工作经历不能为空！");
        return false;
    }
    //如果上述表单元素都通过，则提交表单
    document.getElementById("myform").submit();
}
function formReset()
{
    document.getElementById("myform").reset();
}
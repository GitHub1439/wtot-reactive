/**
 * Created by Administrator on 2016/4/5.
 */

$(function(){
    $(".menu_icon").click(function(){
        if(!$(".nav").is(":hidden")){
            $(".nav").slideUp();
        }else{
            $(".nav").slideDown();
        }
    });
})
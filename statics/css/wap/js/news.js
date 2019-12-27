/**
 * Created by Administrator on 2016/4/6.
 */
$(function($) {
    $(".newtitleh3").click(function() {
        if (!$(this).parent().hasClass("category-select")) {
            $(this).parent().addClass("category-select");
        } else {
            $(this).parent().removeClass("category-select");
        }
    });
});
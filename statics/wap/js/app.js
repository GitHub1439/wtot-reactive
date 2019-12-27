 

//锚点跳转
 $(function(){$('a[href*=#],area[href*=#]').click(function(){if(location.pathname.replace(/^\//,'')==this.pathname.replace(/^\//,'')&&location.hostname==this.hostname){var $target=$(this.hash);$target=$target.length&&$target||$('[name='+this.hash.slice(1)+']');if($target.length){var targetOffset=$target.offset().top;$('html,body').animate({scrollTop:targetOffset},1000);return false}}})});

(function($) {
 
  
 $(".ar_article p:last").css("padding","0");

	
})(jQuery);

$(document).mouseup(function(e){

	  var _con = $('#bnt_sub_nav');   // 设置目标区域

	  if(!_con.is(e.target) && _con.has(e.target).length === 0){ // Mark 1

		$("#sub_nav_content").slideUp();

	  }

	});
	
window.onscroll=function(){
 if($(window).scrollTop()>100){
	 
	 $("#header").addClass("on");
	 }
	  else if($(window).scrollTop()<100){
	 $("#header").removeClass("on");
	 }
 };	 
	
$(function() {
  $('.am-slider-manual').flexslider({
 
  animation: "slide",             // String: ["fade"|"slide"]，动画效果
  easing: "swing",                // String: 滚动动画计时函数
  direction: "horizontal",        // String: 滚动方向 ["horizontal"|"vertical"]
  reverse: false,                 // Boolean: 翻转 slide 运动方向
  animationLoop: true,            // Boolean: 是否循环播放
  smoothHeight: false,            // Boolean: 当 slide 图片比例不一样时
                                  // "true": 父类自动适应图片高度
                                  // "false": 不自动适应，父类高度为图片的最高高度，默认为false
	itemWidth:80,
	itemMargin:3,
  startAt: 0,                     // Integer: 开始播放的 slide，从 0 开始计数
  slideshow: false,                // Boolean: 是否自动播放
  slideshowSpeed: 5000,           // Integer: ms 滚动间隔时间
  animationSpeed: 600,            // Integer: ms 动画滚动速度
  initDelay: 0,                   // Integer: ms 首次执行动画的延迟
  randomize: false,               // Boolean: 是否随机 slide 顺序

  // Usability features
  pauseOnAction: true,            // Boolean: 用户操作时停止自动播放
  pauseOnHover: false,            // Boolean: 悬停时暂停自动播放
  useCSS: true,                   // Boolean: 是否使用 css3 transition
  touch: true,                    // Boolean: 允许触摸屏触摸滑动滑块
  video: false,                   // Boolean: 使用视频的 slider，防止 CSS3 3D 变换毛刺

  // Primary Controls
  controlNav: false,               // Boolean: 是否创建控制点
  directionNav: false,             // Boolean: 是否创建上/下一个按钮（previous/next）
  prevText: "Previous",           // String: 上一个按钮文字
  nextText: "Next",               // String: 下一个按钮文字
  
  });
});

$(document).mouseup(function(e){
	  var _con = $('#bnt_search,#search_content');   // 设置目标区域
	  if(!_con.is(e.target) && _con.has(e.target).length === 0){ // Mark 1
		$("#search_content").slideUp();
		$("#bnt_search").toggleClass("on");
	  }
	});


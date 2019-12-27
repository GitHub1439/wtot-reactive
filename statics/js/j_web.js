/*====================================页面配置====================================*/
$(function() {

	  $('#nav').onePageNav({
			currentClass: 'on',
			changeHash: false,
			scrollSpeed: 750,
			scrollThreshold: 0.5,
			filter: '',
			easing: 'swing',
			begin: function() {
				//I get fired when the animation is starting
			},
			end: function() {
				//I get fired when the animation is ending
			},
			scrollChange: function($currentListItem) {
				//I get fired when you enter a section and I pass the list item of the section
			}
		});

	$("#sy_application li.li1").hover(function(){

     $("#section2 .content .line").css("left","0");
	},function(){
		 
	}); 
	$("#sy_application li.li2").hover(function(){

     $("#section2 .content .line").css("left","367px");
	},function(){
		 
	}); 
	$("#sy_application li.li3").hover(function(){

     $("#section2 .content .line").css("left","734px");
	},function(){
		 
	}); 
	
 	$("#s_news").slide({mainCell:".bd ul",autoPlay:true,effect:"topLoop",vis:1,scroll:1,trigger:"click"});
	
	$("#bnt_site_map").click(function() {
		 $("#nav").animate({right:"0"});
	  });
	$("#bnt_nav_close").click(function() {
		 $("#nav").animate({right:"-200px"});
	  });
	
	 $("#bnt_ewm").click(function() {
		 $("#fix_ewm_box").fadeIn();
	  });
});

var x = document.getElementById("bg_music");
x.volume = 0.2;
alert(x.volume);
 


window.onscroll=function(){
 if($(window).scrollTop()>100){
	 
	 $("#header").addClass("on");
	 }
	  else if($(window).scrollTop()<100){
	 $("#header").removeClass("on");
	 }
 };	 



$(document).mouseup(function(e){
	  var _con = $('#bnt_site_map,#nav');   // 设置目标区域
	  if(!_con.is(e.target) && _con.has(e.target).length === 0){ // Mark 1
		 $("#nav").animate({right:"-200px"});
		 $("#fix_ewm_box").fadeOut();
	  }
	});


 
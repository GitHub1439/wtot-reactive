	
/* scroll 3.1.2  */(function(e){var r=false,w=false,B=5E3,C=2E3,D=function(){var e=document.getElementsByTagName("script"),e=e[e.length-1].src.split("?")[0];return e.split("/").length>0?e.split("/").slice(0,-1).join("/")+"/":""}(),p=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||false,q=window.cancelRequestAnimationFrame||window.webkitCancelRequestAnimationFrame||window.mozCancelRequestAnimationFrame||
window.oCancelRequestAnimationFrame||window.msCancelRequestAnimationFrame||false,x=false,E=function(){if(x)return x;var e=document.createElement("DIV"),c={haspointerlock:"pointerLockElement"in document||"mozPointerLockElement"in document||"webkitPointerLockElement"in document};c.isopera="opera"in window;c.isopera12=c.isopera&&"getUserMedia"in navigator;c.isie="all"in document&&"attachEvent"in e&&!c.isopera;c.isieold=c.isie&&!("msInterpolationMode"in e.style);c.isie7=c.isie&&!c.isieold&&(!("documentMode"in
document)||document.documentMode==7);c.isie8=c.isie&&"documentMode"in document&&document.documentMode==8;c.isie9=c.isie&&"performance"in window&&document.documentMode>=9;c.isie10=c.isie&&"performance"in window&&document.documentMode>=10;c.isie9mobile=/iemobile.9/i.test(navigator.userAgent);if(c.isie9mobile)c.isie9=false;c.isie7mobile=!c.isie9mobile&&c.isie7&&/iemobile/i.test(navigator.userAgent);c.ismozilla="MozAppearance"in e.style;c.iswebkit="WebkitAppearance"in e.style;c.ischrome="chrome"in window;
c.ischrome22=c.ischrome&&c.haspointerlock;c.cantouch="ontouchstart"in document.documentElement||"ontouchstart"in window;c.hasmstouch=window.navigator.msPointerEnabled||false;c.ismac=/^mac$/i.test(navigator.platform);c.isios=c.cantouch&&/iphone|ipad|ipod/i.test(navigator.platform);c.isios4=c.isios&&!("seal"in Object);c.isandroid=/android/i.test(navigator.userAgent);c.trstyle=false;c.hastransform=false;c.hastranslate3d=false;c.transitionstyle=false;c.hastransition=false;c.transitionend=false;for(var h=
["transform","msTransform","webkitTransform","MozTransform","OTransform"],i=0;i<h.length;i++)if(typeof e.style[h[i]]!="undefined"){c.trstyle=h[i];break}c.hastransform=c.trstyle!=false;if(c.hastransform)e.style[c.trstyle]="translate3d(1px,2px,3px)",c.hastranslate3d=/translate3d/.test(e.style[c.trstyle]);c.transitionstyle=false;c.prefixstyle="";c.transitionend=false;for(var h="transition,webkitTransition,MozTransition,OTransition,OTransition,msTransition,KhtmlTransition".split(","),b=",-webkit-,-moz-,-o-,-o,-ms-,-khtml-".split(","),
n="transitionend,webkitTransitionEnd,transitionend,otransitionend,oTransitionEnd,msTransitionEnd,KhtmlTransitionEnd".split(","),i=0;i<h.length;i++)if(h[i]in e.style){c.transitionstyle=h[i];c.prefixstyle=b[i];c.transitionend=n[i];break}c.hastransition=c.transitionstyle;a:{h=["-moz-grab","-webkit-grab","grab"];if(c.ischrome&&!c.ischrome22||c.isie)h=[];for(i=0;i<h.length;i++)if(b=h[i],e.style.cursor=b,e.style.cursor==b){h=b;break a}h="url(http://www.google.com/intl/en_ALL/mapfiles/openhand.cur),n-resize"}c.cursorgrabvalue=
h;c.hasmousecapture="setCapture"in e;return x=c},F=function(j,c){function h(d,c,g){c=d.css(c);d=parseFloat(c);return isNaN(d)?(d=o[c]||0,g=d==3?g?b.win.outerHeight()-b.win.innerHeight():b.win.outerWidth()-b.win.innerWidth():1,b.isie8&&d&&(d+=1),g?d:0):d}function i(d,c){var g=0,f=0,e=1;"wheelDeltaY"in d?(e=b.opt.mousescrollstep/48,g=Math.floor(d.wheelDeltaX*e),f=Math.floor(d.wheelDeltaY*e),c&&g==0&&f&&(g=f,f=0)):(e=d.detail?d.detail*-1:d.wheelDelta/40)&&(c?g=Math.floor(e*b.opt.mousescrollstep):f=Math.floor(e*
b.opt.mousescrollstep));g&&(b.scrollmom&&b.scrollmom.stop(),b.lastdeltax+=g,b.synched("mousewheelx",function(){var d=b.lastdeltax;b.lastdeltax=0;b.rail.drag||b.doScrollLeftBy(d)}));f&&(b.scrollmom&&b.scrollmom.stop(),b.lastdeltay+=f,b.synched("mousewheely",function(){var d=b.lastdeltay;b.lastdeltay=0;b.rail.drag||b.doScrollBy(d)}))}var b=this;this.version="3.1.4";this.name="nicescroll";this.me=c;this.opt={doc:e("body"),win:false,zindex:9E3,cursoropacitymin:0,cursoropacitymax:1,cursorcolor:"#424242",
cursorwidth:"5px",cursorborder:"1px solid #fff",cursorborderradius:"5px",scrollspeed:60,mousescrollstep:24,touchbehavior:false,hwacceleration:true,usetransition:true,boxzoom:false,dblclickzoom:true,gesturezoom:true,grabcursorenabled:true,autohidemode:true,background:"",iframeautoresize:true,cursorminheight:32,preservenativescrolling:true,railoffset:false,bouncescroll:true,spacebarenabled:true,railpadding:{top:0,right:0,left:0,bottom:0},disableoutline:true,horizrailenabled:true,railalign:"right",railvalign:"bottom",
enabletranslate3d:true,enablemousewheel:true,enablekeyboard:true,smoothscroll:true,sensitiverail:true,enablemouselockapi:true,cursorfixedheight:false};this.opt.snapbackspeed=80;if(j)for(var n in b.opt)typeof j[n]!="undefined"&&(b.opt[n]=j[n]);this.iddoc=(this.doc=b.opt.doc)&&this.doc[0]?this.doc[0].id||"":"";this.ispage=/BODY|HTML/.test(b.opt.win?b.opt.win[0].nodeName:this.doc[0].nodeName);this.haswrapper=b.opt.win!==false;this.win=b.opt.win||(this.ispage?e(window):this.doc);this.docscroll=this.ispage&&
!this.haswrapper?e(window):this.win;this.body=e("body");this.iframe=this.isfixed=this.viewport=false;this.isiframe=this.doc[0].nodeName=="IFRAME"&&this.win[0].nodeName=="IFRAME";this.istextarea=this.win[0].nodeName=="TEXTAREA";this.forcescreen=false;this.canshowonmouseevent=b.opt.autohidemode!="scroll";this.page=this.view=this.onzoomout=this.onzoomin=this.onscrollcancel=this.onscrollend=this.onscrollstart=this.onclick=this.ongesturezoom=this.onkeypress=this.onmousewheel=this.onmousemove=this.onmouseup=
this.onmousedown=false;this.scroll={x:0,y:0};this.scrollratio={x:0,y:0};this.cursorheight=20;this.scrollvaluemax=0;this.observer=this.scrollmom=this.scrollrunning=false;do this.id="ascrail"+C++;while(document.getElementById(this.id));this.hasmousefocus=this.hasfocus=this.zoomactive=this.zoom=this.cursorfreezed=this.cursor=this.rail=false;this.visibility=true;this.hidden=this.locked=false;this.cursoractive=true;this.nativescrollingarea=false;this.events=[];this.saved={};this.delaylist={};this.synclist=
{};this.lastdeltay=this.lastdeltax=0;this.detected=E();var f=e.extend({},this.detected);this.ishwscroll=(this.canhwscroll=f.hastransform&&b.opt.hwacceleration)&&b.haswrapper;this.istouchcapable=false;if(f.cantouch&&f.ischrome&&!f.isios&&!f.isandroid)this.istouchcapable=true,f.cantouch=false;if(f.cantouch&&f.ismozilla&&!f.isios)this.istouchcapable=true,f.cantouch=false;if(!b.opt.enablemouselockapi)f.hasmousecapture=false,f.haspointerlock=false;this.delayed=function(d,c,g,f){var e=b.delaylist[d],h=
(new Date).getTime();if(!f&&e&&e.tt)return false;e&&e.tt&&clearTimeout(e.tt);if(e&&e.last+g>h&&!e.tt)b.delaylist[d]={last:h+g,tt:setTimeout(function(){b.delaylist[d].tt=0;c.call()},g)};else if(!e||!e.tt)b.delaylist[d]={last:h,tt:0},setTimeout(function(){c.call()},0)};this.synched=function(d,c){b.synclist[d]=c;(function(){if(!b.onsync)p(function(){b.onsync=false;for(d in b.synclist){var c=b.synclist[d];c&&c.call(b);b.synclist[d]=false}}),b.onsync=true})();return d};this.unsynched=function(d){b.synclist[d]&&
(b.synclist[d]=false)};this.css=function(d,c){for(var g in c)b.saved.css.push([d,g,d.css(g)]),d.css(g,c[g])};this.scrollTop=function(d){return typeof d=="undefined"?b.getScrollTop():b.setScrollTop(d)};this.scrollLeft=function(d){return typeof d=="undefined"?b.getScrollLeft():b.setScrollLeft(d)};BezierClass=function(b,c,g,f,e,h,i){this.st=b;this.ed=c;this.spd=g;this.p1=f||0;this.p2=e||1;this.p3=h||0;this.p4=i||1;this.ts=(new Date).getTime();this.df=this.ed-this.st};BezierClass.prototype={B2:function(b){return 3*
b*b*(1-b)},B3:function(b){return 3*b*(1-b)*(1-b)},B4:function(b){return(1-b)*(1-b)*(1-b)},getNow:function(){var b=1-((new Date).getTime()-this.ts)/this.spd,c=this.B2(b)+this.B3(b)+this.B4(b);return b<0?this.ed:this.st+Math.round(this.df*c)},update:function(b,c){this.st=this.getNow();this.ed=b;this.spd=c;this.ts=(new Date).getTime();this.df=this.ed-this.st;return this}};if(this.ishwscroll){this.doc.translate={x:0,y:0,tx:"0px",ty:"0px"};f.hastranslate3d&&f.isios&&this.doc.css("-webkit-backface-visibility",
"hidden");var m=function(){var d=b.doc.css(f.trstyle);return d&&d.substr(0,6)=="matrix"?d.replace(/^.*\((.*)\)$/g,"$1").replace(/px/g,"").split(/, +/):false};this.getScrollTop=function(d){if(!d){if(d=m())return d.length==16?-d[13]:-d[5];if(b.timerscroll&&b.timerscroll.bz)return b.timerscroll.bz.getNow()}return b.doc.translate.y};this.getScrollLeft=function(d){if(!d){if(d=m())return d.length==16?-d[12]:-d[4];if(b.timerscroll&&b.timerscroll.bh)return b.timerscroll.bh.getNow()}return b.doc.translate.x};
this.notifyScrollEvent=document.createEvent?function(b){var c=document.createEvent("UIEvents");c.initUIEvent("scroll",false,true,window,1);b.dispatchEvent(c)}:document.fireEvent?function(b){var c=document.createEventObject();b.fireEvent("onscroll");c.cancelBubble=true}:function(){};f.hastranslate3d&&b.opt.enabletranslate3d?(this.setScrollTop=function(d,c){b.doc.translate.y=d;b.doc.translate.ty=d*-1+"px";b.doc.css(f.trstyle,"translate3d("+b.doc.translate.tx+","+b.doc.translate.ty+",0px)");c||b.notifyScrollEvent(b.win[0])},
this.setScrollLeft=function(d,c){b.doc.translate.x=d;b.doc.translate.tx=d*-1+"px";b.doc.css(f.trstyle,"translate3d("+b.doc.translate.tx+","+b.doc.translate.ty+",0px)");c||b.notifyScrollEvent(b.win[0])}):(this.setScrollTop=function(d,c){b.doc.translate.y=d;b.doc.translate.ty=d*-1+"px";b.doc.css(f.trstyle,"translate("+b.doc.translate.tx+","+b.doc.translate.ty+")");c||b.notifyScrollEvent(b.win[0])},this.setScrollLeft=function(d,c){b.doc.translate.x=d;b.doc.translate.tx=d*-1+"px";b.doc.css(f.trstyle,
"translate("+b.doc.translate.tx+","+b.doc.translate.ty+")");c||b.notifyScrollEvent(b.win[0])})}else this.getScrollTop=function(){return b.docscroll.scrollTop()},this.setScrollTop=function(d){return b.docscroll.scrollTop(d)},this.getScrollLeft=function(){return b.docscroll.scrollLeft()},this.setScrollLeft=function(d){return b.docscroll.scrollLeft(d)};this.getTarget=function(b){return!b?false:b.target?b.target:b.srcElement?b.srcElement:false};this.hasParent=function(b,c){if(!b)return false;for(var g=
b.target||b.srcElement||b||false;g&&g.id!=c;)g=g.parentNode||false;return g!==false};var o={thin:1,medium:3,thick:5};this.getOffset=function(){if(b.isfixed)return{top:parseFloat(b.win.css("top")),left:parseFloat(b.win.css("left"))};if(!b.viewport)return b.win.offset();var d=b.win.offset(),c=b.viewport.offset();return{top:d.top-c.top+b.viewport.scrollTop(),left:d.left-c.left+b.viewport.scrollLeft()}};this.updateScrollBar=function(d){if(b.ishwscroll)b.rail.css({height:b.win.innerHeight()}),b.railh&&
b.railh.css({width:b.win.innerWidth()});else{var c=b.getOffset(),g=c.top,f=c.left;g+=h(b.win,"border-top-width",true);b.win.outerWidth();b.win.innerWidth();f+=b.rail.align?b.win.outerWidth()-h(b.win,"border-right-width")-b.rail.width:h(b.win,"border-left-width");var e=b.opt.railoffset;e&&(e.top&&(g+=e.top),b.rail.align&&e.left&&(f+=e.left));b.locked||b.rail.css({top:g,left:f,height:d?d.h:b.win.innerHeight()});b.zoom&&b.zoom.css({top:g+1,left:b.rail.align==1?f-20:f+b.rail.width+4});if(b.railh&&!b.locked)g=
c.top,f=c.left,d=b.railh.align?g+h(b.win,"border-top-width",true)+b.win.innerHeight()-b.railh.height:g+h(b.win,"border-top-width",true),f+=h(b.win,"border-left-width"),b.railh.css({top:d,left:f,width:b.railh.width})}};this.doRailClick=function(d,c,g){var f;!(b.rail.drag&&b.rail.drag.pt!=1)&&!b.locked&&!b.rail.drag&&(b.cancelScroll(),b.cancelEvent(d),c?(c=g?b.doScrollLeft:b.doScrollTop,f=g?(d.pageX-b.railh.offset().left-b.cursorwidth/2)*b.scrollratio.x:(d.pageY-b.rail.offset().top-b.cursorheight/2)*
b.scrollratio.y,c(f)):(c=g?b.doScrollLeftBy:b.doScrollBy,f=g?b.scroll.x:b.scroll.y,d=g?d.pageX-b.railh.offset().left:d.pageY-b.rail.offset().top,g=g?b.view.w:b.view.h,f>=d?c(g):c(-g)))};b.hasanimationframe=p;b.hascancelanimationframe=q;b.hasanimationframe?b.hascancelanimationframe||(q=function(){b.cancelAnimationFrame=true}):(p=function(b){return setTimeout(b,16)},q=clearInterval);this.init=function(){b.saved.css=[];if(f.isie7mobile)return true;f.hasmstouch&&b.css(b.ispage?e("html"):b.win,{"-ms-touch-action":"none"});
if(!b.ispage||!f.cantouch&&!f.isieold&&!f.isie9mobile){var d=b.docscroll;b.ispage&&(d=b.haswrapper?b.win:b.doc);f.isie9mobile||b.css(d,{"overflow-y":"hidden"});b.ispage&&f.isie7&&(b.doc[0].nodeName=="BODY"?b.css(e("html"),{"overflow-y":"hidden"}):b.doc[0].nodeName=="HTML"&&b.css(e("body"),{"overflow-y":"hidden"}));f.isios&&!b.ispage&&!b.haswrapper&&b.css(e("body"),{"-webkit-overflow-scrolling":"touch"});var c=e(document.createElement("div"));c.css({position:"relative",top:0,"float":"right",width:b.opt.cursorwidth,
height:"0px","background-color":b.opt.cursorcolor,border:b.opt.cursorborder,"background-clip":"padding-box","-webkit-border-radius":b.opt.cursorborderradius,"-moz-border-radius":b.opt.cursorborderradius,"border-radius":b.opt.cursorborderradius});c.hborder=parseFloat(c.outerHeight()-c.innerHeight());b.cursor=c;var g=e(document.createElement("div"));g.attr("id",b.id);var h,i,j=["left","right"],y;for(y in j)i=j[y],(h=b.opt.railpadding[i])?g.css("padding-"+i,h+"px"):b.opt.railpadding[i]=0;g.append(c);
g.width=Math.max(parseFloat(b.opt.cursorwidth),c.outerWidth())+b.opt.railpadding.left+b.opt.railpadding.right;g.css({width:g.width+"px",zIndex:b.ispage?b.opt.zindex:b.opt.zindex+2,background:b.opt.background});g.visibility=true;g.scrollable=true;g.align=b.opt.railalign=="left"?0:1;b.rail=g;c=b.rail.drag=false;if(b.opt.boxzoom&&!b.ispage&&!f.isieold&&(c=document.createElement("div"),b.bind(c,"click",b.doZoom),b.zoom=e(c),b.zoom.css({cursor:"pointer","z-index":b.opt.zindex,backgroundImage:"url("+D+
"zoomico.png)",height:18,width:18,backgroundPosition:"0px 0px"}),b.opt.dblclickzoom&&b.bind(b.win,"dblclick",b.doZoom),f.cantouch&&b.opt.gesturezoom))b.ongesturezoom=function(d){d.scale>1.5&&b.doZoomIn(d);d.scale<0.8&&b.doZoomOut(d);return b.cancelEvent(d)},b.bind(b.win,"gestureend",b.ongesturezoom);b.railh=false;if(b.opt.horizrailenabled){b.css(d,{"overflow-x":"hidden"});c=e(document.createElement("div"));c.css({position:"relative",top:0,height:b.opt.cursorwidth,width:"0px","background-color":b.opt.cursorcolor,
border:b.opt.cursorborder,"background-clip":"padding-box","-webkit-border-radius":b.opt.cursorborderradius,"-moz-border-radius":b.opt.cursorborderradius,"border-radius":b.opt.cursorborderradius});c.wborder=parseFloat(c.outerWidth()-c.innerWidth());b.cursorh=c;var k=e(document.createElement("div"));k.attr("id",b.id+"-hr");k.height=1+Math.max(parseFloat(b.opt.cursorwidth),c.outerHeight());k.css({height:k.height+"px",zIndex:b.ispage?b.opt.zindex:b.opt.zindex+2,background:b.opt.background});k.append(c);
k.visibility=true;k.scrollable=true;k.align=b.opt.railvalign=="top"?0:1;b.railh=k;b.railh.drag=false}if(b.ispage)g.css({position:"fixed",top:"0px",height:"100%"}),g.align?g.css({right:"0px"}):g.css({left:"0px"}),b.body.append(g),b.railh&&(k.css({position:"fixed",left:"0px",width:"100%"}),k.align?k.css({bottom:"0px"}):k.css({top:"0px"}),b.body.append(k));else{if(b.ishwscroll)b.win.css("position")=="static"&&b.css(b.win,{position:"relative"}),d=b.win[0].nodeName=="HTML"?b.body:b.win,b.zoom&&(b.zoom.css({position:"absolute",
top:1,right:0,"margin-right":g.width+4}),d.append(b.zoom)),g.css({position:"absolute",top:0}),g.align?g.css({right:0}):g.css({left:0}),d.append(g),k&&(k.css({position:"absolute",left:0,bottom:0}),k.align?k.css({bottom:0}):k.css({top:0}),d.append(k));else{b.isfixed=b.win.css("position")=="fixed";d=b.isfixed?"fixed":"absolute";if(!b.isfixed)b.viewport=b.getViewport(b.win[0]);if(b.viewport)b.body=b.viewport;g.css({position:d});b.zoom&&b.zoom.css({position:d});b.updateScrollBar();b.body.append(g);b.zoom&&
b.body.append(b.zoom);b.railh&&(k.css({position:d}),b.body.append(k))}f.isios&&b.css(b.win,{"-webkit-tap-highlight-color":"rgba(0,0,0,0)","-webkit-touch-callout":"none"});f.isie&&b.opt.disableoutline&&b.win.attr("hideFocus","true");f.iswebkit&&b.opt.disableoutline&&b.win.css({outline:"none"})}if(b.opt.autohidemode===false)b.autohidedom=false,b.rail.css({opacity:b.opt.cursoropacitymax}),b.railh&&b.railh.css({opacity:b.opt.cursoropacitymax});else if(b.opt.autohidemode===true){if(b.autohidedom=e().add(b.rail),
b.railh)b.autohidedom=b.autohidedom.add(b.railh)}else if(b.opt.autohidemode=="scroll"){if(b.autohidedom=e().add(b.rail),b.railh)b.autohidedom=b.autohidedom.add(b.railh)}else if(b.opt.autohidemode=="cursor"){if(b.autohidedom=e().add(b.cursor),b.railh)b.autohidedom=b.autohidedom.add(b.railh.cursor)}else if(b.opt.autohidemode=="hidden")b.autohidedom=false,b.hide(),b.locked=false;if(f.isie9mobile)b.scrollmom=new z(b),b.onmangotouch=function(){var d=b.getScrollTop(),c=b.getScrollLeft();if(d==b.scrollmom.lastscrolly&&
c==b.scrollmom.lastscrollx)return true;var g=d-b.mangotouch.sy,l=c-b.mangotouch.sx;if(Math.round(Math.sqrt(Math.pow(l,2)+Math.pow(g,2)))!=0){var f=g<0?-1:1,e=l<0?-1:1,h=+new Date;b.mangotouch.lazy&&clearTimeout(b.mangotouch.lazy);if(h-b.mangotouch.tm>80||b.mangotouch.dry!=f||b.mangotouch.drx!=e)b.scrollmom.stop(),b.scrollmom.reset(c,d),b.mangotouch.sy=d,b.mangotouch.ly=d,b.mangotouch.sx=c,b.mangotouch.lx=c,b.mangotouch.dry=f,b.mangotouch.drx=e,b.mangotouch.tm=h;else if(b.scrollmom.stop(),b.scrollmom.update(b.mangotouch.sx-
l,b.mangotouch.sy-g),b.mangotouch.tm=h,g=Math.max(Math.abs(b.mangotouch.ly-d),Math.abs(b.mangotouch.lx-c)),b.mangotouch.ly=d,b.mangotouch.lx=c,g>2)b.mangotouch.lazy=setTimeout(function(){b.mangotouch.lazy=false;b.mangotouch.dry=0;b.mangotouch.drx=0;b.mangotouch.tm=0;b.scrollmom.doMomentum(30)},100)}},g=b.getScrollTop(),k=b.getScrollLeft(),b.mangotouch={sy:g,ly:g,dry:0,sx:k,lx:k,drx:0,lazy:false,tm:0},b.bind(b.docscroll,"scroll",b.onmangotouch);else{if(f.cantouch||b.istouchcapable||b.opt.touchbehavior||
f.hasmstouch){b.scrollmom=new z(b);b.ontouchstart=function(d){if(d.pointerType&&d.pointerType!=2)return false;if(!b.locked){if(f.hasmstouch)for(var c=d.target?d.target:false;c;){var g=e(c).getNiceScroll();if(g.length>0&&g[0].me==b.me)break;if(g.length>0)return false;if(c.nodeName=="DIV"&&c.id==b.id)break;c=c.parentNode?c.parentNode:false}b.cancelScroll();if((c=b.getTarget(d))&&/INPUT/i.test(c.nodeName)&&/range/i.test(c.type))return b.stopPropagation(d);if(!("clientX"in d)&&"changedTouches"in d)d.clientX=
d.changedTouches[0].clientX,d.clientY=d.changedTouches[0].clientY;if(b.forcescreen)g=d,d={original:d.original?d.original:d},d.clientX=g.screenX,d.clientY=g.screenY;b.rail.drag={x:d.clientX,y:d.clientY,sx:b.scroll.x,sy:b.scroll.y,st:b.getScrollTop(),sl:b.getScrollLeft(),pt:2};b.opt.touchbehavior&&b.isiframe&&f.isie&&(g=b.win.position(),b.rail.drag.x+=g.left,b.rail.drag.y+=g.top);b.hasmoving=false;b.lastmouseup=false;b.scrollmom.reset(d.clientX,d.clientY);if(!f.cantouch&&!this.istouchcapable&&!f.hasmstouch){if(!c||
!/INPUT|SELECT|TEXTAREA/i.test(c.nodeName))return!b.ispage&&f.hasmousecapture&&c.setCapture(),b.cancelEvent(d);if(/SUBMIT|CANCEL|BUTTON/i.test(e(c).attr("type")))pc={tg:c,click:false},b.preventclick=pc}}};b.ontouchend=function(d){if(d.pointerType&&d.pointerType!=2)return false;if(b.rail.drag&&b.rail.drag.pt==2&&(b.scrollmom.doMomentum(),b.rail.drag=false,b.hasmoving&&(b.hasmoving=false,b.lastmouseup=true,b.hideCursor(),f.hasmousecapture&&document.releaseCapture(),!f.cantouch)))return b.cancelEvent(d)};
var n=b.opt.touchbehavior&&b.isiframe&&!f.hasmousecapture;b.ontouchmove=function(d,c){if(d.pointerType&&d.pointerType!=2)return false;if(b.rail.drag&&b.rail.drag.pt==2){if(f.cantouch&&typeof d.original=="undefined")return true;b.hasmoving=true;if(b.preventclick&&!b.preventclick.click)b.preventclick.click=b.preventclick.tg.onclick||false,b.preventclick.tg.onclick=b.onpreventclick;d=e.extend({original:d},d);if("changedTouches"in d)d.clientX=d.changedTouches[0].clientX,d.clientY=d.changedTouches[0].clientY;
if(b.forcescreen){var g=d,d={original:d.original?d.original:d};d.clientX=g.screenX;d.clientY=g.screenY}g=ofy=0;if(n&&!c){var l=b.win.position(),g=-l.left;ofy=-l.top}var h=d.clientY+ofy,i=b.rail.drag.st-(h-b.rail.drag.y);if(b.ishwscroll&&b.opt.bouncescroll)i<0?i=Math.round(i/2):i>b.page.maxh&&(i=b.page.maxh+Math.round((i-b.page.maxh)/2));else if(i<0&&(h=i=0),i>b.page.maxh)i=b.page.maxh,h=0;var s=d.clientX+g;if(b.railh&&b.railh.scrollable){var j=b.rail.drag.sl-(s-b.rail.drag.x);if(b.ishwscroll&&b.opt.bouncescroll)j<
0?j=Math.round(j/2):j>b.page.maxw&&(j=b.page.maxw+Math.round((j-b.page.maxw)/2));else if(j<0&&(s=j=0),j>b.page.maxw)j=b.page.maxw,s=0}b.synched("touchmove",function(){b.rail.drag&&b.rail.drag.pt==2&&(b.prepareTransition&&b.prepareTransition(0),b.rail.scrollable&&b.setScrollTop(i),b.scrollmom.update(s,h),b.railh&&b.railh.scrollable?(b.setScrollLeft(j),b.showCursor(i,j)):b.showCursor(i),f.isie10&&document.selection.clear())});if(!f.ischrome&&!b.istouchcapable)return b.cancelEvent(d)}}}f.cantouch||b.opt.touchbehavior?
(b.onpreventclick=function(d){if(b.preventclick)return b.preventclick.tg.onclick=b.preventclick.click,b.preventclick=false,b.cancelEvent(d)},b.onmousedown=b.ontouchstart,b.onmouseup=b.ontouchend,b.onclick=f.isios?false:function(d){return b.lastmouseup?(b.lastmouseup=false,b.cancelEvent(d)):true},b.onmousemove=b.ontouchmove,f.cursorgrabvalue&&(b.css(b.ispage?b.doc:b.win,{cursor:f.cursorgrabvalue}),b.css(b.rail,{cursor:f.cursorgrabvalue}))):(b.onmousedown=function(d,c){if(!(b.rail.drag&&b.rail.drag.pt!=
1)){if(b.locked)return b.cancelEvent(d);b.cancelScroll();b.rail.drag={x:d.clientX,y:d.clientY,sx:b.scroll.x,sy:b.scroll.y,pt:1,hr:!!c};var g=b.getTarget(d);!b.ispage&&f.hasmousecapture&&g.setCapture();if(b.isiframe&&!f.hasmousecapture)b.saved.csspointerevents=b.doc.css("pointer-events"),b.css(b.doc,{"pointer-events":"none"});return b.cancelEvent(d)}},b.onmouseup=function(d){if(b.rail.drag&&(f.hasmousecapture&&document.releaseCapture(),b.isiframe&&!f.hasmousecapture&&b.doc.css("pointer-events",b.saved.csspointerevents),
b.rail.drag.pt==1))return b.rail.drag=false,b.cancelEvent(d)},b.onmousemove=function(d){if(b.rail.drag){if(b.rail.drag.pt==1){if(f.ischrome&&d.which==0)return b.onmouseup(d);b.cursorfreezed=true;if(b.rail.drag.hr){b.scroll.x=b.rail.drag.sx+(d.clientX-b.rail.drag.x);if(b.scroll.x<0)b.scroll.x=0;var c=b.scrollvaluemaxw;if(b.scroll.x>c)b.scroll.x=c}else{b.scroll.y=b.rail.drag.sy+(d.clientY-b.rail.drag.y);if(b.scroll.y<0)b.scroll.y=0;c=b.scrollvaluemax;if(b.scroll.y>c)b.scroll.y=c}b.synched("mousemove",
function(){b.rail.drag&&b.rail.drag.pt==1&&(b.showCursor(),b.rail.drag.hr?b.doScrollLeft(Math.round(b.scroll.x*b.scrollratio.x)):b.doScrollTop(Math.round(b.scroll.y*b.scrollratio.y)))});return b.cancelEvent(d)}}else b.checkarea=true});(f.cantouch||b.opt.touchbehavior)&&b.bind(b.win,"mousedown",b.onmousedown);f.hasmstouch&&(b.css(b.rail,{"-ms-touch-action":"none"}),b.css(b.cursor,{"-ms-touch-action":"none"}),b.bind(b.win,"MSPointerDown",b.ontouchstart),b.bind(document,"MSPointerUp",b.ontouchend),b.bind(document,
"MSPointerMove",b.ontouchmove),b.bind(b.cursor,"MSGestureHold",function(b){b.preventDefault()}),b.bind(b.cursor,"contextmenu",function(b){b.preventDefault()}));this.istouchcapable&&(b.bind(b.win,"touchstart",b.ontouchstart),b.bind(document,"touchend",b.ontouchend),b.bind(document,"touchcancel",b.ontouchend),b.bind(document,"touchmove",b.ontouchmove));b.bind(b.cursor,"mousedown",b.onmousedown);b.bind(b.cursor,"mouseup",b.onmouseup);b.railh&&(b.bind(b.cursorh,"mousedown",function(d){b.onmousedown(d,
true)}),b.bind(b.cursorh,"mouseup",function(d){if(!(b.rail.drag&&b.rail.drag.pt==2))return b.rail.drag=false,b.hasmoving=false,b.hideCursor(),f.hasmousecapture&&document.releaseCapture(),b.cancelEvent(d)}));b.bind(document,"mouseup",b.onmouseup);f.hasmousecapture&&b.bind(b.win,"mouseup",b.onmouseup);b.bind(document,"mousemove",b.onmousemove);b.onclick&&b.bind(document,"click",b.onclick);!f.cantouch&&!b.opt.touchbehavior&&(b.jqbind(b.rail,"mouseenter",function(){b.canshowonmouseevent&&b.showCursor();
b.rail.active=true}),b.jqbind(b.rail,"mouseleave",function(){b.rail.active=false;b.rail.drag||b.hideCursor()}),b.opt.sensitiverail&&(b.bind(b.rail,"click",function(d){b.doRailClick(d,false,false)}),b.bind(b.rail,"dblclick",function(d){b.doRailClick(d,true,false)}),b.bind(b.cursor,"click",function(d){b.cancelEvent(d)}),b.bind(b.cursor,"dblclick",function(d){b.cancelEvent(d)})),b.railh&&(b.jqbind(b.railh,"mouseenter",function(){b.canshowonmouseevent&&b.showCursor();b.rail.active=true}),b.jqbind(b.railh,
"mouseleave",function(){b.rail.active=false;b.rail.drag||b.hideCursor()}),b.opt.sensitiverail&&(b.bind(b.railh,"click",function(d){b.doRailClick(d,false,true)}),b.bind(b.railh,"dblclick",function(d){b.doRailClick(d,true,true)}),b.bind(b.cursorh,"click",function(d){b.cancelEvent(d)}),b.bind(b.cursorh,"dblclick",function(d){b.cancelEvent(d)}))),b.zoom&&(b.jqbind(b.zoom,"mouseenter",function(){b.canshowonmouseevent&&b.showCursor();b.rail.active=true}),b.jqbind(b.zoom,"mouseleave",function(){b.rail.active=
false;b.rail.drag||b.hideCursor()})));b.opt.enablemousewheel&&(b.isiframe||b.bind(f.isie&&b.ispage?document:b.docscroll,"mousewheel",b.onmousewheel),b.bind(b.rail,"mousewheel",b.onmousewheel),b.railh&&b.bind(b.railh,"mousewheel",b.onmousewheelhr));!b.ispage&&!f.cantouch&&!/HTML|BODY/.test(b.win[0].nodeName)&&(b.win.attr("tabindex")||b.win.attr({tabindex:B++}),b.jqbind(b.win,"focus",function(d){r=b.getTarget(d).id||true;b.hasfocus=true;b.canshowonmouseevent&&b.noticeCursor()}),b.jqbind(b.win,"blur",
function(){r=false;b.hasfocus=false}),b.jqbind(b.win,"mouseenter",function(d){w=b.getTarget(d).id||true;b.hasmousefocus=true;b.canshowonmouseevent&&b.noticeCursor()}),b.jqbind(b.win,"mouseleave",function(){w=false;b.hasmousefocus=false}))}b.onkeypress=function(d){if(b.locked&&b.page.maxh==0)return true;var d=d?d:window.e,c=b.getTarget(d);if(c&&/INPUT|TEXTAREA|SELECT|OPTION/.test(c.nodeName)&&(!c.getAttribute("type")&&!c.type||!/submit|button|cancel/i.tp))return true;if(b.hasfocus||b.hasmousefocus&&
!r||b.ispage&&!r&&!w){c=d.keyCode;if(b.locked&&c!=27)return b.cancelEvent(d);var g=d.ctrlKey||false,l=d.shiftKey||false,f=false;switch(c){case 38:case 63233:b.doScrollBy(72);f=true;break;case 40:case 63235:b.doScrollBy(-72);f=true;break;case 37:case 63232:b.railh&&(g?b.doScrollLeft(0):b.doScrollLeftBy(72),f=true);break;case 39:case 63234:b.railh&&(g?b.doScrollLeft(b.page.maxw):b.doScrollLeftBy(-72),f=true);break;case 33:case 63276:b.doScrollBy(b.view.h);f=true;break;case 34:case 63277:b.doScrollBy(-b.view.h);
f=true;break;case 36:case 63273:b.railh&&g?b.doScrollPos(0,0):b.doScrollTo(0);f=true;break;case 35:case 63275:b.railh&&g?b.doScrollPos(b.page.maxw,b.page.maxh):b.doScrollTo(b.page.maxh);f=true;break;case 32:b.opt.spacebarenabled&&(l?b.doScrollBy(b.view.h):b.doScrollBy(-b.view.h),f=true);break;case 27:b.zoomactive&&(b.doZoom(),f=true)}if(f)return b.cancelEvent(d)}};b.opt.enablekeyboard&&b.bind(document,f.isopera&&!f.isopera12?"keypress":"keydown",b.onkeypress);b.bind(window,"resize",b.resize);b.bind(window,
"orientationchange",b.resize);b.bind(window,"load",b.resize);if(f.ischrome&&!b.ispage&&!b.haswrapper){var m=b.win.attr("style"),g=parseFloat(b.win.css("width"))+1;b.win.css("width",g);b.synched("chromefix",function(){b.win.attr("style",m)})}b.onAttributeChange=function(){b.lazyResize()};if(!b.ispage&&!b.haswrapper)"WebKitMutationObserver"in window?(b.observer=new WebKitMutationObserver(function(d){d.forEach(b.onAttributeChange)}),b.observer.observe(b.win[0],{attributes:true,subtree:false})):(b.bind(b.win,
f.isie&&!f.isie9?"propertychange":"DOMAttrModified",b.onAttributeChange),f.isie9&&b.win[0].attachEvent("onpropertychange",b.onAttributeChange));!b.ispage&&b.opt.boxzoom&&b.bind(window,"resize",b.resizeZoom);b.istextarea&&b.bind(b.win,"mouseup",b.resize);b.resize()}if(this.doc[0].nodeName=="IFRAME"){var A=function(){b.iframexd=false;try{var d="contentDocument"in this?this.contentDocument:this.contentWindow.document}catch(c){b.iframexd=true,d=false}if(b.iframexd)return"console"in window&&console.log("NiceScroll error: policy restriced iframe"),
true;b.forcescreen=true;if(b.isiframe)b.iframe={doc:e(d),html:b.doc.contents().find("html")[0],body:b.doc.contents().find("body")[0]},b.getContentSize=function(){return{w:Math.max(b.iframe.html.scrollWidth,b.iframe.body.scrollWidth),h:Math.max(b.iframe.html.scrollHeight,b.iframe.body.scrollHeight)}},b.docscroll=e(b.iframe.body);if(!f.isios&&b.opt.iframeautoresize&&!b.isiframe){b.win.scrollTop(0);b.doc.height("");var g=Math.max(d.getElementsByTagName("html")[0].scrollHeight,d.body.scrollHeight);b.doc.height(g)}b.resize();
f.isie7&&b.css(e(b.iframe.html),{"overflow-y":"hidden"});b.css(e(b.iframe.body),{"overflow-y":"hidden"});"contentWindow"in this?b.bind(this.contentWindow,"scroll",b.onscroll):b.bind(d,"scroll",b.onscroll);b.opt.enablemousewheel&&b.bind(d,"mousewheel",b.onmousewheel);b.opt.enablekeyboard&&b.bind(d,f.isopera?"keypress":"keydown",b.onkeypress);if(f.cantouch||b.opt.touchbehavior)b.bind(d,"mousedown",b.onmousedown),b.bind(d,"mousemove",function(d){b.onmousemove(d,true)}),f.cursorgrabvalue&&b.css(e(d.body),
{cursor:f.cursorgrabvalue});b.bind(d,"mouseup",b.onmouseup);b.zoom&&(b.opt.dblclickzoom&&b.bind(d,"dblclick",b.doZoom),b.ongesturezoom&&b.bind(d,"gestureend",b.ongesturezoom))};this.doc[0].readyState&&this.doc[0].readyState=="complete"&&setTimeout(function(){A.call(b.doc[0],false)},500);b.bind(this.doc,"load",A)}};this.showCursor=function(d,c){if(b.cursortimeout)clearTimeout(b.cursortimeout),b.cursortimeout=0;if(b.rail){if(b.autohidedom)b.autohidedom.stop().css({opacity:b.opt.cursoropacitymax}),b.cursoractive=
true;if(typeof d!="undefined"&&d!==false)b.scroll.y=Math.round(d*1/b.scrollratio.y);if(typeof c!="undefined")b.scroll.x=Math.round(c*1/b.scrollratio.x);b.cursor.css({height:b.cursorheight,top:b.scroll.y});if(b.cursorh)!b.rail.align&&b.rail.visibility?b.cursorh.css({width:b.cursorwidth,left:b.scroll.x+b.rail.width}):b.cursorh.css({width:b.cursorwidth,left:b.scroll.x}),b.cursoractive=true;b.zoom&&b.zoom.stop().css({opacity:b.opt.cursoropacitymax})}};this.hideCursor=function(d){if(!b.cursortimeout&&
b.rail&&b.autohidedom)b.cursortimeout=setTimeout(function(){if(!b.rail.active||!b.showonmouseevent)b.autohidedom.stop().animate({opacity:b.opt.cursoropacitymin}),b.zoom&&b.zoom.stop().animate({opacity:b.opt.cursoropacitymin}),b.cursoractive=false;b.cursortimeout=0},d||400)};this.noticeCursor=function(d,c,g){b.showCursor(c,g);b.rail.active||b.hideCursor(d)};this.getContentSize=b.ispage?function(){return{w:Math.max(document.body.scrollWidth,document.documentElement.scrollWidth),h:Math.max(document.body.scrollHeight,
document.documentElement.scrollHeight)}}:b.haswrapper?function(){return{w:b.doc.outerWidth()+parseInt(b.win.css("paddingLeft"))+parseInt(b.win.css("paddingRight")),h:b.doc.outerHeight()+parseInt(b.win.css("paddingTop"))+parseInt(b.win.css("paddingBottom"))}}:function(){return{w:b.docscroll[0].scrollWidth,h:b.docscroll[0].scrollHeight}};this.onResize=function(d,c){if(!b.win)return false;if(!b.haswrapper&&!b.ispage)if(b.win.css("display")=="none")return b.visibility&&b.hideRail().hideRailHr(),false;
else!b.hidden&&!b.visibility&&b.showRail().showRailHr();var g=b.page.maxh,f=b.page.maxw,e=b.view.w;b.view={w:b.ispage?b.win.width():parseInt(b.win[0].clientWidth),h:b.ispage?b.win.height():parseInt(b.win[0].clientHeight)};b.page=c?c:b.getContentSize();b.page.maxh=Math.max(0,b.page.h-b.view.h);b.page.maxw=Math.max(0,b.page.w-b.view.w);if(b.page.maxh==g&&b.page.maxw==f&&b.view.w==e)if(b.ispage)return b;else{g=b.win.offset();if(b.lastposition&&(f=b.lastposition,f.top==g.top&&f.left==g.left))return b;
b.lastposition=g}b.page.maxh==0?(b.hideRail(),b.scrollvaluemax=0,b.scroll.y=0,b.scrollratio.y=0,b.cursorheight=0,b.setScrollTop(0),b.rail.scrollable=false):b.rail.scrollable=true;b.page.maxw==0?(b.hideRailHr(),b.scrollvaluemaxw=0,b.scroll.x=0,b.scrollratio.x=0,b.cursorwidth=0,b.setScrollLeft(0),b.railh.scrollable=false):b.railh.scrollable=true;b.locked=b.page.maxh==0&&b.page.maxw==0;if(b.locked)return b.ispage||b.updateScrollBar(b.view),false;!b.hidden&&!b.visibility?b.showRail().showRailHr():!b.hidden&&
!b.railh.visibility&&b.showRailHr();b.istextarea&&b.win.css("resize")&&b.win.css("resize")!="none"&&(b.view.h-=20);b.ispage||b.updateScrollBar(b.view);b.cursorheight=Math.min(b.view.h,Math.round(b.view.h*(b.view.h/b.page.h)));b.cursorheight=b.opt.cursorfixedheight?b.opt.cursorfixedheight:Math.max(b.opt.cursorminheight,b.cursorheight);b.cursorwidth=Math.min(b.view.w,Math.round(b.view.w*(b.view.w/b.page.w)));b.cursorwidth=b.opt.cursorfixedheight?b.opt.cursorfixedheight:Math.max(b.opt.cursorminheight,
b.cursorwidth);b.scrollvaluemax=b.view.h-b.cursorheight-b.cursor.hborder;if(b.railh)b.railh.width=b.page.maxh>0?b.view.w-b.rail.width:b.view.w,b.scrollvaluemaxw=b.railh.width-b.cursorwidth-b.cursorh.wborder;b.scrollratio={x:b.page.maxw/b.scrollvaluemaxw,y:b.page.maxh/b.scrollvaluemax};b.getScrollTop()>b.page.maxh?b.doScrollTop(b.page.maxh):(b.scroll.y=Math.round(b.getScrollTop()*(1/b.scrollratio.y)),b.scroll.x=Math.round(b.getScrollLeft()*(1/b.scrollratio.x)),b.cursoractive&&b.noticeCursor());b.scroll.y&&
b.getScrollTop()==0&&b.doScrollTo(Math.floor(b.scroll.y*b.scrollratio.y));return b};this.resize=function(){b.delayed("resize",b.onResize,30);return b};this.lazyResize=function(){b.delayed("resize",b.resize,250)};this._bind=function(d,c,g,f){b.events.push({e:d,n:c,f:g,b:f,q:false});d.addEventListener?d.addEventListener(c,g,f||false):d.attachEvent?d.attachEvent("on"+c,g):d["on"+c]=g};this.jqbind=function(d,c,g){b.events.push({e:d,n:c,f:g,q:true});e(d).bind(c,g)};this.bind=function(d,c,g,e){var h="jquery"in
d?d[0]:d;h.addEventListener?(f.cantouch&&/mouseup|mousedown|mousemove/.test(c)&&b._bind(h,c=="mousedown"?"touchstart":c=="mouseup"?"touchend":"touchmove",function(b){if(b.touches){if(b.touches.length<2){var d=b.touches.length?b.touches[0]:b;d.original=b;g.call(this,d)}}else if(b.changedTouches)d=b.changedTouches[0],d.original=b,g.call(this,d)},e||false),b._bind(h,c,g,e||false),c=="mousewheel"&&b._bind(h,"DOMMouseScroll",g,e||false),f.cantouch&&c=="mouseup"&&b._bind(h,"touchcancel",g,e||false)):b._bind(h,
c,function(d){if((d=d||window.event||false)&&d.srcElement)d.target=d.srcElement;return g.call(h,d)===false||e===false?b.cancelEvent(d):true})};this._unbind=function(b,c,g,f){b.removeEventListener?b.removeEventListener(c,g,f):b.detachEvent?b.detachEvent("on"+c,g):b["on"+c]=false};this.unbindAll=function(){for(var d=0;d<b.events.length;d++){var c=b.events[d];c.q?c.e.unbind(c.n,c.f):b._unbind(c.e,c.n,c.f,c.b)}};this.cancelEvent=function(b){b=b.original?b.original:b?b:window.event||false;if(!b)return false;
b.preventDefault&&b.preventDefault();b.stopPropagation&&b.stopPropagation();b.preventManipulation&&b.preventManipulation();b.cancelBubble=true;b.cancel=true;return b.returnValue=false};this.stopPropagation=function(b){b=b.original?b.original:b?b:window.event||false;if(!b)return false;if(b.stopPropagation)return b.stopPropagation();if(b.cancelBubble)b.cancelBubble=true;return false};this.showRail=function(){if(b.page.maxh!=0&&(b.ispage||b.win.css("display")!="none"))b.visibility=true,b.rail.visibility=
true,b.rail.css("display","block");return b};this.showRailHr=function(){if(!b.railh)return b;if(b.page.maxw!=0&&(b.ispage||b.win.css("display")!="none"))b.railh.visibility=true,b.railh.css("display","block");return b};this.hideRail=function(){b.visibility=false;b.rail.visibility=false;b.rail.css("display","none");return b};this.hideRailHr=function(){if(!b.railh)return b;b.railh.visibility=false;b.railh.css("display","none");return b};this.show=function(){b.hidden=false;b.locked=false;return b.showRail().showRailHr()};
this.hide=function(){b.hidden=true;b.locked=true;return b.hideRail().hideRailHr()};this.toggle=function(){return b.hidden?b.show():b.hide()};this.remove=function(){b.stop();b.cursortimeout&&clearTimeout(b.cursortimeout);b.doZoomOut();b.unbindAll();b.observer!==false&&b.observer.disconnect();b.events=[];if(b.cursor)b.cursor.remove(),b.cursor=null;if(b.cursorh)b.cursorh.remove(),b.cursorh=null;if(b.rail)b.rail.remove(),b.rail=null;if(b.railh)b.railh.remove(),b.railh=null;if(b.zoom)b.zoom.remove(),b.zoom=
null;for(var d=0;d<b.saved.css.length;d++){var c=b.saved.css[d];c[0].css(c[1],typeof c[2]=="undefined"?"":c[2])}b.saved=false;b.me.data("__nicescroll","");b.me=null;b.doc=null;b.docscroll=null;b.win=null;return b};this.scrollstart=function(d){this.onscrollstart=d;return b};this.scrollend=function(d){this.onscrollend=d;return b};this.scrollcancel=function(d){this.onscrollcancel=d;return b};this.zoomin=function(d){this.onzoomin=d;return b};this.zoomout=function(d){this.onzoomout=d;return b};this.isScrollable=
function(b){for(b=b.target?b.target:b;b&&b.nodeType==1&&!/BODY|HTML/.test(b.nodeName);){var c=e(b);if(/scroll|auto/.test(c.css("overflowY")||c.css("overflowX")||c.css("overflow")||""))return b.clientHeight!=b.scrollHeight;b=b.parentNode?b.parentNode:false}return false};this.getViewport=function(b){for(b=b&&b.parentNode?b.parentNode:false;b&&b.nodeType==1&&!/BODY|HTML/.test(b.nodeName);){var c=e(b);if(/scroll|auto/.test(c.css("overflowY")||c.css("overflowX")||c.css("overflow")||"")&&b.clientHeight!=
b.scrollHeight)return c;if(c.getNiceScroll().length>0)return c;b=b.parentNode?b.parentNode:false}return false};this.onmousewheel=function(d){if(b.locked)return true;if(!b.rail.scrollable)return b.railh&&b.railh.scrollable?b.onmousewheelhr(d):true;if(b.opt.preservenativescrolling&&b.checkarea)b.checkarea=false,b.nativescrollingarea=b.isScrollable(d);if(b.nativescrollingarea)return true;if(b.locked)return b.cancelEvent(d);if(b.rail.drag)return b.cancelEvent(d);i(d,false);return b.cancelEvent(d)};this.onmousewheelhr=
function(d){if(b.locked||!b.railh.scrollable)return true;if(b.opt.preservenativescrolling&&b.checkarea)b.checkarea=false,b.nativescrollingarea=b.isScrollable(d);if(b.nativescrollingarea)return true;if(b.locked)return b.cancelEvent(d);if(b.rail.drag)return b.cancelEvent(d);i(d,true);return b.cancelEvent(d)};this.stop=function(){b.cancelScroll();b.scrollmon&&b.scrollmon.stop();b.cursorfreezed=false;b.scroll.y=Math.round(b.getScrollTop()*(1/b.scrollratio.y));b.noticeCursor();return b};this.getTransitionSpeed=
function(d){var c=Math.round(b.opt.scrollspeed*10),d=Math.min(c,Math.round(d/20*b.opt.scrollspeed));return d>20?d:0};b.opt.smoothscroll?b.ishwscroll&&f.hastransition&&b.opt.usetransition?(this.prepareTransition=function(d,c){var g=c?d>20?d:0:b.getTransitionSpeed(d),e=g?f.prefixstyle+"transform "+g+"ms ease-out":"";if(!b.lasttransitionstyle||b.lasttransitionstyle!=e)b.lasttransitionstyle=e,b.doc.css(f.transitionstyle,e);return g},this.doScrollLeft=function(d,c){var g=b.scrollrunning?b.newscrolly:b.getScrollTop();
b.doScrollPos(d,g,c)},this.doScrollTop=function(c,f){var g=b.scrollrunning?b.newscrollx:b.getScrollLeft();b.doScrollPos(g,c,f)},this.doScrollPos=function(c,e,g){var h=b.getScrollTop(),i=b.getScrollLeft();((b.newscrolly-h)*(e-h)<0||(b.newscrollx-i)*(c-i)<0)&&b.cancelScroll();if(b.opt.bouncescroll==false){if(e<0)e=0;else if(e>b.page.maxh)e=b.page.maxh;if(c<0)c=0;else if(c>b.page.maxw)c=b.page.maxw}if(c==b.newscrollx&&e==b.newscrolly)return false;b.newscrolly=e;b.newscrollx=c;b.newscrollspeed=g||false;
if(b.timer)return false;b.timer=setTimeout(function(){var g=b.getScrollTop(),h=b.getScrollLeft(),i,j;i=c-h;j=e-g;i=Math.round(Math.sqrt(Math.pow(i,2)+Math.pow(j,2)));i=b.prepareTransition(b.newscrollspeed?b.newscrollspeed:i);b.timerscroll&&b.timerscroll.tm&&clearInterval(b.timerscroll.tm);if(i>0){!b.scrollrunning&&b.onscrollstart&&b.onscrollstart.call(b,{type:"scrollstart",current:{x:h,y:g},request:{x:c,y:e},end:{x:b.newscrollx,y:b.newscrolly},speed:i});if(f.transitionend){if(!b.scrollendtrapped)b.scrollendtrapped=
true,b.bind(b.doc,f.transitionend,b.onScrollEnd,false)}else b.scrollendtrapped&&clearTimeout(b.scrollendtrapped),b.scrollendtrapped=setTimeout(b.onScrollEnd,i);b.timerscroll={bz:new BezierClass(g,b.newscrolly,i,0,0,0.58,1),bh:new BezierClass(h,b.newscrollx,i,0,0,0.58,1)};if(!b.cursorfreezed)b.timerscroll.tm=setInterval(function(){b.showCursor(b.getScrollTop(),b.getScrollLeft())},60)}b.synched("doScroll-set",function(){b.timer=0;if(b.scrollendtrapped)b.scrollrunning=true;b.setScrollTop(b.newscrolly);
b.setScrollLeft(b.newscrollx);if(!b.scrollendtrapped)b.onScrollEnd()})},50)},this.cancelScroll=function(){if(!b.scrollendtrapped)return true;var c=b.getScrollTop(),e=b.getScrollLeft();b.scrollrunning=false;f.transitionend||clearTimeout(f.transitionend);b.scrollendtrapped=false;b._unbind(b.doc,f.transitionend,b.onScrollEnd);b.prepareTransition(0);b.setScrollTop(c);b.railh&&b.setScrollLeft(e);b.timerscroll&&b.timerscroll.tm&&clearInterval(b.timerscroll.tm);b.timerscroll=false;b.cursorfreezed=false;
b.showCursor(c,e);return b},this.onScrollEnd=function(){b.scrollendtrapped&&b._unbind(b.doc,f.transitionend,b.onScrollEnd);b.scrollendtrapped=false;b.prepareTransition(0);b.timerscroll&&b.timerscroll.tm&&clearInterval(b.timerscroll.tm);b.timerscroll=false;var c=b.getScrollTop(),e=b.getScrollLeft();b.setScrollTop(c);b.railh&&b.setScrollLeft(e);b.noticeCursor(false,c,e);b.cursorfreezed=false;if(c<0)c=0;else if(c>b.page.maxh)c=b.page.maxh;if(e<0)e=0;else if(e>b.page.maxw)e=b.page.maxw;if(c!=b.newscrolly||
e!=b.newscrollx)return b.doScrollPos(e,c,b.opt.snapbackspeed);b.onscrollend&&b.scrollrunning&&b.onscrollend.call(b,{type:"scrollend",current:{x:e,y:c},end:{x:b.newscrollx,y:b.newscrolly}});b.scrollrunning=false}):(this.doScrollLeft=function(c){var f=b.scrollrunning?b.newscrolly:b.getScrollTop();b.doScrollPos(c,f)},this.doScrollTop=function(c){var f=b.scrollrunning?b.newscrollx:b.getScrollLeft();b.doScrollPos(f,c)},this.doScrollPos=function(c,f){function g(){if(b.cancelAnimationFrame)return true;b.scrollrunning=
true;if(n=1-n)return b.timer=p(g)||1;var c=0,d=sy=b.getScrollTop();if(b.dst.ay){var d=b.bzscroll?b.dst.py+b.bzscroll.getNow()*b.dst.ay:b.newscrolly,f=d-sy;if(f<0&&d<b.newscrolly||f>0&&d>b.newscrolly)d=b.newscrolly;b.setScrollTop(d);d==b.newscrolly&&(c=1)}else c=1;var e=sx=b.getScrollLeft();if(b.dst.ax){e=b.bzscroll?b.dst.px+b.bzscroll.getNow()*b.dst.ax:b.newscrollx;f=e-sx;if(f<0&&e<b.newscrollx||f>0&&e>b.newscrollx)e=b.newscrollx;b.setScrollLeft(e);e==b.newscrollx&&(c+=1)}else c+=1;if(c==2){b.timer=
0;b.cursorfreezed=false;b.bzscroll=false;b.scrollrunning=false;if(d<0)d=0;else if(d>b.page.maxh)d=b.page.maxh;if(e<0)e=0;else if(e>b.page.maxw)e=b.page.maxw;e!=b.newscrollx||d!=b.newscrolly?b.doScrollPos(e,d):b.onscrollend&&b.onscrollend.call(b,{type:"scrollend",current:{x:sx,y:sy},end:{x:b.newscrollx,y:b.newscrolly}})}else b.timer=p(g)||1}f=typeof f=="undefined"||f===false?b.getScrollTop(true):f;if(b.timer&&b.newscrolly==f&&b.newscrollx==c)return true;b.timer&&q(b.timer);b.timer=0;var e=b.getScrollTop(),
h=b.getScrollLeft();((b.newscrolly-e)*(f-e)<0||(b.newscrollx-h)*(c-h)<0)&&b.cancelScroll();b.newscrolly=f;b.newscrollx=c;if(!b.bouncescroll||!b.rail.visibility)if(b.newscrolly<0)b.newscrolly=0;else if(b.newscrolly>b.page.maxh)b.newscrolly=b.page.maxh;if(!b.bouncescroll||!b.railh.visibility)if(b.newscrollx<0)b.newscrollx=0;else if(b.newscrollx>b.page.maxw)b.newscrollx=b.page.maxw;b.dst={};b.dst.x=c-h;b.dst.y=f-e;b.dst.px=h;b.dst.py=e;var i=Math.round(Math.sqrt(Math.pow(b.dst.x,2)+Math.pow(b.dst.y,
2)));b.dst.ax=b.dst.x/i;b.dst.ay=b.dst.y/i;var j=0,k=i;if(b.dst.x==0)j=e,k=f,b.dst.ay=1,b.dst.py=0;else if(b.dst.y==0)j=h,k=c,b.dst.ax=1,b.dst.px=0;i=b.getTransitionSpeed(i);b.bzscroll=i>0?b.bzscroll?b.bzscroll.update(k,i):new BezierClass(j,k,i,0,1,0,1):false;if(!b.timer){(e==b.page.maxh&&f>=b.page.maxh||h==b.page.maxw&&c>=b.page.maxw)&&b.checkContentSize();var n=1;b.cancelAnimationFrame=false;b.timer=1;b.onscrollstart&&!b.scrollrunning&&b.onscrollstart.call(b,{type:"scrollstart",current:{x:h,y:e},
request:{x:c,y:f},end:{x:b.newscrollx,y:b.newscrolly},speed:i});g();(e==b.page.maxh&&f>=e||h==b.page.maxw&&c>=h)&&b.checkContentSize();b.noticeCursor()}},this.cancelScroll=function(){b.timer&&q(b.timer);b.timer=0;b.bzscroll=false;b.scrollrunning=false;return b}):(this.doScrollLeft=function(c,f){var g=b.getScrollTop();b.doScrollPos(c,g,f)},this.doScrollTop=function(c,f){var g=b.getScrollLeft();b.doScrollPos(g,c,f)},this.doScrollPos=function(c,f){var g=c>b.page.maxw?b.page.maxw:c;g<0&&(g=0);var e=f>
b.page.maxh?b.page.maxh:f;e<0&&(e=0);b.synched("scroll",function(){b.setScrollTop(e);b.setScrollLeft(g)})},this.cancelScroll=function(){});this.doScrollBy=function(c,f){var g=0,g=f?Math.floor((b.scroll.y-c)*b.scrollratio.y):(b.timer?b.newscrolly:b.getScrollTop(true))-c;if(b.bouncescroll){var e=Math.round(b.view.h/2);g<-e?g=-e:g>b.page.maxh+e&&(g=b.page.maxh+e)}b.cursorfreezed=false;py=b.getScrollTop(true);if(g<0&&py<=0)return b.noticeCursor();else if(g>b.page.maxh&&py>=b.page.maxh)return b.checkContentSize(),
b.noticeCursor();b.doScrollTop(g)};this.doScrollLeftBy=function(c,f){var e=0,e=f?Math.floor((b.scroll.x-c)*b.scrollratio.x):(b.timer?b.newscrollx:b.getScrollLeft(true))-c;if(b.bouncescroll){var h=Math.round(b.view.w/2);e<-h?e=-h:e>b.page.maxw+h&&(e=b.page.maxw+h)}b.cursorfreezed=false;px=b.getScrollLeft(true);if(e<0&&px<=0)return b.noticeCursor();else if(e>b.page.maxw&&px>=b.page.maxw)return b.noticeCursor();b.doScrollLeft(e)};this.doScrollTo=function(c,e){e&&Math.round(c*b.scrollratio.y);b.cursorfreezed=
false;b.doScrollTop(c)};this.checkContentSize=function(){var c=b.getContentSize();(c.h!=b.page.h||c.w!=b.page.w)&&b.resize(false,c)};b.onscroll=function(){b.rail.drag||b.cursorfreezed||b.synched("scroll",function(){b.scroll.y=Math.round(b.getScrollTop()*(1/b.scrollratio.y));if(b.railh)b.scroll.x=Math.round(b.getScrollLeft()*(1/b.scrollratio.x));b.noticeCursor()})};b.bind(b.docscroll,"scroll",b.onscroll);this.doZoomIn=function(c){if(!b.zoomactive){b.zoomactive=true;b.zoomrestore={style:{}};var h="position,top,left,zIndex,backgroundColor,marginTop,marginBottom,marginLeft,marginRight".split(","),
g=b.win[0].style,i;for(i in h){var j=h[i];b.zoomrestore.style[j]=typeof g[j]!="undefined"?g[j]:""}b.zoomrestore.style.width=b.win.css("width");b.zoomrestore.style.height=b.win.css("height");b.zoomrestore.padding={w:b.win.outerWidth()-b.win.width(),h:b.win.outerHeight()-b.win.height()};if(f.isios4)b.zoomrestore.scrollTop=e(window).scrollTop(),e(window).scrollTop(0);b.win.css({position:f.isios4?"absolute":"fixed",top:0,left:0,"z-index":b.opt.zindex+100,margin:"0px"});h=b.win.css("backgroundColor");
(h==""||/transparent|rgba\(0, 0, 0, 0\)|rgba\(0,0,0,0\)/.test(h))&&b.win.css("backgroundColor","#fff");b.rail.css({"z-index":b.opt.zindex+110});b.zoom.css({"z-index":b.opt.zindex+112});b.zoom.css("backgroundPosition","0px -18px");b.resizeZoom();b.onzoomin&&b.onzoomin.call(b);return b.cancelEvent(c)}};this.doZoomOut=function(c){if(b.zoomactive)return b.zoomactive=false,b.win.css("margin",""),b.win.css(b.zoomrestore.style),f.isios4&&e(window).scrollTop(b.zoomrestore.scrollTop),b.rail.css({"z-index":b.ispage?
b.opt.zindex:b.opt.zindex+2}),b.zoom.css({"z-index":b.opt.zindex}),b.zoomrestore=false,b.zoom.css("backgroundPosition","0px 0px"),b.onResize(),b.onzoomout&&b.onzoomout.call(b),b.cancelEvent(c)};this.doZoom=function(c){return b.zoomactive?b.doZoomOut(c):b.doZoomIn(c)};this.resizeZoom=function(){if(b.zoomactive){var c=b.getScrollTop();b.win.css({width:e(window).width()-b.zoomrestore.padding.w+"px",height:e(window).height()-b.zoomrestore.padding.h+"px"});b.onResize();console.log(c);b.setScrollTop(Math.min(b.page.maxh,
c))}};this.init();e.nicescroll.push(this)},z=function(e){var c=this;this.nc=e;this.steptime=this.lasttime=this.speedy=this.speedx=this.lasty=this.lastx=0;this.snapy=this.snapx=false;this.demuly=this.demulx=0;this.lastscrolly=this.lastscrollx=-1;this.timer=this.chky=this.chkx=0;this.time=function(){return+new Date};this.reset=function(e,i){c.stop();var b=c.time();c.steptime=0;c.lasttime=b;c.speedx=0;c.speedy=0;c.lastx=e;c.lasty=i;c.lastscrollx=-1;c.lastscrolly=-1};this.update=function(e,i){var b=c.time();
c.steptime=b-c.lasttime;c.lasttime=b;var b=i-c.lasty,j=e-c.lastx,f=c.nc.getScrollTop(),m=c.nc.getScrollLeft();f+=b;m+=j;c.snapx=m<0||m>c.nc.page.maxw;c.snapy=f<0||f>c.nc.page.maxh;c.speedx=j;c.speedy=b;c.lastx=e;c.lasty=i};this.stop=function(){c.nc.unsynched("domomentum2d");c.timer&&clearTimeout(c.timer);c.timer=0;c.lastscrollx=-1;c.lastscrolly=-1};this.doSnapy=function(e,i){var b=false;if(i<0)i=0,b=true;else if(i>c.nc.page.maxh)i=c.nc.page.maxh,b=true;if(e<0)e=0,b=true;else if(e>c.nc.page.maxw)e=
c.nc.page.maxw,b=true;b&&c.nc.doScrollPos(e,i,c.nc.opt.snapbackspeed)};this.doMomentum=function(e){var i=c.time(),b=e?i+e:c.lasttime,e=c.nc.getScrollLeft(),j=c.nc.getScrollTop(),f=c.nc.page.maxh,m=c.nc.page.maxw;c.speedx=m>0?Math.min(60,c.speedx):0;c.speedy=f>0?Math.min(60,c.speedy):0;b=b&&i-b<=50;if(j<0||j>f||e<0||e>m)b=false;e=c.speedx&&b?c.speedx:false;if(c.speedy&&b&&c.speedy||e){var o=Math.max(16,c.steptime);o>50&&(e=o/50,c.speedx*=e,c.speedy*=e,o=50);c.demulxy=0;c.lastscrollx=c.nc.getScrollLeft();
c.chkx=c.lastscrollx;c.lastscrolly=c.nc.getScrollTop();c.chky=c.lastscrolly;var d=c.lastscrollx,l=c.lastscrolly,g=function(){var b=c.time()-i>600?0.04:0.02;if(c.speedx&&(d=Math.floor(c.lastscrollx-c.speedx*(1-c.demulxy)),c.lastscrollx=d,d<0||d>m))b=0.1;if(c.speedy&&(l=Math.floor(c.lastscrolly-c.speedy*(1-c.demulxy)),c.lastscrolly=l,l<0||l>f))b=0.1;c.demulxy=Math.min(1,c.demulxy+b);c.nc.synched("domomentum2d",function(){if(c.speedx)c.nc.getScrollLeft()!=c.chkx&&c.stop(),c.chkx=d,c.nc.setScrollLeft(d);
if(c.speedy)c.nc.getScrollTop()!=c.chky&&c.stop(),c.chky=l,c.nc.setScrollTop(l);c.timer||(c.nc.hideCursor(),c.doSnapy(d,l))});c.demulxy<1?c.timer=setTimeout(g,o):(c.stop(),c.nc.hideCursor(),c.doSnapy(d,l))};g()}else c.doSnapy(c.nc.getScrollLeft(),c.nc.getScrollTop())}},t=e.fn.scrollTop;e.cssHooks.pageYOffset={get:function(j){var c=e.data(j,"__nicescroll")||false;return c&&c.ishwscroll?c.getScrollTop():t.call(j)},set:function(j,c){var h=e.data(j,"__nicescroll")||false;h&&h.ishwscroll?h.setScrollTop(parseInt(c)):
t.call(j,c);return this}};e.fn.scrollTop=function(j){if(typeof j=="undefined"){var c=this[0]?e.data(this[0],"__nicescroll")||false:false;return c&&c.ishwscroll?c.getScrollTop():t.call(this)}else return this.each(function(){var c=e.data(this,"__nicescroll")||false;c&&c.ishwscroll?c.setScrollTop(parseInt(j)):t.call(e(this),j)})};var u=e.fn.scrollLeft;e.cssHooks.pageXOffset={get:function(j){var c=e.data(j,"__nicescroll")||false;return c&&c.ishwscroll?c.getScrollLeft():u.call(j)},set:function(j,c){var h=
e.data(j,"__nicescroll")||false;h&&h.ishwscroll?h.setScrollLeft(parseInt(c)):u.call(j,c);return this}};e.fn.scrollLeft=function(j){if(typeof j=="undefined"){var c=this[0]?e.data(this[0],"__nicescroll")||false:false;return c&&c.ishwscroll?c.getScrollLeft():u.call(this)}else return this.each(function(){var c=e.data(this,"__nicescroll")||false;c&&c.ishwscroll?c.setScrollLeft(parseInt(j)):u.call(e(this),j)})};var v=function(j){var c=this;this.length=0;this.name="nicescrollarray";this.each=function(e){for(var b=
0;b<c.length;b++)e.call(c[b]);return c};this.push=function(e){c[c.length]=e;c.length++};this.eq=function(e){return c[e]};if(j)for(a=0;a<j.length;a++){var h=e.data(j[a],"__nicescroll")||false;h&&(this[this.length]=h,this.length++)}return this};(function(e,c,h){for(var i=0;i<c.length;i++)h(e,c[i])})(v.prototype,"show,hide,toggle,onResize,resize,remove,stop,doScrollPos".split(","),function(e,c){e[c]=function(){var e=arguments;return this.each(function(){this[c].apply(this,e)})}});e.fn.getNiceScroll=
function(j){return typeof j=="undefined"?new v(this):e.data(this[j],"__nicescroll")||false};e.extend(e.expr[":"],{nicescroll:function(j){return e.data(j,"__nicescroll")?true:false}});e.fn.niceScroll=function(j,c){typeof c=="undefined"&&typeof j=="object"&&!("jquery"in j)&&(c=j,j=false);var h=new v;typeof c=="undefined"&&(c={});if(j)c.doc=e(j),c.win=e(this);var i=!("doc"in c);if(!i&&!("win"in c))c.win=e(this);this.each(function(){var b=e(this).data("__nicescroll")||false;if(!b)c.doc=i?e(this):c.doc,
b=new F(c,e(this)),e(this).data("__nicescroll",b);h.push(b)});return h.length==1?h[0]:h};window.NiceScroll={getjQuery:function(){return e}};if(!e.nicescroll)e.nicescroll=new v})(jQuery);




!function(a){a.fn.slide=function(b){return a.fn.slide.defaults={type:"slide",effect:"fade",autoPlay:!1,delayTime:500,interTime:2500,triggerTime:150,defaultIndex:0,titCell:".h li",mainCell:".b",targetCell:null,trigger:"mouseover",scroll:1,vis:1,titOnClassName:"on",autoPage:!1,prevCell:".prev",nextCell:".next",pageStateCell:".pageState",opp:!1,pnLoop:!0,easing:"swing",startFun:null,endFun:null,switchLoad:null,playStateCell:".playState",mouseOverStop:!0,defaultPlay:!0,returnDefault:!1},this.each(function(){var c=a.extend({},a.fn.slide.defaults,b),d=a(this),e=c.effect,f=a(c.prevCell,d),g=a(c.nextCell,d),h=a(c.pageStateCell,d),i=a(c.playStateCell,d),j=a(c.titCell,d),k=j.size(),l=a(c.mainCell,d),m=l.children().size(),n=c.switchLoad,o=a(c.targetCell,d),p=parseInt(c.defaultIndex),q=parseInt(c.delayTime),r=parseInt(c.interTime);parseInt(c.triggerTime);var Q,t=parseInt(c.scroll),u=parseInt(c.vis),v="false"==c.autoPlay||0==c.autoPlay?!1:!0,w="false"==c.opp||0==c.opp?!1:!0,x="false"==c.autoPage||0==c.autoPage?!1:!0,y="false"==c.pnLoop||0==c.pnLoop?!1:!0,z="false"==c.mouseOverStop||0==c.mouseOverStop?!1:!0,A="false"==c.defaultPlay||0==c.defaultPlay?!1:!0,B="false"==c.returnDefault||0==c.returnDefault?!1:!0,C=0,D=0,E=0,F=0,G=c.easing,H=null,I=null,J=null,K=c.titOnClassName,L=j.index(d.find("."+K)),M=p=-1==L?p:L,N=p,O=p,P=m>=u?0!=m%t?m%t:t:0,R="leftMarquee"==e||"topMarquee"==e?!0:!1,S=function(){a.isFunction(c.startFun)&&c.startFun(p,k,d,a(c.titCell,d),l,o,f,g)},T=function(){a.isFunction(c.endFun)&&c.endFun(p,k,d,a(c.titCell,d),l,o,f,g)},U=function(){j.removeClass(K),A&&j.eq(N).addClass(K)};if("menu"==c.type)return A&&j.removeClass(K).eq(p).addClass(K),j.hover(function(){Q=a(this).find(c.targetCell);var b=j.index(a(this));I=setTimeout(function(){switch(p=b,j.removeClass(K).eq(p).addClass(K),S(),e){case"fade":Q.stop(!0,!0).animate({opacity:"show"},q,G,T);break;case"slideDown":Q.stop(!0,!0).animate({height:"show"},q,G,T)}},c.triggerTime)},function(){switch(clearTimeout(I),e){case"fade":Q.animate({opacity:"hide"},q,G);break;case"slideDown":Q.animate({height:"hide"},q,G)}}),B&&d.hover(function(){clearTimeout(J)},function(){J=setTimeout(U,q)}),void 0;if(0==k&&(k=m),R&&(k=2),x){if(m>=u)if("leftLoop"==e||"topLoop"==e)k=0!=m%t?(0^m/t)+1:m/t;else{var V=m-u;k=1+parseInt(0!=V%t?V/t+1:V/t),0>=k&&(k=1)}else k=1;j.html("");var W="";if(1==c.autoPage||"true"==c.autoPage)for(var X=0;k>X;X++)W+="<li>"+''+"</li>";else for(var X=0;k>X;X++)W+=c.autoPage.replace("$",X+1);j.html(W);var j=j.children()}if(m>=u){l.children().each(function(){a(this).width()>E&&(E=a(this).width(),D=a(this).outerWidth(!0)),a(this).height()>F&&(F=a(this).height(),C=a(this).outerHeight(!0))});var Y=l.children(),Z=function(){for(var a=0;u>a;a++)Y.eq(a).clone().addClass("clone").appendTo(l);for(var a=0;P>a;a++)Y.eq(m-a-1).clone().addClass("clone").prependTo(l)};switch(e){case"fold":l.css({position:"relative",width:D,height:C}).children().css({position:"absolute",width:E,left:0,top:0,display:"none"});break;case"top":l.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; height:'+u*C+'px"></div>').css({top:-(p*t)*C,position:"relative"}).children().css({height:F});break;case"left":l.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; width:'+u*D+'px"></div>').css({width:m*D,left:-(p*t)*D,position:"relative",overflow:"hidden"}).children().css({"float":"left",width:E});break;case"leftLoop":case"leftMarquee":Z(),l.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; width:'+u*D+'px"></div>').css({width:(m+u+P)*D,position:"relative",overflow:"hidden",left:-(P+p*t)*D}).children().css({"float":"left",width:E});break;case"topLoop":case"topMarquee":Z(),l.wrap('<div class="tempWrap" style="overflow:hidden; position:relative; height:'+u*C+'px"></div>').css({height:(m+u+P)*C,position:"relative",top:-(P+p*t)*C}).children().css({height:F})}}var $=function(a){var b=a*t;return a==k?b=m:-1==a&&0!=m%t&&(b=-m%t),b},_=function(b){var c=function(c){for(var d=c;u+c>d;d++)b.eq(d).find("img["+n+"]").each(function(){var b=a(this);if(b.attr("src",b.attr(n)).removeAttr(n),l.find(".clone")[0])for(var c=l.children(),d=0;d<c.size();d++)c.eq(d).find("img["+n+"]").each(function(){a(this).attr(n)==b.attr("src")&&a(this).attr("src",a(this).attr(n)).removeAttr(n)})})};switch(e){case"fade":case"fold":case"top":case"left":case"slideDown":c(p*t);break;case"leftLoop":case"topLoop":c(P+$(O));break;case"leftMarquee":case"topMarquee":var d="leftMarquee"==e?l.css("left").replace("px",""):l.css("top").replace("px",""),f="leftMarquee"==e?D:C,g=P;if(0!=d%f){var h=Math.abs(0^d/f);g=1==p?P+h:P+h-1}c(g)}},ab=function(a){if(!A||M!=p||a||R){if(R?p>=1?p=1:0>=p&&(p=0):(O=p,p>=k?p=0:0>p&&(p=k-1)),S(),null!=n&&_(l.children()),o[0]&&(Q=o.eq(p),null!=n&&_(o),"slideDown"==e?(o.not(Q).stop(!0,!0).slideUp(q),Q.slideDown(q,G,function(){l[0]||T()})):(o.not(Q).stop(!0,!0).hide(),Q.animate({opacity:"show"},q,function(){l[0]||T()}))),m>=u)switch(e){case"fade":l.children().stop(!0,!0).eq(p).animate({opacity:"show"},q,G,function(){T()}).siblings().hide();break;case"fold":l.children().stop(!0,!0).eq(p).animate({opacity:"show"},q,G,function(){T()}).siblings().animate({opacity:"hide"},q,G);break;case"top":l.stop(!0,!1).animate({top:-p*t*C},q,G,function(){T()});break;case"left":l.stop(!0,!1).animate({left:-p*t*D},q,G,function(){T()});break;case"leftLoop":var b=O;l.stop(!0,!0).animate({left:-($(O)+P)*D},q,G,function(){-1>=b?l.css("left",-(P+(k-1)*t)*D):b>=k&&l.css("left",-P*D),T()});break;case"topLoop":var b=O;l.stop(!0,!0).animate({top:-($(O)+P)*C},q,G,function(){-1>=b?l.css("top",-(P+(k-1)*t)*C):b>=k&&l.css("top",-P*C),T()});break;case"leftMarquee":var c=l.css("left").replace("px","");0==p?l.animate({left:++c},0,function(){l.css("left").replace("px","")>=0&&l.css("left",-m*D)}):l.animate({left:--c},0,function(){l.css("left").replace("px","")<=-(m+P)*D&&l.css("left",-P*D)});break;case"topMarquee":var d=l.css("top").replace("px","");0==p?l.animate({top:++d},0,function(){l.css("top").replace("px","")>=0&&l.css("top",-m*C)}):l.animate({top:--d},0,function(){l.css("top").replace("px","")<=-(m+P)*C&&l.css("top",-P*C)})}j.removeClass(K).eq(p).addClass(K),M=p,y||(g.removeClass("nextStop"),f.removeClass("prevStop"),0==p&&f.addClass("prevStop"),p==k-1&&g.addClass("nextStop")),h.html("<span>"+(p+1)+"</span>/"+k)}};A&&ab(!0),B&&d.hover(function(){clearTimeout(J)},function(){J=setTimeout(function(){p=N,A?ab():"slideDown"==e?Q.slideUp(q,U):Q.animate({opacity:"hide"},q,U),M=p},300)});var bb=function(a){H=setInterval(function(){w?p--:p++,ab()},a?a:r)},cb=function(a){H=setInterval(ab,a?a:r)},db=function(){z||(clearInterval(H),bb())},eb=function(){(y||p!=k-1)&&(p++,ab(),R||db())},fb=function(){(y||0!=p)&&(p--,ab(),R||db())},gb=function(){clearInterval(H),R?cb():bb(),i.removeClass("pauseState")},hb=function(){clearInterval(H),i.addClass("pauseState")};if(v?R?(w?p--:p++,cb(),z&&l.hover(hb,gb)):(bb(),z&&d.hover(hb,gb)):(R&&(w?p--:p++),i.addClass("pauseState")),i.click(function(){i.hasClass("pauseState")?gb():hb()}),"mouseover"==c.trigger?j.hover(function(){var a=j.index(this);I=setTimeout(function(){p=a,ab(),db()},c.triggerTime)},function(){clearTimeout(I)}):j.click(function(){p=j.index(this),ab(),db()}),R){if(g.mousedown(eb),f.mousedown(fb),y){var ib,jb=function(){ib=setTimeout(function(){clearInterval(H),cb(0^r/10)},150)},kb=function(){clearTimeout(ib),clearInterval(H),cb()};g.mousedown(jb),g.mouseup(kb),f.mousedown(jb),f.mouseup(kb)}"mouseover"==c.trigger&&(g.hover(eb,function(){}),f.hover(fb,function(){}))}else g.click(eb),f.click(fb)})}}(jQuery),jQuery.easing.jswing=jQuery.easing.swing,jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(a,b,c,d,e){return jQuery.easing[jQuery.easing.def](a,b,c,d,e)},easeInQuad:function(a,b,c,d,e){return d*(b/=e)*b+c},easeOutQuad:function(a,b,c,d,e){return-d*(b/=e)*(b-2)+c},easeInOutQuad:function(a,b,c,d,e){return(b/=e/2)<1?d/2*b*b+c:-d/2*(--b*(b-2)-1)+c},easeInCubic:function(a,b,c,d,e){return d*(b/=e)*b*b+c},easeOutCubic:function(a,b,c,d,e){return d*((b=b/e-1)*b*b+1)+c},easeInOutCubic:function(a,b,c,d,e){return(b/=e/2)<1?d/2*b*b*b+c:d/2*((b-=2)*b*b+2)+c},easeInQuart:function(a,b,c,d,e){return d*(b/=e)*b*b*b+c},easeOutQuart:function(a,b,c,d,e){return-d*((b=b/e-1)*b*b*b-1)+c},easeInOutQuart:function(a,b,c,d,e){return(b/=e/2)<1?d/2*b*b*b*b+c:-d/2*((b-=2)*b*b*b-2)+c},easeInQuint:function(a,b,c,d,e){return d*(b/=e)*b*b*b*b+c},easeOutQuint:function(a,b,c,d,e){return d*((b=b/e-1)*b*b*b*b+1)+c},easeInOutQuint:function(a,b,c,d,e){return(b/=e/2)<1?d/2*b*b*b*b*b+c:d/2*((b-=2)*b*b*b*b+2)+c},easeInSine:function(a,b,c,d,e){return-d*Math.cos(b/e*(Math.PI/2))+d+c},easeOutSine:function(a,b,c,d,e){return d*Math.sin(b/e*(Math.PI/2))+c},easeInOutSine:function(a,b,c,d,e){return-d/2*(Math.cos(Math.PI*b/e)-1)+c},easeInExpo:function(a,b,c,d,e){return 0==b?c:d*Math.pow(2,10*(b/e-1))+c},easeOutExpo:function(a,b,c,d,e){return b==e?c+d:d*(-Math.pow(2,-10*b/e)+1)+c},easeInOutExpo:function(a,b,c,d,e){return 0==b?c:b==e?c+d:(b/=e/2)<1?d/2*Math.pow(2,10*(b-1))+c:d/2*(-Math.pow(2,-10*--b)+2)+c},easeInCirc:function(a,b,c,d,e){return-d*(Math.sqrt(1-(b/=e)*b)-1)+c},easeOutCirc:function(a,b,c,d,e){return d*Math.sqrt(1-(b=b/e-1)*b)+c},easeInOutCirc:function(a,b,c,d,e){return(b/=e/2)<1?-d/2*(Math.sqrt(1-b*b)-1)+c:d/2*(Math.sqrt(1-(b-=2)*b)+1)+c},easeInElastic:function(a,b,c,d,e){var f=1.70158,g=0,h=d;if(0==b)return c;if(1==(b/=e))return c+d;if(g||(g=.3*e),h<Math.abs(d)){h=d;var f=g/4}else var f=g/(2*Math.PI)*Math.asin(d/h);return-(h*Math.pow(2,10*(b-=1))*Math.sin((b*e-f)*2*Math.PI/g))+c},easeOutElastic:function(a,b,c,d,e){var f=1.70158,g=0,h=d;if(0==b)return c;if(1==(b/=e))return c+d;if(g||(g=.3*e),h<Math.abs(d)){h=d;var f=g/4}else var f=g/(2*Math.PI)*Math.asin(d/h);return h*Math.pow(2,-10*b)*Math.sin((b*e-f)*2*Math.PI/g)+d+c},easeInOutElastic:function(a,b,c,d,e){var f=1.70158,g=0,h=d;if(0==b)return c;if(2==(b/=e/2))return c+d;if(g||(g=e*.3*1.5),h<Math.abs(d)){h=d;var f=g/4}else var f=g/(2*Math.PI)*Math.asin(d/h);return 1>b?-.5*h*Math.pow(2,10*(b-=1))*Math.sin((b*e-f)*2*Math.PI/g)+c:.5*h*Math.pow(2,-10*(b-=1))*Math.sin((b*e-f)*2*Math.PI/g)+d+c},easeInBack:function(a,b,c,d,e,f){return void 0==f&&(f=1.70158),d*(b/=e)*b*((f+1)*b-f)+c},easeOutBack:function(a,b,c,d,e,f){return void 0==f&&(f=1.70158),d*((b=b/e-1)*b*((f+1)*b+f)+1)+c},easeInOutBack:function(a,b,c,d,e,f){return void 0==f&&(f=1.70158),(b/=e/2)<1?d/2*b*b*(((f*=1.525)+1)*b-f)+c:d/2*((b-=2)*b*(((f*=1.525)+1)*b+f)+2)+c},easeInBounce:function(a,b,c,d,e){return d-jQuery.easing.easeOutBounce(a,e-b,0,d,e)+c},easeOutBounce:function(a,b,c,d,e){return(b/=e)<1/2.75?d*7.5625*b*b+c:2/2.75>b?d*(7.5625*(b-=1.5/2.75)*b+.75)+c:2.5/2.75>b?d*(7.5625*(b-=2.25/2.75)*b+.9375)+c:d*(7.5625*(b-=2.625/2.75)*b+.984375)+c},easeInOutBounce:function(a,b,c,d,e){return e/2>b?.5*jQuery.easing.easeInBounce(a,2*b,0,d,e)+c:.5*jQuery.easing.easeOutBounce(a,2*b-e,0,d,e)+.5*d+c}});



$(function() {
	$(".win-homepage").click(function() {
		if (document.all) {
			document.body.style.behavior = 'url(#default#homepage)';
			document.body.setHomePage(document.URL);
		} else {
			alert("设置首页失败，请手动设置！");
		}
	});
	$(".win-favorite").click(function() {
		var sURL = document.URL;
		var sTitle = document.title;
		try {
			window.external.addFavorite(sURL, sTitle);
		} catch (e) {
			try {
				window.sidebar.addPanel(sTitle, sURL, "");
			} catch (e) {
				alert("加入收藏失败，请使用Ctrl+D进行添加");
			}
		}
	});
	$(".win-forward").click(function() {
		window.history.forward(1);
	});
	$(".win-back").click(function() {
		window.history.back(-1);
	});
	$(".win-backtop").click(function() {
		$('body,html').animate({
			scrollTop: 0
		}, 1000);
		return false;
	});
	$(".win-refresh").click(function() {
		window.location.reload();
	});
	$(".win-print").click(function() {
		window.print();
	});
	$(".win-close").click(function() {
		window.close();
	});
	$('.checkall').click(function() {
		var e = $(this);
		var name = e.attr("name");
		var checkfor = e.attr("checkfor");
		var type;
		if (checkfor != '' && checkfor != null && checkfor != undefined) {
			type = e.closest('form').find("input[name='" + checkfor + "']");
		} else {
			type = e.closest('form').find("input[type='checkbox']");
		};
		if (name == "checkall") {
			$(type).each(function(index, element) {
				element.checked = true;
			});
			e.attr("name", "ok");
		} else {
			$(type).each(function(index, element) {
				element.checked = false;
			});
			e.attr("name", "checkall");
		}
	});
	$('.dropdown-toggle').click(function() {
		$(this).closest('.button-group, .drop').addClass("open");
	});
	//新增下拉列表移入/移除
	$(".dropdown-hover").hover(function() {
	    $(".button-group, .drop").removeClass("open");
		$(this).closest('.button-group, .drop').addClass("open");
	}, function() {

	});
	$(document).bind("click", function(e) {
		if ($(e.target).closest(".button-group.open, .drop.open").length == 0) {
			$(".button-group, .drop").removeClass("open");
		}
	});
	$checkplaceholder = function() {
		var input = document.createElement('input');
		return 'placeholder' in input;
	};
	if (!$checkplaceholder()) {
		$("textarea[placeholder], input[placeholder]").each(function(index, element) {
			if ($(element).attr("placeholder") || $emptyplaceholder(element)) {
				$(element).val($(element).attr("placeholder"));
				$(element).data("pintuerholder", $(element).css("color"));
				$(element).css("color", "rgb(169,169,169)");
				$(element).focus(function() {
					$hideplaceholder($(this));
				});
				$(element).blur(function() {
					$showplaceholder($(this));
				});
			}
		})
	};
	$emptyplaceholder = function(element) {
		var $content = $(element).val();
		return ($content.length === 0) || $content == $(element).attr("placeholder");
	};
	$showplaceholder = function(element) {
		//不为空及密码框
		if (($(element).val().length === 0 || $(element).val() == $(element).attr("placeholder")) && $(element).attr("type") != "password") {
			$(element).val($(element).attr("placeholder"));
			$(element).data("pintuerholder", $(element).css("color"));
			$(element).css("color", "rgb(169,169,169)");
		}
	};
	var $hideplaceholder = function(element) {
		if ($(element).data("pintuerholder")) {
			$(element).val("");
			$(element).css("color", $(element).data("pintuerholder"));
			$(element).removeData("pintuerholder");
		}
	};
	$('textarea, input, select').blur(function() {
		var e = $(this);
		if (e.attr("data-validate")) {
			e.closest('.field').find(".input-help").remove();
			var $checkdata = e.attr("data-validate").split(',');
			var $checkvalue = e.val();
			var $checkstate = true;
			var $checktext = "";
			if (e.attr("placeholder") == $checkvalue) {
				$checkvalue = "";
			}
			if ($checkvalue != "" || e.attr("data-validate").indexOf("required") >= 0) {
				for (var i = 0; i < $checkdata.length; i++) {
					var $checktype = $checkdata[i].split(':');
					if (!$pintuercheck(e, $checktype[0], $checkvalue)) {
						$checkstate = false;
						$checktext = $checktext + "<li>" + $checktype[1] + "</li>";
					}
				}
			};
			if ($checkstate) {
				e.closest('.form-group').removeClass("check-error");
				e.parent().find(".input-help").remove();
				e.closest('.form-group').addClass("check-success");
			} else {
				e.closest('.form-group').removeClass("check-success");
				e.closest('.form-group').addClass("check-error");
				e.closest('.field').append('<div class="input-help"><ul>' + $checktext + '</ul></div>');
			}
		}
	});
	$pintuercheck = function(element, type, value) {
		$pintu = value.replace(/(^\s*)|(\s*$)/g, "");
		switch (type) {
			case "required":
				return /[^(^\s*)|(\s*$)]/.test($pintu);
				break;
			case "chinese":
				return /^[\u0391-\uFFE5]+$/.test($pintu);
				break;
			case "number":
				return /^([+-]?)\d*\.?\d+$/.test($pintu);
				break;
			case "integer":
				return /^-?[1-9]\d*$/.test($pintu);
				break;
			case "plusinteger":
				return /^[1-9]\d*$/.test($pintu);
				break;
			case "unplusinteger":
				return /^-[1-9]\d*$/.test($pintu);
				break;
			case "znumber":
				return /^[1-9]\d*|0$/.test($pintu);
				break;
			case "fnumber":
				return /^-[1-9]\d*|0$/.test($pintu);
				break;
			case "double":
				return /^[-\+]?\d+(\.\d+)?$/.test($pintu);
				break;
			case "plusdouble":
				return /^[+]?\d+(\.\d+)?$/.test($pintu);
				break;
			case "unplusdouble":
				return /^-[1-9]\d*\.\d*|-0\.\d*[1-9]\d*$/.test($pintu);
				break;
			case "english":
				return /^[A-Za-z]+$/.test($pintu);
				break;
			case "username":
				return /^[a-z]\w{3,}$/i.test($pintu);
				break;
			case "mobile":
				return /^\s*(15\d{9}|13\d{9}|14\d{9}|17\d{9}|18\d{9})\s*$/.test($pintu);
				break;
			case "phone":
				return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/.test($pintu);
				break;
			case "tel":
				return /^((\(\d{3}\))|(\d{3}\-))?13[0-9]\d{8}?$|15[89]\d{8}?$|170\d{8}?$|147\d{8}?$/.test($pintu) || /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/.test($pintu);
				break;
			case "email":
				return /^[^@]+@[^@]+\.[^@]+$/.test($pintu);
				break;
			case "url":
				return /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/.test($pintu);
				break;
			case "ip":
				return /^[\d\.]{7,15}$/.test($pintu);
				break;
			case "qq":
				return /^[1-9]\d{4,10}$/.test($pintu);
				break;
			case "currency":
				return /^\d+(\.\d+)?$/.test($pintu);
				break;
			case "zipcode":
				return /^[1-9]\d{5}$/.test($pintu);
				break;
			case "chinesename":
				return /^[\u0391-\uFFE5]{2,15}$/.test($pintu);
				break;
			case "englishname":
				return /^[A-Za-z]{1,161}$/.test($pintu);
				break;
			case "age":
				return /^[1-99]?\d*$/.test($pintu);
				break;
			case "date":
				return /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/.test($pintu);
				break;
			case "datetime":
				return /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$/.test($pintu);
				break;
			case "idcard":
				return /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/.test($pintu);
				break;
			case "bigenglish":
				return /^[A-Z]+$/.test($pintu);
				break;
			case "smallenglish":
				return /^[a-z]+$/.test($pintu);
				break;
			case "color":
				return /^#[0-9a-fA-F]{6}$/.test($pintu);
				break;
			case "ascii":
				return /^[\x00-\xFF]+$/.test($pintu);
				break;
			case "md5":
				return /^([a-fA-F0-9]{32})$/.test($pintu);
				break;
			case "zip":
				return /(.*)\.(rar|zip|7zip|tgz)$/.test($pintu);
				break;
			case "img":
				return /(.*)\.(jpg|gif|ico|jpeg|png)$/.test($pintu);
				break;
			case "doc":
				return /(.*)\.(doc|xls|docx|xlsx|pdf)$/.test($pintu);
				break;
			case "mp3":
				return /(.*)\.(mp3)$/.test($pintu);
				break;
			case "video":
				return /(.*)\.(rm|rmvb|wmv|avi|mp4|3gp|mkv)$/.test($pintu);
				break;
			case "flash":
				return /(.*)\.(swf|fla|flv)$/.test($pintu);
				break;
			case "radio":
				var radio = element.closest('form').find('input[name="' + element.attr("name") + '"]:checked').length;
				return eval(radio == 1);
				break;
			default:
				var $test = type.split('#');
				if ($test.length > 1) {
					switch ($test[0]) {
						case "compare":
							return eval(Number($pintu) + $test[1]);
							break;
						case "regexp":
							return new RegExp($test[1], "gi").test($pintu);
							break;
						case "length":
							var $length;
							if (element.attr("type") == "checkbox") {
								$length = element.closest('form').find('input[name="' + element.attr("name") + '"]:checked').length;
							} else {
								$length = $pintu.replace(/[\u4e00-\u9fa5]/g, "***").length;
							}
							return eval($length + $test[1]);
							break;
						case "ajax":
							var $getdata;
							var $url = $test[1] + $pintu;
							$.ajaxSetup({
								async: false
							});
							$.getJSON($url, function(data) {
								$getdata = data.getdata;
							});
							if ($getdata == "true") {
								return true;
							}
							break;
						case "repeat":
							return $pintu == jQuery('input[name="' + $test[1] + '"]').eq(0).val();
							break;
						default:
							return true;
							break;
					}
					break;
				} else {
					return true;
				}
		}
	};
	$('form').submit(function() {
		$(this).find('input[data-validate],textarea[data-validate],select[data-validate]').trigger("blur");
		$(this).find('input[placeholder],textarea[placeholder]').each(function() {
			$hideplaceholder($(this));
		});
		var numError = $(this).find('.check-error').length;
		if (numError) {
			$(this).find('.check-error').first().find('input[data-validate],textarea[data-validate],select[data-validate]').first().focus().select();
			return false;
		}
	});
	$('.form-reset').click(function() {
		$(this).closest('form').find(".input-help").remove();
		$(this).closest('form').find('.form-submit').removeAttr('disabled');
		$(this).closest('form').find('.form-group').removeClass("check-error");
		$(this).closest('form').find('.form-group').removeClass("check-success");
	});
	$('.tab .tab-nav li').each(function() {
		var e = $(this);
		var trigger = e.closest('.tab').attr("data-toggle");
		if (trigger == "hover") {
			e.mouseover(function() {
				$showtabs(e);
			});
			e.click(function() {
				return false;
			});
		} else {
			e.click(function() {
				$showtabs(e);
				return false;
			});
		}
	});
	//2015-05-27 新增，ajax提交表单扩展
	$.fn.ajaxSubmit = function(fn) {
		$(this).find('input[data-validate],textarea[data-validate],select[data-validate]').trigger("blur");
		$(this).find('input[placeholder],textarea[placeholder]').each(function() {
			$hideplaceholder($(this));
		});
		var numError = $(this).find('.check-error').length;
		if (numError) {
			$(this).find('.check-error').first().find('input[data-validate],textarea[data-validate],select[data-validate]').first().focus().select();
			return false;
		}
		if (fn && typeof fn == "function") {
			fn()
		}
	};
	$showtabs = function(e) {
		var detail = e.children("a").attr("href");
		e.closest('.tab .tab-nav').find("li").removeClass("active");
		e.closest('.tab').find(".tab-body .tab-panel").removeClass("active");
		e.addClass("active");
		$(detail).addClass("active");
	};
	$('.dialogs').each(function() {
		var e = $(this);
		var trigger = e.attr("data-toggle");
		if (trigger == "hover") {
			e.mouseover(function() {
				$showdialogs(e);
			});
		} else if (trigger == "click") {
			e.click(function() {
				$showdialogs(e);
			});
		}
	});
	//这里目前还存在问题
	$showdialogs = function(e) {
		var trigger = e.attr("data-toggle");
		var getid = e.attr("data-target");
		var data = e.attr("data-url");
		var mask = e.attr("data-mask");
		var width = e.attr("data-width");
		var detail = "";
		var masklayout = $('<div class="dialog-mask"></div>');
		if (width == null) {
			width = "80%";
		}

		if (mask == "1") {
			$("body").append(masklayout);
		}
		detail = '<div class="dialog-win" style="position:fixed;width:' + width + ';z-index:11;">';
		if (getid != null) {
			detail = detail + $(getid).html();
		}
		if (data != null) {
			detail = detail + $.ajax({
				url: data,
				async: false
			}).responseText;
		}
		detail = detail + '</div>';

		var win = $(detail);
		win.find(".dialog").addClass("open");
		$("body").append(win);
		var x = parseInt($(window).width() - win.outerWidth()) / 2;
		var y = parseInt($(window).height() - win.outerHeight()) / 2;
		if (y <= 10) {
			y = 10
		}
		win.css({
			"left": x,
			"top": y
		});
		win.find(".dialog-close,.close").each(function() {
			$(this).click(function() {
				win.remove();
				$('.dialog-mask').remove();
			});
		});
		masklayout.click(function() {
			win.remove();
			$(this).remove();
		});
	};
	$('.tips').each(function() {
		var e = $(this);
		var title = e.attr("title");
		var trigger = e.attr("data-toggle");
		e.attr("title", "");
		if (trigger == "" || trigger == null) {
			trigger = "hover";
		}
		if (trigger == "hover") {
			e.mouseover(function() {
				$showtips(e, title);
			});
		} else if (trigger == "click") {
			e.click(function() {
				$showtips(e, title);
			});
		} else if (trigger == "show") {
			e.ready(function() {
				$showtips(e, title);
			});
		}
	});
	//2015-11-04 修复tips title 重叠
	$showtips = function(e, title) {
		var trigger = e.attr("data-toggle");
		var place = e.attr("data-place");
		var width = e.attr("data-width");
		var css = e.attr("data-style");
		var image = e.attr("data-image");
		var content = e.attr("content");
		var getid = e.attr("data-target");
		var data = e.attr("data-url");
		var x = 0;
		var y = 0;
		var html = "";
		var detail = "";

		if (image != null) {
			detail = detail + '<img class="image" src="' + image + '" />';
		}
		if (content != null) {
			detail = detail + '<p class="tip-body">' + content + '</p>';
		}
		if (getid != null) {
			detail = detail + $(getid).html();
		}
		if (data != null) {
			detail = detail + $.ajax({
				url: data,
				async: false
			}).responseText;
		}
		if (title != null && title != "") {
			if (detail != null && detail != "") {
				detail = '<p class="tip-title"><strong>' + title + '</strong></p>' + detail;
			} else {
				detail = '<p class="tip-line">' + title + '</p>';
			}
			e.attr("title", "");
		}
		detail = '<div class="tip">' + detail + '</div>';
		html = $(detail);

		$("body").append(html);
		if (width != null) {
			html.css("width", width);
		}
		if (place == "" || place == null) {
			place = "top";
		}
		if (place == "left") {
			x = e.offset().left - html.outerWidth() - 5;
			y = e.offset().top - html.outerHeight() / 2 + e.outerHeight() / 2;
		} else if (place == "top") {
			x = e.offset().left - html.outerWidth() / 2 + e.outerWidth() / 2;
			y = e.offset().top - html.outerHeight() - 5;
		} else if (place == "right") {
			x = e.offset().left + e.outerWidth() + 5;
			y = e.offset().top - html.outerHeight() / 2 + e.outerHeight() / 2;
		} else if (place == "bottom") {
			x = e.offset().left - html.outerWidth() / 2 + e.outerWidth() / 2;
			y = e.offset().top + e.outerHeight() + 5;
		}
		if (css != "") {
			html.addClass(css);
		}
		html.css({
			"left": x + "px",
			"top": y + "px",
			"position": "absolute"
		});
		if (trigger == "hover" || trigger == "click" || trigger == null) {
			e.mouseout(function() {
				html.remove();
				e.attr("title", title)
			});
		}
	};
	$('.alert .close').each(function() {
		$(this).click(function() {
			$(this).closest('.alert').remove();
		});
	});
	$('.radio label').each(function() {
		var e = $(this);
		e.click(function() {
			e.closest('.radio').find("label").removeClass("active");
			e.addClass("active");
		});
	});
	$('.checkbox label').each(function() {
		var e = $(this);
		e.click(function() {
			if (e.find('input').is(':checked')) {
				e.addClass("active");
			} else {
				e.removeClass("active");
			};
		});
	});
	$('.collapse .panel-head').each(function() {
		var e = $(this);
		e.click(function() {
			//增加反复折叠判断
			if (e.closest('.collapse').find(".toggle-actvie").html() != '' && e.closest('.collapse').find(".toggle-actvie").html() != undefined) {
				e.closest('.panel').toggleClass("active");
			} else {
				e.closest('.collapse').find(".panel").removeClass("active");
				e.closest('.panel').addClass("active");
			}
		});
	});
	$('.icon-navicon').each(function() {
		var e = $(this);
		var target = e.attr("data-target");
		e.click(function() {
			$(target).toggleClass("nav-navicon");
		});
	});
	$('.banner').each(function() {
		var e = $(this);
		var pointer = e.attr("data-pointer");
		var interval = e.attr("data-interval");
		var style = e.attr("data-style");
		var items = e.attr("data-item");
		var items_s = e.attr("data-small");
		var items_m = e.attr("data-middle");
		var items_b = e.attr("data-big");
		var num = e.find(".carousel .item").length;
		var win = $(window).width();
		var i = 1;

		if (interval == null) {
			interval = 5
		};
		if (items == null || items < 1) {
			items = 1
		};
		if (items_s != null && win > 760) {
			items = items_s
		};
		if (items_m != null && win > 1000) {
			items = items_m
		};
		if (items_b != null && win > 1200) {
			items = items_b
		};

		var itemWidth = Math.ceil(e.outerWidth() / items);
		var page = Math.ceil(num / items);
		e.find(".carousel .item").css("width", itemWidth + "px");
		e.find(".carousel").css("width", itemWidth * num + "px");

		var carousel = function() {
			i++;
			if (i > page) {
				i = 1;
			}
			$showbanner(e, i, items, num);
		};
		var play = setInterval(carousel, interval * 600);

		e.mouseover(function() {
			clearInterval(play);
		});
		e.mouseout(function() {
			play = setInterval(carousel, interval * 600);
		});

		if (pointer != 0 && page > 1) {
			var point = '<ul class="pointer"><li value="1" class="active"></li>';
			for (var j = 1; j < page; j++) {
				point = point + ' <li value="' + (j + 1) + '"></li>';
			};
			point = point + '</ul>';
			var pager = $(point);
			if (style != null) {
				pager.addClass(style);
			};
			e.append(pager);
			pager.css("left", e.outerWidth() * 0.5 - pager.outerWidth() * 0.5 + "px");
			pager.find("li").click(function() {
				$showbanner(e, $(this).val(), items, num);
			});
			var lefter = $('<div class="pager-prev icon-angle-left"></div>');
			var righter = $('<div class="pager-next icon-angle-right"></div>');
			if (style != null) {
				lefter.addClass(style);
				righter.addClass(style);
			};
			e.append(lefter);
			e.append(righter);

			lefter.click(function() {
				i--;
				if (i < 1) {
					i = page;
				}
				$showbanner(e, i, items, num);
			});
			righter.click(function() {
				i++;
				if (i > page) {
					i = 1;
				}
				$showbanner(e, i, items, num);
			});
		};
	});
	$showbanner = function(e, i, items, num) {
		var after = 0,
			leftx = 0;
		leftx = -Math.ceil(e.outerWidth() / items) * (items) * (i - 1);
		if (i * items > num) {
			after = i * items - num;
			leftx = -Math.ceil(e.outerWidth() / items) * (num - items);
		};
		e.find(".carousel").stop(true, true).animate({
			"left": leftx + "px"
		}, 800);
		e.find(".pointer li").removeClass("active");
		e.find(".pointer li").eq(i - 1).addClass("active");
	};
	$(".spy a").each(function() {
		var e = $(this);
		var t = e.closest(".spy");
		var target = t.attr("data-target");
		var top = t.attr("data-offset-spy");
		var thistarget = "";
		var thistop = "";
		if (top == null) {
			top = 0;
		};
		if (target == null) {
			thistarget = $(window);
		} else {
			thistarget = $(target);
		};

		thistarget.bind("scroll", function() {
			if (target == null) {
				thistop = $(e.attr("href")).offset().top - $(window).scrollTop() - parseInt(top);
			} else {
				thistop = $(e.attr("href")).offset().top - thistarget.offset().top - parseInt(top);
			};

			if (thistop < 0) {
				t.find('li').removeClass("active");
				e.parents('li').addClass("active");
			};

		});
	});
	$(".fixed").each(function() {
		var e = $(this);
		var style = e.attr("data-style");
		var top = e.attr("data-offset-fixed");
		if (top == null) {
			top = e.offset().top;
		} else {
			top = e.offset().top - parseInt(top);
		};
		if (style == null) {
			style = "fixed-top";
		};

		$(window).bind("scroll", function() {
			var thistop = top - $(window).scrollTop();
			if (style == "fixed-top" && thistop < 0) {
				e.addClass("fixed-top");
			} else {
				e.removeClass("fixed-top");
			};

			var thisbottom = top - $(window).scrollTop() - $(window).height();
			if (style == "fixed-bottom" && thisbottom > 0) {
				e.addClass("fixed-bottom");
			} else {
				e.removeClass("fixed-bottom");
			};
		});

	});

})



/*
 * metismenu - v2.1.0
 * A jQuery menu plugin
 * https://github.com/onokumus/metisMenu#readme
 *
 * Made by Osman Nuri Okumuş <onokumus@gmail.com> (https://github.com/onokumus)
 * Under MIT License
 */

!function(a){"use strict";function b(){var a=document.createElement("mm"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]};return!1}function c(b){return this.each(function(){var c=a(this),d=c.data("mm"),f=a.extend({},e.DEFAULTS,c.data(),"object"==typeof b&&b);d||c.data("mm",d=new e(this,f)),"string"==typeof b&&d[b]()})}a.fn.emulateTransitionEnd=function(b){var c=!1,e=this;a(this).one("mmTransitionEnd",function(){c=!0});var f=function(){c||a(e).trigger(d.end)};return setTimeout(f,b),this};var d=b();d&&(a.event.special.mmTransitionEnd={bindType:d.end,delegateType:d.end,handle:function(b){return a(b.target).is(this)?b.handleObj.handler.apply(this,arguments):void 0}});var e=function(b,c){this.$element=a(b),this.options=a.extend({},e.DEFAULTS,c),this.transitioning=null,this.init()};e.TRANSITION_DURATION=350,e.DEFAULTS={toggle:!0,doubleTapToGo:!1,activeClass:"active",collapseClass:"collapse",collapseInClass:"in",collapsingClass:"collapsing"},e.prototype.init=function(){var b=this,c=this.options.activeClass,d=this.options.collapseClass,e=this.options.collapseInClass;this.$element.find("li."+c).has("ul").children("ul").attr("aria-expanded",!0).addClass(d+" "+e),this.$element.find("li").not("."+c).has("ul").children("ul").attr("aria-expanded",!1).addClass(d),this.options.doubleTapToGo&&this.$element.find("li."+c).has("ul").children("a").addClass("doubleTapToGo"),this.$element.find("li").has("ul").children("a").on("click.metisMenu",function(d){var e=a(this),f=e.parent("li"),g=f.children("ul");return d.preventDefault(),f.hasClass(c)&&!b.options.doubleTapToGo?(b.hide(g),e.attr("aria-expanded",!1)):(b.show(g),e.attr("aria-expanded",!0)),b.options.doubleTapToGo&&b.doubleTapToGo(e)&&"#"!==e.attr("href")&&""!==e.attr("href")?(d.stopPropagation(),void(document.location=e.attr("href"))):void 0})},e.prototype.doubleTapToGo=function(a){var b=this.$element;return a.hasClass("doubleTapToGo")?(a.removeClass("doubleTapToGo"),!0):a.parent().children("ul").length?(b.find(".doubleTapToGo").removeClass("doubleTapToGo"),a.addClass("doubleTapToGo"),!1):void 0},e.prototype.show=function(b){var c=this.options.activeClass,f=this.options.collapseClass,g=this.options.collapseInClass,h=this.options.collapsingClass,i=a(b),j=i.parent("li");if(!this.transitioning&&!i.hasClass(g)){j.addClass(c),this.options.toggle&&this.hide(j.siblings().children("ul."+g).attr("aria-expanded",!1)),i.removeClass(f).addClass(h).height(0),this.transitioning=1;var k=function(){i.removeClass(h).addClass(f+" "+g).height("").attr("aria-expanded",!0),this.transitioning=0};return d?void i.one("mmTransitionEnd",a.proxy(k,this)).emulateTransitionEnd(e.TRANSITION_DURATION).height(i[0].scrollHeight):k.call(this)}},e.prototype.hide=function(b){var c=this.options.activeClass,f=this.options.collapseClass,g=this.options.collapseInClass,h=this.options.collapsingClass,i=a(b);if(!this.transitioning&&i.hasClass(g)){i.parent("li").removeClass(c),i.height(i.height())[0].offsetHeight,i.addClass(h).removeClass(f).removeClass(g),this.transitioning=1;var j=function(){this.transitioning=0,i.removeClass(h).addClass(f).attr("aria-expanded",!1)};return d?void i.height(0).one("mmTransitionEnd",a.proxy(j,this)).emulateTransitionEnd(e.TRANSITION_DURATION):j.call(this)}};var f=a.fn.metisMenu;a.fn.metisMenu=c,a.fn.metisMenu.Constructor=e,a.fn.metisMenu.noConflict=function(){return a.fn.metisMenu=f,this}}(jQuery);

$(function(){
	 //var nice = $("html").niceScroll();  The document page (body)
	$(".jj_company").niceScroll({cursorborder:"",cursorcolor:"rgba(204, 204, 204, 0.7)",boxzoom:false,touchbehavior:true}); // First scrollable DIV    

    $(".jj_scoll,admin_content").niceScroll({cursorborder:"",cursorcolor:"rgba(204, 204, 204, 0.7)",boxzoom:true,touchbehavior:true}); // First scrollable DIV    
	$(".index_soft_slide").slide({mainCell:".bd ul", effect:"leftLoop",autoPlay:false, scroll:1,vis:4 })
	$("#openClose").click(function(){
		$("#content .left_menu").toggle();
		})
})
	
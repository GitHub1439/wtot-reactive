(function(window){var svgSprite="<svg>"+""+'<symbol id="icon-fanhui" viewBox="0 0 1024 1024">'+""+'<path d="M629.376 160 330.624 467.968 330.624 467.968 288 512 330.624 555.968 330.688 555.968 629.376 863.936 672 819.968 373.312 512 672 204.032Z"  ></path>'+""+"</symbol>"+""+'<symbol id="icon-sousuo" viewBox="0 0 1024 1024">'+""+'<path d="M1012.933455 911.619072l-198.711587-198.70238c53.221641-73.75981 84.585417-164.335014 84.585417-262.237095 0-247.774648-200.864023-448.65197-448.659131-448.65197-247.781809 0-448.659131 200.877322-448.659131 448.65197 0 247.781809 200.877322 448.659131 448.659131 448.659131 97.906173 0 188.480354-31.365822 262.239141-84.58644L911.093767 1013.45876c14.062446 14.056308 36.860467 14.056308 50.922913 0l50.916775-50.916775C1026.995901 948.485678 1026.995901 925.687656 1012.933455 911.619072zM129.6848 450.680621c0-176.989783 143.480732-320.470516 320.470516-320.470516s320.464378 143.480732 320.464378 320.470516c0 176.995921-143.474594 320.476654-320.464378 320.476654S129.6848 627.675519 129.6848 450.680621z"  ></path>'+""+"</symbol>"+""+'<symbol id="icon-fenlei" viewBox="0 0 1024 1024">'+""+'<path d="M64 896l896 0L960 768 64 768 64 896zM64 575.938l896 0L960 447.969 64 447.969 64 575.938zM64 128l0 127.938 896 0L960 128 64 128z"  ></path>'+""+"</symbol>"+""+"</svg>";var script=function(){var scripts=document.getElementsByTagName("script");return scripts[scripts.length-1]}();var shouldInjectCss=script.getAttribute("data-injectcss");var ready=function(fn){if(document.addEventListener){if(~["complete","loaded","interactive"].indexOf(document.readyState)){setTimeout(fn,0)}else{var loadFn=function(){document.removeEventListener("DOMContentLoaded",loadFn,false);fn()};document.addEventListener("DOMContentLoaded",loadFn,false)}}else if(document.attachEvent){IEContentLoaded(window,fn)}function IEContentLoaded(w,fn){var d=w.document,done=false,init=function(){if(!done){done=true;fn()}};var polling=function(){try{d.documentElement.doScroll("left")}catch(e){setTimeout(polling,50);return}init()};polling();d.onreadystatechange=function(){if(d.readyState=="complete"){d.onreadystatechange=null;init()}}}};var before=function(el,target){target.parentNode.insertBefore(el,target)};var prepend=function(el,target){if(target.firstChild){before(el,target.firstChild)}else{target.appendChild(el)}};function appendSvg(){var div,svg;div=document.createElement("div");div.innerHTML=svgSprite;svgSprite=null;svg=div.getElementsByTagName("svg")[0];if(svg){svg.setAttribute("aria-hidden","true");svg.style.position="absolute";svg.style.width=0;svg.style.height=0;svg.style.overflow="hidden";prepend(svg,document.body)}}if(shouldInjectCss&&!window.__iconfont__svg__cssinject__){window.__iconfont__svg__cssinject__=true;try{document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")}catch(e){console&&console.log(e)}}ready(appendSvg)})(window)
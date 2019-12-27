
  function time(){
    //获得显示时间的div
    t_div = document.getElementById('showtime');
   var now=new Date()
    //替换div内容 
    var weekday=new Array(7)
    weekday[0]="星期日"
    weekday[1]="星期一"
    weekday[2]="星期二"
    weekday[3]="星期三"
    weekday[4]="星期四"
    weekday[5]="星期五"
    weekday[6]="星期六"
   t_div.innerHTML = "今天是"+now.getFullYear()
    +"年"+(now.getMonth()+1)+"月"+now.getDate()
    +"日"+now.getHours()+"时"+now.getMinutes()
    +"分"+now.getSeconds()+"秒"+"&nbsp"+ weekday[now.getDay()];
    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
   setTimeout(time,1000);
  }

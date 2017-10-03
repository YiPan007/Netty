<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"content="width=device-width, initial-scale=1"/>
<title>钉钉审批</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/cookie_util.js"></script>
    <script  type="text/javascript">
    // window.addEventListener("popstate", function(e) {
    // 	alert("我监听到了浏览器的返回按钮事件啦");//根据自己的需求实现自己的功能
    // 	window.location.href='start?tel='+getCookie('tel')
    // 	}, false)
        window.onload = function (){
        	var sourceDocument;
        	$.ajax({
                url:getCookie('url'),
                type:'get',
                dataType: 'json',
                success: function(ary){
            for(var i=0; i<ary.length; i++){
                var obj = ary[i];
                var state;
                console.log(obj)
                if(obj.zppsta_0=="3"){
                	state="已审批"
                }else{
                	state='未审批'
                }
                var yzhuti=' ';
                if(obj.yzhuti_0!==undefined){
                	yzhuti=obj.yzhuti_0
                }
                if(obj.zppcdes_0=="采购请求"){
                $('#map2-result').append(
                		'<a href="DPage?number='+obj.zppori_0+'&state='+obj.zppsta_0+'" style="text-decoration:none;color:#000;">'
                		+'<div style="margin-bottom:1em;margin-top:1em; ">'+
                        '<br><p style="color:#009BE1;">原始单据号:&nbsp;<span  class="sd">'+obj.zppori_0+
                        '</span></p><br><p>'+
                        '提交时间:&nbsp;&nbsp;&emsp;'+obj.zppdat_0+'</p><br>主题:&nbsp;'+yzhuti+'</div></a><hr>');
                }
              }
            
          }      
        })
        // $(document).ready(function(e) { 
        // 	alert('1')
        //     var counter = 0;
        //     if (window.history && window.history.pushState) {
        //         $(window).on('popstate', function () {
        //                 window.history.pushState('forward', null, '#');
        //                 window.history.forward(1);
        //                 window.location.href='start?tel='+getCookie('tel')
        //                         });
        //       }
        //       window.history.pushState('forward', null, '#'); //在IE中必须得有这两行
        //       window.history.forward(1);
        // });
        
      }
    </script>
        <style>
        #map2-result{
            margin-top: 1em; 
            margin-left: 2em; 
            margin-bottom:1em; 
            line-height:0.7em;
            font-family:"等线";
        }
         li{
        font-size:1em;
        padding-bottom:0.5em;
        padding-top:0.5em;
        }
        
         hr{
          margin: 0;padding: 0;
        }
        
    </style>
</head>
<body>
    <section>
        <section>
            <section>
                <header id="header">
                    <div>审批单据</div>
                </header>
            </section>
        </section>
    </section>
    <br>
	    <div id="map2-result" style=" font-size: 1em;">
	    </div>
    </body>
</html>
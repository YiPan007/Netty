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
                if(obj.zppcdes_0=="订单管理"){
                $('#map2-result').append(
                		'<a href="DPage?number='+obj.zppori_0+'&state='+obj.zppsta_0+'" style="text-decoration:none;color:#000;">'
                		+'<div style="margin-bottom:1em;margin-top:1em; ">'+
                        '<br><p style="color:#009BE1;">原始单据号:&nbsp;<span  class="sd">'+obj.zppori_0+
                        '</span></p><br><p>'+
                        '提交时间:&nbsp;&nbsp;&emsp;'+obj.zppdat_0+'</p><br>主题:&nbsp;'+obj.yzhuti_0+'</div></a><hr>');
                }
             }
           }      
        })
        $(document).click(function(e) { // 在页面任意位置点击而触发此事件
                 sourceDocument=($(e.target).attr("class"));       // e.target表示被点击的目标
            })
        $(document).click(function(e) { // 在页面任意位置点击而触发此事件
    		if(sourceDocument=="sd"){
            var number=($(e.target).attr("innerHTML"));       // e.target表示被点击的目标
            window.location.href="DPage?number="+number;      //跳转到详情页面 并将原始单号number发送到后台
    		}
        })
    	
    	

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
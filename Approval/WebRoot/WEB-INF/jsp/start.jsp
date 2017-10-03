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
	<link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    <script type="text/javascript" src="js/jquery-1.4.3.js"></script> 
    <script type="text/javascript" src="js/cookie_util.js"></script> 
<script  type="text/javascript">
        window.onload = function (){
        	var phone;
        	var username;
            var zt;
        	$.ajax({
                url:'actions?yddusr_0=${tel }',
                type:'get',
                dataType: 'json',
                success: function(ary){
                    for(var i=0; i<ary.length; i++){
                    	var list = ary[i];
                    	console.log(list)
                    	phone=list.yddusr_0;
                    	username=list.usr_0;
                        if(list.usr_0==null){
                        	window.location.href="start404"
                        }
                        console.log('${tel}')
                    addCookie("zt","wsp");
                    addCookie("url","threes?yddusr_0="+list.yddusr_0);
                    document.getElementById("wsp").style.color ='#4EA8ED';
                    addCookie("tel",list.yddusr_0);
                    addCookie("user",list.usr_0);
                    var oBtn = document.getElementById('ysp');
                    oBtn.onclick = function() {
                    zt = 'ysp';
                    addCookie("zt","ysp");
                    document.getElementById("wsp").style.color ='#F8B55E';
                    document.getElementById("ysp").style.color ='#4EA8ED';
                    addCookie("url","agins?yddusr_0="+list.yddusr_0);
                    console.log(zt)
                    }
                    var oBtn = document.getElementById('wsp');
                    oBtn.onclick = function() {
                             zt='wsp'
                            	 addCookie("zt","wsp");
                    document.getElementById("ysp").style.color ='#F8B55E';
                    document.getElementById("wsp").style.color ='#4EA8ED';
                    addCookie("url","threes?yddusr_0="+list.yddusr_0);
                            console.log(zt) 
                }
		        }
        	}
        	})
			var cgqq = document.getElementById('cgqq');
			cgqq.onclick = function() {
                   addCookie('qq','1')
	               window.location.href="sr?yddusr_0="+phone+ "&username="+username
                }
            var xsdd = document.getElementById('xsdd');
            xsdd.onclick = function() {
                addCookie('qq','2')
                   window.location.href="so?yddusr_0="+phone+ "&username="+username
                }
            var fkgl = document.getElementById('fkgl');
            fkgl.onclick = function() {
                addCookie('qq','3')
                   window.location.href="ptp?yddusr_0="+phone+ "&username="+username
                }
					$.ajax({
		                url:'threes?yddusr_0='+getCookie('tel'),
		                type:'get',
		                dataType: 'json',
		                success: function(ary){
		                	 document.getElementById("1").innerHTML=ary.length;
		                	if(ary.length>0){
		                		$('#div1').show();
		                	}
		                }
		                });
					} 
    </script>
    <style type="text/css">
        button{
            margin:0; padding:0; list-style-type:none;border: 0;background-color: #fff;
        }
        #box{display: flex;justify-content: space-between;margin:20px;-webkit-flex;}
        #box1{display: flex;justify-content: space-between;margin-left:30px;margin-right: 30px;}
        .imga{width: 60px;height: 60px;}
        .imgb{width: 60px;height: 60px;}
        #div1{width:15px; height:15px; background-color:#F00;border-radius:20px;position:absolute;left:75%;top:-10%;}
        #wsp{position:relative;}
        #ysp{margin-left:50%;}
        #xsdd{margin-left: 12%;width: 70px;}
        #fkgl{margin-left: 10%;}
        #cgqq{margin-left: 7%;}
    </style>
</head>
<body>
    <header id="header" style="font-size:2em">
        <div>传奇国际</div>
     </header>
     <div id="box">
    <button id="wsp">
        <div id="div1">
             <span id="1" style="color:#fff;font-size:1px;margin-left: 3px;"></span>
        </div>
            <img class="imga" src="img/wsp.png"><br>
            <span>未审批</span>
    </button>
    <button id="ysp">
        <img class="imga" src="img/ysp.png"><br>
    <span>已审批</span>
    </button>
    </div>
    <div style="width: 100%;height: 1em; background-color: #f8f6f8;"></div>
    <div>
        <p style="margin-left:2em;position:relative;width: 100%;color:#4EA8ED;"><b>单据审批</b></p>
    </div>
    <div>
              <button id="cgqq"><img class="imgb" src="img/cg.png"><br><span>采购请求</span></button>
              <button id="xsdd"><img class="imgb" src="img/xs.png"><br><span style="text-align:center;">销售订单</span></button>
              <button id="fkgl"><img class="imgb" src="img/fk.png"><br><span>付款管理</span></button>
        </div>
   </body>
</html>
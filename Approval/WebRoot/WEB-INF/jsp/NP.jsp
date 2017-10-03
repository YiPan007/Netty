<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"content="width=device-width, initial-scale=1"/>
<title>钉钉审批</title>
  <link rel="stylesheet" href="css/index.css">
  <script src="js/jquery-1.7.2.min.js"></script> 
    <script type="text/javascript" src="js/cookie_util.js"></script> 
    <script type="text/javascript" src="js/vue.js"></script> 
    <script  type="text/javascript">
    history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
		});
       window.onload = function (){
        $.ajax({
                url:'NewJob',
                type:'get',
                dataType: 'json',
                success: function(ary){
                	   	for(var i=0; i<ary.length;i++){
                             console.log((ary[i].split("_"))[1])
                              $('#newperpon').append(
        			             '<p>'+(ary[i].split("_"))[1]+'</p>'
                     )
                            }
                }
                })
       }
    </script>
    <style>
       p{
            color: #4EA8ED; font-size: 30px;
        }
    </style>
</head>
<body style="background-color: #eee;">
    <div id="newperpon" style="margin-left: 20%; margin-top: 15%;">
    <h1>已添加审批人:</h1>
    </div>
    <h2 id="app" style="margin-left:20%;">点击"<span id="fh"  style="color: #4EA8ED;" @click="say" >返回</span>"，回到审批页面</h2>
</body>
<script type="text/javascript">
    var vm = new Vue({
    el: '#app',
    data:{
        
    },
    methods :{
        say: function(){
            window.location.href="sr?yddusr_0=" + getCookie('tel'); 
        }
    }
});
    
</script>
</html>
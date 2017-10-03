<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>传奇国际</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/cookie_util.js"></script>
<script>
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
		});
	$(document).click(function(e) { // 在页面任意位置点击而触发此事件
		console.log(getCookie('tel'));
		window.location.href = "sr?yddusr_0=" + getCookie('tel') 
	})
window.onload = function(){
	 var ok = document.getElementById('1');
			ok.onclick = function() {
				window.location.href="sr?yddusr_0=" + getCookie('tel');
		}
			
			if('Y'==getCookie('YN')){
				 $('#su').append(
			             '<p>已审批同意</p>'
		     			  )
			}
			if('N'==getCookie('YN')){
				 $('#su').append(
			             '<p>审批不同意</p>'
		     			  )
			}
	}
	

</script>
</head>
<body>
	<p style=" font-size: 40px; margin-left: 20%;margin-top: 30%;" id="su"></p>
	<p style=" font-size: 40px; margin-left: 20%;">点击按钮"<span id="1" style="color:#4EA8ED;">返回</span>"未审批首页</p>
	<div style="text-align:center;">
		<a id = "1" class="btn btn-info btn-lg"
			style=" font-size: 80px;color: #FFF;margin-left: 20px;margin-top:200px; width: 50%; height:120px;font-family:等线;">返回</a>
	</div>
</body>
</html>
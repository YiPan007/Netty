<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加审批人</title>
	<link rel="stylesheet" href="css/index.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="css/switchery.min.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.4.3.js"></script> 
	<script type="text/javascript" src="js/switchery.min.js"></script>
  <script type="text/javascript" src="js/cookie_util.js"></script> 
<script>
window.onload = function (){
  	$.ajax({
        url:'insertZeaaPosts',
          type:'get',
          dataType: 'json',
          success: function(ary){
        	for(var i=0; i<ary.length; i++){
        		var list = ary[i];
            console.log(list)
            	$('#result').append(
            			'<p><label><input type="checkbox" class="js-switch"  name="zptnum_0"  value="'+list.zptnum_0+"_"+list.zptdes_0+'"/>'+list.zptdes_0+'</label></p>'
                       );
            
                 }
        	if (Array.prototype.forEach) {
                var elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));
                elems.forEach(function(html) {
                  var switchery = new Switchery(html);
                });
              }
        	   }
          })
    var oBtn = document.getElementById('btn');
      oBtn.onclick = function() {
        var id = document.getElementsByName('zptnum_0');
        var value;
       for(var i = 0; i < id.length; i++){

         if(id[i].checked){
          var as=(id[i].value).split("_"); 
          value.push(as[1])
        }
      }
      addCookie("newjob",value);
      console.log(value)
    }
}
</script>
<style type="text/css">
  td{
           border: solid #ccc; font-size: 35px; width: 9%; text-align:center;height: 40px; border-bottom: solid #ccc; 
         }
    label{
      margin-right: 20%; font-size: 35px;
    }
</style>
</head>
<body>
    <header id="header">
        <div>添加审批人</div>
     </header>
      <form id="f1" action="insertZappdata?rowid3=${id }"  method="post">
        <div id="result" style="margin-top: 50px; margin-left: 20%;">
        </div>
        <button class="btn btn-info btn-lg" id="btn" style="font-size: 40px; height:60px; 
         margin-top: 40px; margin-left:38%;">确定并提交</button>
      </form>
      </body>
</html>
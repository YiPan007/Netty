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
	<link rel="stylesheet" href="css/icon.css"/>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    <script type="text/javascript" src="js/formatDate.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.3.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/cookie_util.js"></script>
    <script  type="text/javascript">
        window.onload = function (){
        document.getElementById('1').backgroundColor="#4EA8ED";
        	var obj;
            	$.ajax({
                    url:'${ dataurl.dataurl }',
                    type:'post',
                    dataType: 'json',
                    success: function(ary){
            for(var i=0; i<ary.length; i++){
                  obj = ary[i];
                  addCookie('numid',obj.zppori_0);
                var checked = obj.zppsta_0==3;
                bst=obj.zppsta_0;
                if(checked){
                	var state="未审批"
                    	if(obj.zppsta_0=="3"){
                    		
                    		state="已审批"
                    	}
                    	var fawuqz="否"
                    	if(obj.yfawuqz_0=="2"){
                    		fawuqz="是"
                    	}
                    	var yusuan="否"
                    	if(obj.yusuan_0=="2"){
                    		yusuan="是"
                    	}
                    	var zppagr="";
                    	if(obj.zppagr_0=="1"){
                    		zppagr="不同意"
                    	}
                    	if(obj.zppagr_0=="2"){
                    		zppagr="同意"
                    	}
                    	var today=obj.zppadat_0;
                    	var idea;
                    	if(obj.zppmemo_0!==" "){
                    		idea=obj.zppmemo_0;
                    	}
                    	 var page;
                         if(page!=="1"){
                          $('#map2-result').append(
                             '<p>原始单据号&nbsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="zppori_0" value="'+obj.zppori_0+'">'+obj.zppori_0+'</p><hr>'+
                             '<p>&emsp;提交人&emsp;&nbsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="zppusrdes_0" value="'+obj.zppusrdes_0+'">'+obj.zppusr4_0+'</p><hr>'+
                             '<p>&emsp;申请人&emsp;&nbsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="zppusrdes_0" value="'+obj.zppusrdes_0+'">'+obj.zppusr5_0+'</p><hr>'+
                             '<p>&nbsp;提交日期&emsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="xppdat_0" maxlength="10" value="'+obj.zppdat_0+'">'+obj.zppdat_0+'</p><hr>'+
                             //'<p>&nbsp;审批状态&emsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="zppsta_0" value="'+states+'">'+state+'</p><hr>'+
                             '<p>&nbsp;审批意见&emsp;<span>|</span>&emsp;'+obj.zppmemo_0+'</p><hr>'+
                             '<p>&nbsp;预算内&emsp;&emsp;<span>|</span>&emsp;'+yusuan+'<hr>&emsp;</p>'+
                             '<p>&nbsp;法务签字&emsp;<span>|</span>&emsp;'+fawuqz+'&emsp;</p>'
                             
                             );
                          page="1"
                         }
                        
                        document.getElementById("btn1").disabled = true; //如何状态为已审批 ，则将按钮置灰
                       	document.getElementById("btn2").disabled = true;
                       	document.getElementById("btn3").disabled = true;
                       	document.getElementById("btn4").disabled = true;
                }else{
                bst=obj.rowid;
            	var state="未审批"
            	if(obj.zppsta_0=="3"){
            		
            		state="已审批"
            	}
            	var yusuan="否"
            	if(obj.yusuan_0=="2"){
            		yusuan="是"
            	}
            	var zppagr="";
            	if(obj.zppagr_0=="1"){
            		zppagr="不同意"
            	}
            	if(obj.zppagr_0=="2"){
            		zppagr="同意"
            	}
            	var today=obj.zppadat_0;
            	if(obj.zppadat_0==" "){
            	var d = new Date();
            	
            	today =formatDate(d);
            	}
            	var idea;
            	if(obj.zppmemo_0!==" "){
            		idea=obj.zppmemo_0;
            	}
            	var yusuans = parseInt(obj.yusuan_0)
				      var states = parseInt(obj.zppsta_0)
				      var fwstate;
               var bt1 = document.getElementById('btn1');  
               var bt2 = document.getElementById('btn2');
               var bt3 = document.getElementById('btn3');
               var bt4 = document.getElementById('btn4');
               bt1.onclick = function() {
                 $('#f1').attr('action','updateOn?rowid1='+obj.rowid);
                 $('#fawuqz').val();
                 fwstate=$('#fawuqz option:selected').val();
                 var yusuan1=$('#yusuan option:selected').val();
                 var fwstates = parseInt(fwstate)
                 var yusuan2 = parseInt(yusuan1)
                 $('#hr1').append(
                     '<input type="hidden" name="yfawuqz_0" value="'+fwstates+'"><input type="hidden" name="yusuan_0" value="'+yusuan2+'">'
                     )
                    addCookie("YN","Y");
                    } 
                bt2.onclick = function() {
                	$('#f1').attr('action','updateThree?rowid3='+obj.rowid);
                	addCookie("YN","N");
                }
                bt4.onclick = function() {
                  $('#f1').attr('action','start?tel='+getCookie('tel'));
                }
                bt3.onclick = function() {
                  $('#f1').attr('action','nowjob?rowid4='+obj.rowid );
                }
                var page;
                if(page!=="1"){
                 $('#map2-result').append(
                    '<p>原始单据号<span style="margin-left:5px;">|</span>&emsp;<input type="hidden" class="pan" name="zppori_0" value="'+obj.zppori_0+'">'+obj.zppori_0+'</p><hr>'+
                    '<p>提交人<span style="margin-left:35px;">|</span>&emsp;<input type="hidden" class="pan" name="zppusrdes_0" value="'+obj.zppusrdes_0+'">'+obj.zppusr4_0+'</p><hr>'+
                    '<p>申请人<span style="margin-left:35px;">|</span>&emsp;<input type="hidden" class="pan" name="zppusrdes_0" value="'+obj.zppusrdes_0+'">'+obj.zppusr5_0+'</p><hr>'+
                    '<p>提交日期<span style="margin-left:20px;">|</span>&emsp;<input type="hidden" class="pan" name="xppdat_0" value="'+obj.zppdat_0+'">'+obj.zppdat_0+'</p><hr>'+
                    // '<p>&nbsp;审批状态&emsp;<span>|</span>&emsp;<input type="hidden" class="pan" name="zppsta_0" value="'+states+'">'+state+'</p><hr>'+
                    '<p>审批意见<span style="margin-left:20px;">|</span>&emsp;<input type="text" style="border:none; outline:none; width:60%" class="pan" name="zppmemo_0"></p><hr>'+
                    '<p>预算内<span style="margin-left:35px;">|</span>&emsp;'+
                    '<select style="-webkit-appearance:none; width:100px;border:none; outline:none;" id="yusuan" >'+
                    	'<option  value="1" id="ysNO" selected>否</option>'+
                    	'<option  value="2" id="ysYes">是</option>'+
                	'<select>'+
                    '<hr></p>'+
                    '<p>法务签字<span style="margin-left:20px;">|</span>&emsp;'+
                    '<select style="-webkit-appearance:none; width:100px;border:none; outline:none;" id="fawuqz" >'+
                    	'<option  value="1" id="NO" selected>否</option>'+
                        '<option  value="2" id="Yes">是</option>'+
                    '<select></p>'
                    
                    );
                 page="1"
                }
                if(obj.yfawuqz_0=="1"){
                   $('#NO').attr('selected','selected');
                }
                if(obj.yfawuqz_0=="2"){
                   $('#Yes').attr('selected','selected')
                }
                //预算
                if(obj.yusuan_0=="1"){
                   $('#ysNO').attr('selected','selected');
                }
                if(obj.yusuan_0=="2"){
                   $('#ysYes').attr('selected','selected')
                }
            	}
            } //判断是已审批还是未审批结束
        	}          
      	})

        $.ajax({
                    url:'aginTos1?ypshnum_0='+getCookie('numid'),
                    type:'post',
                    dataType: 'json',
                    success: function(ary){
                      console.log(ary)
            for(var i=0; i<ary.length; i++){
                var arry = ary[i];
                console.log(arry)
                if(getCookie('qq')=="1"){
                $('#result').append(
                            '<tr">'+
                                '<td class="tds">'+arry.yshuom_0+'</td>'+
                                '<td class="tds">'+arry.ysqlin_0+'</td>'+
                                '</td>'+
                            '</tr>'
                  );
                }
                }
              }
          });
          //document.getElementById("1").style.background-color="#4EA8ED";
              if(getCookie('qq')!= "1"){
                console.log("12eew")
                document.getElementById("result2").style.display="none";
                document.getElementById("result").style.display="none";
                document.getElementById("footer").style.display="none";
              }
            
      	     var sqnr = document.getElementById('1');
                 sqnr.onclick = function() {
                  document.getElementById("2").style.backgroundColor = "#fff";
                  document.getElementById("2").style.color = "#000";
                  document.getElementById("1").style.backgroundColor = "#4EA8ED";
                  document.getElementById("1").style.color = "#fff";
                  document.getElementById("result2").style.display="none";
                  $('#result').show();
                 }
              var sqnr = document.getElementById('2');
                 sqnr.onclick = function() {
                  document.getElementById("1").style.backgroundColor = "#fff";
                  document.getElementById("1").style.color = "#000";
                  document.getElementById("2").style.backgroundColor = "#4EA8ED";
                  document.getElementById("2").style.color = "#fff";
                  document.getElementById("result").style.display="none";
                  $('#result2').show();
                 }
                  $.ajax({
                    url:'aginTos2?pshnum_0='+getCookie('numid'),
                    type:'post',
                    dataType: 'json',
                    success: function(ary){
                      console.log(ary)
            for(var i=0; i<ary.length; i++){
                var arrys = ary[i];
                console.log(arrys)
                $('#result2').append(
                            '<tr">'+
                                '<td class="tds">'+arrys.itmref_0+'</td>'+
                                '<td class="tds">'+arrys.itmdes_0+'</td>'+
                                '<td class="tds">'+arrys.bpsnum_0+'</td>'+
                                '<td class="tds">'+arrys.yhshtdj_0+'</td>'+
                                '<td class="tds">'+arrys.qtypuu_0+'</td>'+
                                '<td class="tds">'+arrys.linatiamt_0+'</td>'+
                                '</td>'+
                            '</tr>'
                  );
                }
              }
          });                 
    }	
           
    </script>
        <style>
        p{font-size: 15px; margin:0; border: 0;padding:0;line-height:1.5em;}
        span{font-size: 0.8em; color: #ccc; margin: 0;border: 0;padding: 0;}
        td{border-right: solid #ccc; font-size: 10px; width: 9%; text-align:center;height: 1.5em; border-bottom: solid #ccc; }
        button{margin:0; padding:0; list-style-type:none;border: 0;background-color: #fff;}
        .pan{font-size: 20px;  color: #000;}
        hr{margin: 0;padding: 0; border: 0;}
        li{font-size: 50px;line-height:85px;}
        input{margin:0; border: 0;padding:0;}
        .tds{border:color:#000; font-size: 10px; width: 9%; text-align:center;height: 1.5em;}
        .spand{color: #000; margin-left: 10px;}
        select{background-color:#fff;}
        #box{display: flex;display: -webkit-flex;justify-content: flex-start;flex-wrap: wrap;margin:10px;}
        img{width: 60px;height: 60px;}
       .btnm{ margin-left:4%;}
    </style>
</head>
<body>
    <header id="header">
        <div>审批单据详情</div>
     </header>
     <form id="f1"  method="post" action="">
         <div id="map2-result" style="margin-left: 25px; font-size: 30px;">
        </div><hr style="padding: 0;margin: 0; " id="hr1">
        <div style="height: 10px; background: #eee;"></div>
        <hr style="padding: 0;margin: 0;">
        <div id="map2-result" style=" font-size: 0.8em;">
     </div>
      <table>
          <tr style="border: 0;">
          <td id="1" style="color:#000; line-height: 2em;margin-left: 2em;background-color:#4EA8ED;color:#fff;border: 0;">申请内容</td>
          <td id="2" style="color:#000;border: 0;">产品行</td>
          </tr>
     </table>

     <table id="result" style="border:solid #ccc; font-size: 10px; margin-top: 2px;">
            <tr>
                <td class="tds">说明</td>
                <td class="tds">预计金额</td>
            </tr>
        </table>
      <table id="result2" style="border:solid #ccc; font-size: 10px; margin-top: 2px; display:none;">
            <tr>
                <td class="tds">产品编码</td><td class="tds">描述</td><td class="tds">供应商</td><td class="tds">合同单价</td>
                <td class="tds">数量</td>
                <td class="tds">含税行金额</td>
            </tr>
        </table>
        <div id="box">
            <button id="btn1" class="btnm"><img src="img/ty.png"><br><p style="font-size: 10px;">审批同意</p></button>
            <button id="btn2" class="btnm"><img src="img/btysp.png"><br><p style="font-size: 10px;">审批不同意</p></button>
            <button id="btn3" class="btnm"><img src="img/tj.png"><br><p style="font-size: 10px;">添加审批人</p></button>
            <button id="btn4" class="btnm"><img src="img/fh.png"><br><p style="font-size: 10px;">返回首页</p></button>
            </form>
        </div>
        <script src="js/index.js"></script>
        <script type="text/javascript">
        </script>
    </body>
</html>
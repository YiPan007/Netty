<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'three.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1 align="center" ><font color="#00AEAE">审批</font></h1>
   		<c:forEach items="${listZappUp }" var="lzu">
   		<form action="updateOn?rowid1=${lzu.rowid }" method="post">
   		<table border="1px" align="center" width="80%">
   			<tr>
   				<td align="center" colspan="2">未审批</td>
   			</tr>
   			<!--  <tr>
   				<td colspan="2" align="center">
   					
   				 <a href="/Approval/agin?zptnum=2">已审批</a>
   				<button>未审批</button>
   				</td>
   				
   			</tr>-->
   			
   			<tr>
   					
   					<td>审批原始编号:</td>
   					<td>
   					 	<input type="hidden" name="rowid" value="${lzu.rowid }"> ${lzu.rowid }
   						<input type="hidden" name="zppori_0"value="${lzu.zppori_0 }">
   						${lzu.zppori_0 }
   						
   					</td>
   			</tr>
   			<tr>
   			
   					<td>当前审批:</td>
   				
   					<td>
   						<input type="hidden" name="zppcurr_0"value="${lzu.zppcurr_0 }">
   						${lzu.zppcurr_0 }
   						
   					</td>
   			</tr>
   			<tr>
   					<td>审批人:</td>
   					<td><input type="hidden" name="zppusrdes_0"value="${lzu.zppusrdes_0 }">${lzu.zppusrdes_0 }</td>
   			</tr>		
   			<tr>
   					<td>审批状态:</td>
   					<td><input type="hidden" name="zppsta_0"value="${lzu.zppsta_0 }">${lzu.zppsta_0 }</td>
   			</tr>
   			<tr>
   					<td>备注:</td>
   					<td>
   						<input type="text" name="zppmemo_0" value="${lzu.zppmemo_0 }">${lzu.zppmemo_0 }</td>
   					
   			</tr>
   			<tr>
   					<td>职位:</td>
   					<td><input type="hidden" name="zptnum_0" value="${lzu.zptnum_0 }">${lzu.zptnumdes_0 }</td>
   			</tr>
   			<tr>
   					<td>地址:</td>
   					<td><input type="hidden" name="yfcy_0" value="${lzu.yfcy_0 }">${lzu.yfcydes_0 }</td>
   			</tr>
   			<tr>
   					<td>预算内:</td>
   					<td><input type="hidden" name="yusuan_0" value="${lzu.yusuan_0 }">${lzu.yusuan_0 }</td>
   			</tr>
   			<tr>
   					<td>法务签字:</td>
   					<td><input type="hidden" name="yfawuqz_0" value="${lzu.yfawuqz_0 }">${lzu.yfawuqz_0 }${lzu.zppcdes_0 }</td>
   			</tr>
   			
   			<tr>
   					<td colspan="2" align="center">
   						
   						<input type="submit" value="审批同意">
   						
   						<a href="/Approval/updateTo?rowid2=${lzu.rowid }"> 审批不同意</a>
   						<a href="/Approval/updateThree?rowid3=${lzu.rowid }"> 审批不同意退回上一级</a>
   					</td>
   					
   			</tr>
   		</table>
   		<br><br>
   		</form>
   		</c:forEach>
  </body>
</html>

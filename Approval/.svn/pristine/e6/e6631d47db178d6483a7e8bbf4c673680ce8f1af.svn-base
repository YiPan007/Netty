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
    
    <title>My JSP 'agin.jsp' starting page</title>
    
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
   		
   		<c:forEach items="${listZapp }" var="lz">
   		<table border="1px" align="center" width="80%">
   			<tr>
   				<td align="center" colspan="2">已审批</td>
   			</tr>
   			<!--  <tr>
   				<td colspan="2" align="center">
   					
   				 <a href="/Approval/agin?zptnum=2">已审批</a>
   				<button>未审批</button>
   				</td>
   				
   			</tr>-->
   			
   			<tr>
   					<td>审批编号:</td>
   					<td><a href="/Approval/aginTo?zppori_0=${lz.zppori_0  }">${lz.zppori_0 }</a></td>
   			</tr>
   			<tr>
   					<td>审批人:</td>
   				
   					<td>${lz.zppusrdes_0 }</td>
   			</tr>		
   			<tr>
   					<td>审批状态:</td>
   					<td><!-- ${lz.zppsta_0 } -->已审核</td>
   			</tr>
   			<tr>
   					<td>备注:</td>
   					<td>${lz.zppmemo_0 }</td>
   			</tr>
   			<tr>
   					<td>职位:</td>
   					<td>${lz.zptnumdes_0 }</td>
   					<td>${lz.zppcdes_0 }</td>
   			</tr>
   			<tr>
   					<td>地址:</td>
   					<td>${lz.yfcy_0 }</td>
   			</tr>
   			
   			
   		</table>
   		<br>
   		</c:forEach>
  </body>
</html>

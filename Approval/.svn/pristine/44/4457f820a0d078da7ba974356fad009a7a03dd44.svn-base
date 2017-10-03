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
    
    <title>My JSP 'action.jsp' starting page</title>
    
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
  <c:forEach items="${list2 }" var="Au2">
  		${Au2.zptnum_0 }
  		${Au2.zptdes_0 }
  		${Au2.upddat_0 }
  		${Au2.updusr_0 }
  		${Au2.creusr_0 }
  
  </c:forEach>
   		
   		<c:forEach items="${list}" var="AU">
   		
   		<table border="1px" align="center" width="80%">
   			<tr>
   				<td align="center" colspan="2">个人资料</td>
   			</tr>
   			<tr>
   				<td colspan="2" align="center">
   				
   				 <a href="/Approval/agin?yddusr_0=${AU.yddusr_0 }">已审批</a>
   				 <a href="/Approval/three?yddusr_0=${AU.yddusr_0 }">未审批</a>
   				
   				</td>
   				
   			</tr>
   			
   			<tr>
   					<td>用户名:</td>
   					<td>${AU.usr_0 }</td>
   			</tr>
   			<tr>
   					<td>电话:</td>
   					<td>${AU.yddusr_0 }</td>
   			</tr>		
   			<tr>
   					<td>职位:</td>
   					<td>${AU.zptnum_0 }</td>
   					<td>${AU.zptnum_1 }</td>
   					<td>${AU.zptnum_2 }</td>
   					<td>${AU.zptnum_3 }</td>
   					<td>${AU.zptnum_4 }</td>
   					<td>${AU.zptnum_5 }</td>
   					<td>${AU.zptnum_7 }</td>
   					<td>${AU.zptnum_8 }</td>
   					<td>${AU.zptnum_9 }</td>
   				
   			</tr>
   			
   			
   		</table>
   		<br>
   	</c:forEach>	
  </body>
</html>

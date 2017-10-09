<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("utf-8"); 
	//String name =request.getParameter("name");%>
<%String nickname1=session.getAttribute("nickname1").toString();
	%> 

<!DOCTYPE  html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>log in success</title>
<style>

  body {text-align:center;
  background: #CBE967;}
  
</style>
</head>
<body>
<form action="index.jsp" method="post" enctype="application/x-www-form-urlencoded">
<p>留言成功！</p>
<input  type="hidden" name="name" value="<%=nickname1%>">&nbsp
<input  name="success" type="submit" value="返回">&nbsp
</form>
</body>
</html>
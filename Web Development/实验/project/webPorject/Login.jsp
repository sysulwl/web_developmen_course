<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	

<title>登录</title>
</head>
<body>
<form action="checkLog.jsp" method="post">
    昵称:
    <input name="nickname" type="text" value=""/>
    密码:
    <input name="password" type="password" value=""/>
 	 <!-- 记住密码 --> 
   <!--  <input id="saveCookie" type="checkbox" value="" />--> 
   <input id="submit" type="submit" value="登录" />
</form>
	如果您还没有注册，请单击<a href="register_form.jsp">这里</a>注册！ 
</body>
</html>
<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE  html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>exit success</title>
<style>

  body {text-align:center;}
  
</style>
</head>
<body>
<form action="index.jsp" method="post" enctype="application/x-www-form-urlencoded">
<p>退出成功！</p>
<input  name="success" type="submit" value="返回主界面">&nbsp
</form>
</body>
</html>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>getCookie</title>
</head>
<body>
  <h1>getCookie</h1>
	  	<%
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
	String name = cookie.getName();
	String value = cookie.getValue();
	out.write("<p>" + name + ":" + value);
	}
  	%>
</body>
</html>
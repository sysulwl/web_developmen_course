<%@ page language="java" pageEncoding="GB2312" import="java.util.*,java.io.*"
contentType="text/html;charset=GB2312"%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>Decoding</title>
</head>
<body>
  <h1>Decoding</h1>
  <% 
     String s = request.getParameter("username"); 
  	 byte[] bs = s.getBytes("iso-8859-1");
  	 String s2 = new String(bs,"GB2312");
  %>
  <%=s2%>
</body>
</html>
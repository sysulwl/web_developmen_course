<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GB2312" 
contentType="text/html;charset=GB2312"%>
<%
Cookie cookie0 = new Cookie("x0","/jsp/temp/");
cookie0.setMaxAge(120);// 设置保留时间 120秒。
// 设置为负值表示只保存在内存， 关闭浏览器则消失。
// 设置为0表示要删除该cookie。
cookie0.setPath("/jsp_4/temp/"); //设置路径为根目录
response.addCookie(cookie0);
%>
<%
Cookie cookie1 = new Cookie("x1","/jsp/temp/2015/");
cookie1.setMaxAge(120);// 设置保留时间 120秒。
cookie1.setPath("/jsp_4/temp/2015/"); //设置路径为根目录
response.addCookie(cookie1);
%>
<%
Cookie cookie2 = new Cookie("x2","/jsp/temp/2016/");
cookie2.setMaxAge(120);// 设置保留时间 120秒。
cookie2.setPath("/jsp_4/temp/2016/"); //设置路径为根目录
response.addCookie(cookie2);
%><%
Cookie cookie3 = new Cookie("x3","/jsp/temp/2016/main/");
cookie3.setMaxAge(120);// 设置保留时间 120秒。
cookie3.setPath("/jsp_4/temp/2016/main/"); //设置路径为根目录
response.addCookie(cookie3);
%><%
Cookie cookie4 = new Cookie("x4","/jsp/temp/2016/other/");
cookie4.setMaxAge(120);// 设置保留时间 120秒。
cookie4.setPath("/jsp_4/temp/2016/other/"); //设置路径为根目录
response.addCookie(cookie4);
%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<title>setCookie</title>
</head>
<body>
  <h1>setCookie</h1>
	
</body>
</html>
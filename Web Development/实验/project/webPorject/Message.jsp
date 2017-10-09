<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); 
	//String name =request.getParameter("name");%>
<%	String name=request.getParameter("name");	
	%> 
<% 
	
	String msg = "";
	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8&useSSL=false";
	
	String content1=request.getParameter("content");
	if (name == null){name = "null";}
	if(request.getMethod().equalsIgnoreCase("post")){
	try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection(connectStr, "user", "123");
			Statement stmt = connect.createStatement();
			
			String fmt ="insert into message(nickname,message) values('%s','%s')";
			String sql = String.format(fmt,name,content1);
			int cnt = stmt.executeUpdate(sql);//执行sql语句
			if(cnt > 0){
				response.sendRedirect("sendSuccess.jsp"); 
            	return;}
			stmt.close();
			response.sendRedirect("loginSuccess.jsp"); 
			connect.close();
		}catch(Exception e){
			msg = e.getMessage();
			response.sendRedirect("loginFailed.jsp"); ;
		}}
%>
<html>
<head></head>
<body></body>
</html>

<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8&useSSL=false";
	
	String nickname1=request.getParameter("nickname");
	String password1=request.getParameter("password");
	
    try 
    {  
        // 加载数据库驱动，注册到驱动管理器  
        Class.forName("com.mysql.jdbc.Driver");  
        
        // 数据库用户名  
        String usename = "user";  
        // 数据库密码  
        String psw = "123";  
        // 创建Connection连接  
        Connection connect = DriverManager.getConnection(connectStr,usename,psw);  
        
        
       if(connect != null) {
        	String sql = "select * from user where nickname = '"+ nickname1 +"';";
        	Statement stmt = connect.createStatement();
        	ResultSet rs = stmt.executeQuery(sql);
        	if(rs.next()) { 
        		String password=rs.getString("password");  
                if(password.equals(password1))
                {
                	session.setAttribute("nickname1",nickname1); 
                	response.sendRedirect("loginSuccess.jsp"); 
                	return;}
            }
        		else{  
        			response.sendRedirect("loginFailed.jsp");
        			return;
                	}             
            	// 输出连接信息  
            	//out.println("数据库连接成功！"); 
            	response.sendRedirect("loginFailed.jsp"); 
            	// 关闭数据库连接  
            	connect.close(); 
            	return;}
    		else{  
            	// 输出连接信息  
            	out.println("数据库连接失败！");                          
        	} 
   	 } 
    catch (Exception e) {  
        e.printStackTrace();  }  	
 %>
 
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
    记住密码
    <input id="saveCookie" type="checkbox" value="" />
    <input id="submit" type="button" value="登录" />
</form>
	如果您还没有注册，请单击<a href="register_form.jsp">这里</a>注册！ 
</body>
</html>

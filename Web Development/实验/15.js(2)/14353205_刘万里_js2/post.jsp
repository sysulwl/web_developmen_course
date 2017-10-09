<%@ page language="java" import="java.util.*,java.io.*,java.sql.*,java.awt.List" 
         contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>  
    
<%!
Connection conn;
//数据库的连接操作
boolean connect() {
	String connectString = "jdbc:mysql://172.18.187.233:3306/teaching"
			+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&&useSSL=false";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(connectString, "user", "123");
		return true;
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
	return false;
}
String econ=new String();
ResultSet executeUpdate(String sqlSentence) {
    Statement stat;
    ResultSet rs = null;      
    try {
	stat =(Statement) conn.createStatement();       //获取执行sql语句的对象
	int count = stat.executeUpdate(sqlSentence);
	System.out.println(count+"条记录被修改\n");
	if(count!=0)econ="修改成功!";
	else 	econ="修改失败!";
    } catch (Exception e) {
	System.out.println(e.getMessage());
	econ="修改失败!";
	System.out.println("0条记录被修改\n");
    }
    return rs;
}
%> 
<%
	 String ID=request.getParameter("t1");
	 String NAME=request.getParameter("t2");
     if(connect()){
    	 econ="修改失败!";
         String m=new String();
         m="update stu set name='"+NAME+"' where id='"+ID+"';";
         System.out.println(m);
         ResultSet rs = executeUpdate(m);
         }
 %>
 
 <%=econ%>
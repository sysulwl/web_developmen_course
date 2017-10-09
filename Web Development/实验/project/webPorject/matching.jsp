
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*" %>
<%! Random rand =new Random(25); %>
<%
	request.setCharacterEncoding("utf-8");
	StringBuilder result = new StringBuilder("");
	String nickname = "";
	nickname = request.getParameter("name");
	int i;
	
	//建立mysql连接，并从mysql中读取数据
	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8&useSSL=false";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection(connectStr, "user", "123");
		Statement stmt = connect.createStatement();
		Integer num=0;
		
		ResultSet rs = stmt.executeQuery("select * from user");	
		while(rs.next()){
			//result.append("现居住地	：" + rs.getString("liveplace") + "<br>");
			//result.append("身高：" + rs.getInt("stature") + "<br>");
			//result.append("出生年月：" + rs.getString("birth") + "<br>");
			num=num+1;
		}
		rs.beforeFirst();
		i=rand.nextInt(num);
		for(int j=0;j<i;j++){
			rs.next();
		}
		result.append("用户名	：" + rs.getString("nickname") + "<br>");
		result.append("现居住地	：" + rs.getString("liveplace") + "<br>");
		result.append("身高：" + rs.getInt("stature") + "<br>");
		result.append("出生年月：" + rs.getString("birth") + "<br>");
		rs.close();
		stmt.close();
		connect.close();
	}catch(Exception e){
		e.printStackTrace();
	}	
%>


   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>缘分配对</title>
<style>
	
	.container{
		margin:0 auto;
		width:500px;
		text-align:center}
	a:link, a:visited{color:blue;}
</style>
</head>
<body>
	<div class="container">
	  <h1 >缘分配对</h1>  
	  <%=result%>
 	</div>
 	<form action="index.jsp?name=<%=nickname %>" method="post" enctype="application/x-www-form-urlencoded">
	<input  name="success" type="submit" value="返回">
</form>
</body>
</html>
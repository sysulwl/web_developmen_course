
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*" %>
 
<%
	String name = request.getParameter("name");
	request.setCharacterEncoding("utf-8");
	StringBuilder result = new StringBuilder("");

	//建立mysql连接，并从mysql中读取数据
	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8&useSSL=false";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection(connectStr, "user", "123");
		Statement stmt = connect.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from user;");	
		while(rs.next()){
			result.append("<div><a href=\"lookpeople.jsp?ID="+rs.getInt("id")+"\">");
			String img = null;
			if(rs.getString("avatar") != null) img = rs.getString("avatar");
			else img = "SYSU.png";
			result.append("<img src = \".\\file\\" + img + "\"><br>");
			result.append("<p>现居住地	：" + rs.getString("liveplace") + "</p><br>");
			result.append("<p>身高：" + rs.getInt("stature") + "</p><br>");
			result.append("<p>出生年月：" + rs.getString("birth") + "</p><br><br><br><br>");
			result.append("</a></div>");

		}
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
<title>查询资料</title>
<style>
		body {
            background: #CBE967;
        }
	.container{
		margin:0 auto;
		width:500px;
		text-align:center}
		.content{
		margin:0 auto;
		width:500px;
		text-align:left
		}
		p{
          border: solid blue 1px;            
          margin:0000;
          padding:5px 5px 5px 5px 
  }
	a:link, a:visited{color:blue;}
</style>
</head>
<body>
	<div class="container">
	  <h1 >查询资料啦！！！</h1>  
	  <%=result%>
	  <a href=index.jsp?name=<%=name %>>返回主界面</a>
 	</div>
</body>
</html>
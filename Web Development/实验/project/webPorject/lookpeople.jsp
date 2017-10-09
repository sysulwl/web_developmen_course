
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*" %>
 
<%
	request.setCharacterEncoding("utf-8");
	StringBuilder result = new StringBuilder("");
	String realname = null;
	//建立mysql连接，并从mysql中读取数据
	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8&useSSL=false";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection(connectStr, "user", "123");
		Statement stmt = connect.createStatement();
		String id = request.getParameter("ID");	
		ResultSet rs = stmt.executeQuery("select * from user where id='"+id+"';");		
		

		while(rs.next()){
			realname=rs.getString("realname");
			String img = null;
			if(rs.getString("avatar") != null) img = rs.getString("avatar");
			else img = "SYSU.png";
			result.append("<img src = \".\\file\\" + img + "\"><br>");
			result.append("<p>姓名:" + rs.getString("realname") + "</p><br>");			
			result.append("<p>性别:" + rs.getString("sex") + "</p><br>");
			result.append("<p>籍贯	：" + rs.getString("origo") + "</p><br>");
			result.append("<p>现居住地	：" + rs.getString("liveplace") + "</p><br>");
			result.append("<p>职业：" + rs.getString("profession") + "</p><br>");
			result.append("<p>身高：" + rs.getInt("stature") + "</p><br>");
			result.append("<p>月收入：" + rs.getDouble("income") + "K</p><br>");
			result.append("<p>出生年月：" + rs.getString("birth") + "</p><br>");
			result.append("<p>爱好：" + rs.getString("hobby") + "</p><br>");
			result.append("<p>我的爱情宣言: " + rs.getString("declaration") + "</p><br>");
			result.append("<p>心目中的TA:" + rs.getString("ideal") + "</p><br>");
			result.append("<p>其他: " + rs.getString("etc") + "</p><br><br><br>");
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
  img{margin:0px auto;}
	a:link, a:visited{color:blue;}
</style>
</head>
<body>
	<div class="container">
	  <h1 ><%= realname %>的详细信息！</h1>  
	  <div class="content">
	  <%=result%>
	  </div>
	 <a href=showOppositeSex.jsp>返回</a>
	 &nbsp<a href=index.jsp>返回主界面</a>	  
 	</div>
</body>
</html>
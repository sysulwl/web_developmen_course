<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<%
	request.setCharacterEncoding("utf-8");
 	String msg = "";
 	String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
			+ "?autoReconnect=true&useUnicode=true"
			+ "&characterEncoding=UTF-8&useSSL=false";
 	//获取用户输入的内容	
 	String ID = request.getParameter("ID");
 	String password = request.getParameter("password");
 	String name = request.getParameter("name");
	String identityNumber = request.getParameter("identityNumber");
	String nativePlace = request.getParameter("nativePlace");
	String livingPlace = request.getParameter("livingPlace");
	String occupation  = request.getParameter("occupation");
	String height2 = request.getParameter("height");
	int height = 0,income = 0,balance = 0;
	String income2 = request.getParameter("income");
	
	
	String birthday = request.getParameter("birthday");
	String balance2 = request.getParameter("balance");
	if(height2 != null) {
		height = Integer.parseInt(height2);
		income = Integer.parseInt(income2);
		balance = Integer.parseInt(balance2);
	}
	String hobby = request.getParameter("hobby");
	String loveDeclaration = request.getParameter("loveDeclaration");
	String optimal = request.getParameter("optimal");
	String explain = request.getParameter("explain");
	String sex= request.getParameter("sex");	
 	
 	if(request.getMethod().equalsIgnoreCase("post")){
 		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection(connectStr, "user", "123");
			Statement stmt = connect.createStatement();
			
			String fmt = "insert into user(nickname,password,realname,IDnumber,sex,origo,liveplace,profession,stature,income,birth,balance,hobby,declaration,ideal,etc) values('%s','%s','%s','%s','%s', '%s', '%s', '%s', '%d', '%d', '%s', '%d', '%s', '%s', '%s', '%s')";//设置sql语句
			String sql = String.format(fmt, ID,password,name,identityNumber,
					sex,nativePlace,livingPlace,occupation,height,income,birthday,
					balance,hobby,loveDeclaration,optimal,explain);
			int cnt = stmt.executeUpdate(sql);//执行sql语句
			if(cnt > 0){
				msg = "保存成功";
				Cookie cookie = new Cookie("userName", ID);
				cookie.setMaxAge(60000);
				cookie.setPath("/"); //设置路径为根目录
				response.addCookie(cookie);
			} 
			stmt.close();
			connect.close();
		}catch(Exception e){
			msg = e.getMessage();;
		}
 	}
 %>
<!DOCTYPE  html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<title>register success</title>
<style>

  body {text-align:center;
  background: #CBE967;}
  
</style>
</head>
<body>
<form action="index.jsp" method="post" enctype="application/x-www-form-urlencoded">
<p>注册成功！</p>
<input  type="hidden" name="name" value="<%=ID%>">&nbsp
<input  name="success" type="submit" value="返回">
</form>
</body>
</html>
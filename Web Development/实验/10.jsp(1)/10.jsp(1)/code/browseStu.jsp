<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%><%
	request.setCharacterEncoding("utf-8");
	String msg ="";
	String connectString = "jdbc:mysql://172.18.187.230:3306/teaching12"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8"; 
        StringBuilder table=new StringBuilder("");
	try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection(connectString, 
	                 "user", "123");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from stu");
	  table.append("<table><tr><th>id</th><th>ѧ��</th><th>����</th><th>����</th>");
	  while(rs.next()) {
             table.append(String.format(
                 "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s %s</td></tr>",
                 rs.getString("id"),rs.getString("num"),rs.getString("name"),
                 "<a href='updateStu.jsp?pid="+rs.getString("id")+"'>�޸�</a>",
                 "<a href='deleteStu.jsp?pid="+rs.getString("id")+"'>ɾ��</a>"
                 )
              );
	  }
	  table.append("</table>");
	  rs.close();
	  stmt.close();
	  con.close();
	}
	catch (Exception e){
	  msg = e.getMessage();
	}
%><!DOCTYPE HTML>
<html>
   <style>
       table{border-collapse: collapse;
	         border: none;
			 width: 500px;}
	   td,th{border: solid grey 1px; 
			 padding: 5px 5px 5px 5px}
	   .container{ margin:0 auto; 
	         width:500px; 
			 text-align:center; }</style>
<head>
<title>���ѧ������</title>
</head>
<body>
  <div class="container">
	  <h1>���ѧ������</h1>  
	  <%=table%><br><br>  
  </div>
</body>
</html>
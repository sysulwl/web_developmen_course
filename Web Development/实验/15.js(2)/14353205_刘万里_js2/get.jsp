<%@ page  
import="java.sql.*,java.awt.List"
contentType="text/html; charset=utf-8"
 %>
<%!
Connection conn;
List data=new List();//储存id的list
List data1=new List();//储存学号的list
List data2=new List();//储存姓名的list
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

//执行sql语句
ResultSet executeQuery(String sqlSentence) {
    Statement stat;
    ResultSet rs = null;
       
    try {
	stat = conn.createStatement();       //获取执行sql语句的对象
	rs = stat.executeQuery(sqlSentence); //执行sql查询，返回结果集
    } catch (Exception e) {
	System.out.println(e.getMessage());
    }
    return rs;
}
int coun;
//储存查询记录的条数，将其放置进对应的list里
void showStudents(ResultSet rs){
    try {
       while(rs.next()){
    	   coun=coun+1;
          data.add(rs.getString("id").toString());
          data1.add(rs.getString("num").toString());
          data2.add(rs.getString("name").toString());
       }
    }
    catch (Exception e) {
	System.out.println(e.getMessage());
    }
}
%>
<%if(connect()){%>
	<%
	coun=0;
	String ss="select * from stu where id="+request.getParameter("id")+";";
	ResultSet rs = executeQuery(ss);
	showStudents(rs);
	%>
	<%if(coun==1){ %>
	<%="id:"+data.getItem(0)+"</br>"%>
	<%="num:"+data1.getItem(0)+"</br>"%>
	<%="name"+data2.getItem(0)+"</br>"%>
	<%}
	else{
	%>
	<%="null"%>
	<%
    }
	data.clear();
	data1.clear();
	data2.clear();
	%>
<%} %>

<%@ page language="java" import="java.util.*"
contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String submit1 = request.getParameter("submit1");
	String submit2 = request.getParameter("submit2");
	
	String user = request.getParameter("user");
	if(user==null) user="";
	String method = request.getMethod();
	boolean post = method.equalsIgnoreCase("post"); // method:GET 或 POST
	
	String name = request.getParameter("name");
	if(name==null) name="";
	
	String stuid = request.getParameter("stuid");
	if(stuid==null) stuid="";
	
	String password = request.getParameter("password");
	if(password==null) password="";
	
	String campus = request.getParameter("campus");
	if(campus==null) campus="";
	String campuss[]= {"","","","",""};
		if(campus.equals("north"))
			campuss[0] = "checked";
		else if(campus.equals("south"))
			campuss[1] = "checked";
		else if(campus.equals("east"))
			campuss[2] = "checked";
		else if(campus.equals("shenzhen"))
			campuss[3] = "checked";
		else if(campus.equals("zhuhai"))
			campuss[4] = "checked";
		
		/*------------年级--------------*/	
	String grade = request.getParameter("grade");
	if(grade==null) grade="";
	String grades[]= {"","","",""};
		if(grade.equals("freshman"))
			grades[0] = "selected";
		else if(grade.equals("sophomore"))
			grades[1] = "selected";
		else if(grade.equals("junior"))
			grades[2] = "selected";
		else if(grade.equals("senior"))
			grades[3] = "selected";
		
		/*------------社团--------------*/
		String[] values=null;
		if(request.getMethod().equalsIgnoreCase("post")){
		values = request.getParameterValues("club");
		}
		String clubs[]= {"","",""};
		for(int i = 0 ; i < values.length ; i++)
		{
			clubs[i] = "checked";
		}
		/*------------说明--------------*/
		String explain = request.getParameter("explain");
		if(explain==null) explain="";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>postAndKeep</title>
</head>
<body>
<form action="register3.jsp?user=<%=user%>" method="post">
<input type="hidden" name="stuid" value="<%=stuid%>" />
	  	名字: <input type="text" name="name" value="<%=name + "*"%>"/><br>
		密码：<input type="password" name="password" value="<%=password%>" /><br>
		
		校区:
			北校区<input type="radio" name="campus" value="north" <%=campuss[0]%>/>
			南校区<input type="radio" name="campus" value="south" <%=campuss[1]%>/>
			东校区<input type="radio" name="campus" value="west" <%=campuss[2]%>/>
			深圳校区<input type="radio" name="campus" value="shenzhen" <%=campuss[3]%>/>
			珠海校区<input type="radio" name="campus" value="zhuhai" <%=campuss[4]%>/>
			<br>
			
		年级：<select name="grade">
				<option value="freshman" <%=grades[0]%>>大一</option>
				<option value="sophomore" <%=grades[1]%>>大二</option>
				<option value="junior" <%=grades[2]%>>大三</option>
				<option value="senior" <%=grades[3]%>>大四</option>
			  </select>	<br>  
		社团 :   舞蹈队<input type="checkbox" name="club" value="dance" <%=clubs[0]%>/>
               	摄影<input type="checkbox" name="club" value="photo"<%=clubs[1]%>/>
               	篮球<input type="checkbox" name="club" value="basketball"<%=clubs[2]%>/><br>
        <table>
				<tr>
					<td valign="top">说明: &nbsp;&nbsp;&nbsp;</td>
					<td><textarea rows="5" cols="30" name="explain" ><%=explain + "*"%></textarea></td>
				</tr>
		</table>
		<br>		
		<input type="submit" name="submit1" value="save" />
		<input type="submit" name="submit2" value="exit" />
</form>
</body>
</html>

<%@ page language="java" import="java.util.*,java.io.*"
contentType="text/html;charset=utf-8"%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<style>
table{border-collapse: collapse;
	         border: none;
			 width: 500px;}
	   td,th{border: solid grey 1px; 
			 padding: 5px 5px 5px 5px}
</style>
<head>
<meta charset="utf-8">
<title>斐波那契数列</title>
</head>
<body>
  <h1>斐波那契数列</h1>
  <table>
  <%
    int f[] = new int[50];
	f[0] = 0;
	f[1] = 1;
	int i;
	for(i = 2 ; i < 40 ; i++)
	{
		f[i] = f[i-1]+f[i-2];
	}
    int row, line;
	%>
	<%for(row = 0; row < 4; row++){%>
		<tr>
		<%for(line = 0 ; line < 10; line++){%>
			<td>
			<%
			  out.print(f[row*10+line]);
			%>
			</td>
		<%}%>
		</tr>
	<%}%>
  </table>
</body>
</html>
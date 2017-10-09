<%@ page language="java" import="java.util.*,java.io.*,java.util.Random"
contentType="text/html;charset=utf-8"%>
<!DOCTYPE  html>
<html  lang="zh-cn">
<head>
<meta charset="utf-8">
<title>This is my title</title>
</head>
<body>
  <h1>This is header</h1>
  <p>This is the first paragraph</p>
  <p>This is the second paragraph</p>
  <% 
	Random rnd= new Random(50);
	for(int i = 0 ; i < 40 ; i++)
	{
		
		int n= rnd.nextInt(1000);
		out.print(n);
	}
	out.print("excuse me !\n"); 
  %>
</body>
</html>
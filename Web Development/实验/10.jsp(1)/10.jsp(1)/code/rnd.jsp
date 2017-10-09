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

环境准备：自己安装tomcat，要在环境变量path中设置好java路径，并把要用到的jar包(例如：mysql-connector-java-5.1.39-bin.jar)拷贝到tomcat的虚拟目录的WEB-INF\lib目录中。
采用Eclipse运行JSP程序。
【预备知识】
（1）只能在声明“<%!   %>”中定义Java的class和function，声明中out.print()无效。
（2）在脚本“<% %>”中可以编写Java程序，但是不能包含Java的class和function，可以用out.print或者<%=exp%>输出内容到网页。
（3）所需import的类必须写在<%@ page import="java.util.*,java.io.*" ... %>中，用逗号隔开。其中，contentType="text/html;charset=utf-8"指明本jsp程序产生html文件并使用"utf-8"字符集进行响应。
1、(rnd.jsp) 用网页显示40个随机数（0~999）。
提示： 随机数产生方法（java程序）
             
 import  java.util.Random;
 Random rnd= new Random(50);  // 局部变量rnd初始化50为种子
int n= rnd.nextInt(1000);    // 返回0~999之间的随机数
完整jsp代码如下：
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
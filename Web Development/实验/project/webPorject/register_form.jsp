<%@page import="java.util.*,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
	body {

            background: #CBE967;
        }
   *{font-size:20px;font-family:宋体}
   input[type="text"],textarea {color:#B0B0B0}
   [for="content"]{vertical-align:top;}
   fieldset {width:800px;margin:20px auto;padding:20px;background-color:#FCFCFF;}
   #content {width:700px;height:300px}
	
	a:link, a:visited{color:blue;}
	.container{
		margin:0 auto;
		width:500px;
		text-align:center;
	}
</style>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<fieldset>
	<title>用户注册</title>
	</head>
	<body>
		<em>请如实填下一下信息，展现自己真实的一面给未来的TA</em>
		<form action="register_success.jsp" method="post">
		用户ID：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="ID" /><br>
		密码：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" name="password" /><br>
		真实姓名: &nbsp&nbsp&nbsp&nbsp<input type="text" name="name" value="张三"/><br>	
		身份证号码: &nbsp&nbsp<input type="text" name="identityNumber" value="441302199001012222"/><br>
		性别：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<select name="sex">
				    <option value="man">男</option>
				    <option value="women">女</option>
			  </select>	<br>   
		籍贯	：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="nativePlace" value="广东"/><br>
		现居住地	：&nbsp&nbsp&nbsp<input type="text" name="livingPlace" value="广州"/><br>
		职业：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="occupation" value="程序猿"/><br>
		身高：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="height" value="180"/><br>
		月收入：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="income" value="10"/>K<br>
		出生年月：&nbsp&nbsp&nbsp&nbsp<input type="text" name="birthday" value="1990-01"/><br>
		用户余额：&nbsp&nbsp&nbsp&nbsp<input type="text" name="balance" value="0"/><br>
		爱好：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="hobby" value="砸电脑"/><br>
		<table>
				<tr>
					<td valign="top">我的爱情宣言: &nbsp;&nbsp;&nbsp;</td>
					<td><textarea rows="5" cols="30" name="loveDeclaration" >来一场说充钱就充钱的约会</textarea></td>
				</tr>
		</table>	
        <table>
				<tr>
					<td valign="top">心目中的TA: &nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp&nbsp<textarea rows="5" cols="30" name="optimal" >白富美 or 高富帅</textarea></td>
				</tr>
		</table>	
        <table>
				<tr>
					<td valign="top">其他: &nbsp;&nbsp;&nbsp;</td>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<textarea rows="5" cols="30" name="explain" >我学过Web程序设计！</textarea></td>
				</tr>
		</table>
        <input type="submit" name="submit1" value="保存" />
		</form>
		<br/><br/>
	<a href = "index.jsp">返回</a>
	</fieldset>
	</body>
	
</html>


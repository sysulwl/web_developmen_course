<%@ page language="java" import="java.util.*"
contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head><title>postInput</title></head>
	<body>
		<form action="register3.jsp?user=wang" method="post">
		<input type="hidden" name="stuid" value="1400001" />
		同学名: <input type="text" name="name" value="张三"/><br><br>
		密码：<input type="password" name="password" /><br>
		校区: 
			北校区<input type="radio" name="campus" value="north"/>
                               南校区<input type="radio" name="campus" value="south"/>
                                东校区<input type="radio" name="campus" value="east"/>
			深圳校区<input type="radio" name="campus" value="shenzhen"/>
                                珠海校区<input type="radio" name="campus" value="zhuhai"/><br>
		年级：<select name="grade">
				    <option value="freshman">大一</option>
				    <option value="sophomore">大二</option>
					<option value="junior">大三</option>
					<option value="senior">大四</option>
			  </select>	<br>   
        社团 :舞蹈队<input type="checkbox" name="club" value="dance"/>
               摄影<input type="checkbox" name="club" value="photo"/>
               篮球<input type="checkbox" name="club" value="basketball"/><br>
        <table>
				<tr>
					<td valign="top">说明: &nbsp;&nbsp;&nbsp;</td>
					<td><textarea rows="5" cols="30" name="explain" >我学过Web程序设计</textarea></td>
				</tr>
		</table>
        <input type="submit" name="submit1" value="保存" />
        <input type="submit" name="submit2" value="退出" /><br>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实现文件上传</title>
</head>
<body>
	<form name = "fileupload" action = "fileupload.jsp" 
		method = "post" enctype = "multipart/form-data">
		<p>id:&nbsp;<input type = "text" name = "id"> </p>
		<p>文件名:&nbsp;<input type= "file" name = "file" size = "40" value = "浏览..."></p>
		<input type = "submit" name = "submit" value = "ok">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="java.io.*, java.util.*,org.apache.commons.io.*"%>
<%
	String nickname = "";
	nickname = request.getParameter("name");
	String imageName = "";
	String path = "";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);//检查表单中是否包含文件
	if(isMultipart) {
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = upload.parseRequest(request);
		for (int i = 0; i < items.size(); i++) {
			FileItem fi = (FileItem) items.get(i);
			if (fi.isFormField()) {
				
			}
			else {
				DiskFileItem dfi = (DiskFileItem) fi;
				if (!dfi.getName().trim().equals("")) {
					//out.print("文件被上传到服务上的实际位置： ");
					imageName = nickname+"_"+FilenameUtils.getName(dfi.getName());
					String fileName=application.getRealPath("/file")
					+ System.getProperty("file.separator")+imageName;
					//out.print(new File(fileName).getAbsolutePath());
					dfi.write(new File(fileName));
					path = ".\\file\\"+imageName;
				}
			} //if
		} //for
		String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
				+ "?autoReconnect=true&useUnicode=true"
				+ "&characterEncoding=UTF-8&useSSL=false";
		try 
	    {  
	        // 加载数据库驱动，注册到驱动管理器  
	        Class.forName("com.mysql.jdbc.Driver");  
	        
	        // 数据库用户名  
	        String usename = "user";  
	        // 数据库密码  
	        String psw = "123";  
	        // 创建Connection连接  
	        Connection connect = DriverManager.getConnection(connectStr,usename,psw);  
	       
	       	
	        	String sql = "update user set avatar='"+imageName+"' where nickname='"+nickname+"';";
	        	Statement stmt = connect.createStatement();
	        	stmt.executeUpdate(sql);
	        	         
	        	stmt.close();
	        	connect.close();
		}
			catch (Exception e){
			}
	
			
		
	} //if
	  	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>上传头像</title>
		<script> 
			function PreviewImage(imgFile) { 
		   		var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
		    	if(!pattern.test(imgFile.value)){ 
		    		alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
		     		imgFile.focus(); 
		    	} 
		    	else { 
		     		var path; 
		     		if(document.all) {//IE 
						imgFile.select(); 
					    path = document.selection.createRange().text; 
					    document.getElementById("imgPreview").innerHTML=""; 
					    document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
		     		} 
		    		else {//FF 
				    	path = URL.createObjectURL(imgFile.files[0]);
				    	document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>"; 
		     		} 
		    	} 
			}
		</script> 
		<style>
			#imgPreview{
				margin:0px auto;
				width: 500px;
				height:500px;
				overflow:hidden;
			}
			img{
				width:100%;
			}
		</style>
	</head>
	<body>
		<div id="imgPreview"> 
    		<img src="<%=path %>" alt="上传头像"/> 
   		</div> 
   		<form action="image.jsp?name=<%=nickname %>" method="post" enctype="multipart/form-data">
   			<input type="file" name="file" size=24 onchange='PreviewImage(this)'/> 
   			<input type="submit" name="submit1" value="保存" />
   		</form>
   		<a href = "index.jsp?name=<%=nickname %>">返回</a>
	</body>
</html>
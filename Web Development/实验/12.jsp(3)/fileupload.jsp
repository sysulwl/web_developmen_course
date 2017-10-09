<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%  request.setCharacterEncoding("utf-8"); %>
<% String imagePath = ""; //图片路径
   String imageName = "";//图片名字
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Insert title here</title>
</head>
<body>
	<%
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = upload.parseRequest(request);
			String Id = "";
			for (int i = 0; i < items.size(); i++){
				FileItem fi = (FileItem) items.get(i);
				if (fi.isFormField()){//获取到对应的id信息
					if (fi.getFieldName().equals("id")){
						Id = fi.getString("utf-8");
					}
				}else{
					DiskFileItem dfi = (DiskFileItem) fi;
					if (!dfi.getName().trim().equals("")){
						out.print("文件被上传到服务器上的实际位置:");
						String fileName = application.getRealPath("/file")
								+ System.getProperty("file.separator")+Id+"_"
								+FilenameUtils.getName(dfi.getName());
						imagePath = new File(fileName).getAbsolutePath();//获取图片路径
						imageName = Id + "_" + FilenameUtils.getName(dfi.getName());//获取图片名字
						out.print(imagePath);
						System.out.println(new File(fileName).getAbsolutePath());
						dfi.write(new File(fileName));
					}
				}
			}
		}
	%>
	<p><a href = "<%=imagePath%>"><%=imageName %></a></p>
</body>
</html>
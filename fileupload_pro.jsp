<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>과제업로드</title>
</head>
<body>
	<%
		String fileUploadPath = "C:\\upload";
	
		DiskFileUpload upload = new DiskFileUpload();
		
		List items = upload.parseRequest(request);
		
		Iterator params = items.iterator();
		
		while(params.hasNext()){
			FileItem fileItem = (FileItem) params.next();
			if(!fileItem.isFormField()){
				String fileName = fileItem.getName();
				fileName = fileName.substring(fileName.lastIndexOf("\\") +1);
				File file = new File(fileUploadPath + "/" + fileName);
				fileItem.write(file);
			}
		}
		
%>
<input type=button value="목록"  OnClick="window.location='main.jsp'">
</body>
</html>
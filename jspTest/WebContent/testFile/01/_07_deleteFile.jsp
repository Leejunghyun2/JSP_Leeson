<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>파일삭제</h2>
<%
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	File f = new File(uploadFile);
	if(f.delete()){
		out.println("파일 삭제 완료.." + f.getName());
	} else{
		out.println("파일 삭제 실패..");
	}
%>
</body>
</html>
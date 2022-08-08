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
	<h2>파일 정보</h2>
<%
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	File f = new File(uploadFile);
	if(f.exists()){
		String fileName = f.getName();
		String absPath = f.getAbsolutePath();
		long fileSize = f.length();
		
		out.println("파일명 : " + fileName + "<br>");
		out.println("절대경로 : " + absPath + "<br>");
		out.println("파일용량 : " + fileSize + "<br>");
	} else{
		out.println("파일 존재 안함..");
	}
%>
	
</body>
</html>
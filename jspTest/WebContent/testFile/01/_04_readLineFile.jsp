<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 읽기</h2>

<%
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/sample.txt";
	
	try{
		File f = new File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()){
			String date = sReader.nextLine() + "<br>";
			out.println(date);
		}
		sReader.close();
	}catch (Exception e){
		//e.printStackTrace();

	}
%>
</body>
</html>
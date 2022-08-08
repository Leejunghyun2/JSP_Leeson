<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일에 쓰기</h2>

<%
	
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	String content = ""; //파일안에 내용이 많으면 객체 생성해서 해도 됨.
	content += "홍길동,90,80,70,60,50\n";
	content += "이성순,99,88,77,66,55\n";
	
	
	try{
		// FileWriter fw = new FileWriter(uploadFile); --write 덮어쓰기
		FileWriter fw = new FileWriter(uploadFile,true); //append 추가 <추가할때는 기존 글 뒤에 추가>
		fw.write(content); // \n 줄바꿈
		fw.close();
		System.out.println("저장성공");
	}catch (Exception e){
		//e.printStackTrace();
		System.out.println("저장실패");
	}
%>
</body>
</html>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("fileName");
String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
String uploadPath = attachPath + "/testFile";
String uploadFile = uploadPath + "/"+a;

File f = new File(uploadFile);
if(f.delete()){
	response.sendRedirect("_08_directoryList.jsp");
} else{
	out.println("파일 삭제 실패..");
}
		
%>
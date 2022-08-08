<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw2 = request.getParameter("pw2");
	String name = request.getParameter("name");
	String phone = request.getParameter("tel");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String msg = id+","+pw+","+pw2+","+name+","+phone+","+email+","+address+"\n";
	
	String attachPath = "C:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile"+ request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	try{
		FileWriter fw = new FileWriter(uploadFile,true);
		fw.write(msg);
		fw.close();
		out.print("<script>");
		out.print("alert('파일추가완료');");
		out.print("location.href = 'list.jsp';");
		out.print("</script>");
	} catch(Exception e){
		
	}
%>
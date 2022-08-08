<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String tmp = name + "," + email + "," + subject + "," + content + "\n";
	
	String attachPath = "C:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile"+ request.getContextPath();
	String uploadFile = uploadPath + "/sample.txt";
	File isDir = new File(uploadPath);
	File f = new File(uploadFile);
	
	if (!isDir.exists()) {
		try {
			isDir.mkdirs();
			System.out.println("디렉토리 생성 성공");
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("디렉토리 생성 실패");
			response.sendRedirect("write.jsp");
		}
	}
	if (!f.exists()) {
		try {
			f.createNewFile();
			System.out.println("파일생성완료");
		} catch (Exception e) {
			System.out.println("파일생성실패");
			response.sendRedirect("write.jsp");
		}
	}
	try {
		FileWriter writer = new FileWriter(uploadFile, true);
		writer.write(tmp);
		writer.close();
		System.out.println("저장완료");
		response.sendRedirect("write.jsp");
	} catch (Exception e) {
		System.out.println("저장실패");
		response.sendRedirect("write.jsp");
	
	}
%>
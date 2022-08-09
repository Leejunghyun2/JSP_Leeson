<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="config.Constants"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String attachPath = Constants.ATTACH_PATH;
	String uploadPath = attachPath + request.getContextPath()+"/testUpload";
	int maxUpload = Constants.MAX_UPLOAD;
	String file1 = "";
	String file2 = "";
	String filename1 = "";
	String filename2 = "";
	int fileSize1 = 0;
	int fileSize2 = 0;
	
	
	
	String name = ""; 
	String subject = "";
	try{
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadPath,
				maxUpload,
				"UTF-8",
				new DefaultFileRenamePolicy() // 파일이름 중복안되게 하는 매개변수
				);
		
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
									
		Enumeration files = multi.getFileNames();		 //파일들의 집합 순서가 없음									
		file1 = (String)files.nextElement();
		file2 = (String)files.nextElement();
		
		filename1 = multi.getFilesystemName(file1);
		java.io.File f1 = multi.getFile(file1);
		fileSize1 = (int)f1.length();
		
		filename2 = multi.getFilesystemName(file2);
		java.io.File f2 = multi.getFile(file2);
		fileSize2 = (int)f2.length();
		
		
		
		
		
 	
		
	}catch(Exception e){
		
	}

	
	
%>

이름 : <%=name%><br>
제목 : <%=subject%><br>

파일이름1 : <%=filename1%><br>
파일용량1 : <%=fileSize1%><br>

파일이름2 : <%=filename2%><br>
파일용량2 : <%=fileSize2%><br>

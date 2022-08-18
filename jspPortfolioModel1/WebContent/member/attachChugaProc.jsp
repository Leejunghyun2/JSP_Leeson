<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String attachPath = "/C:/LJH/attach";
	String uploadPath = attachPath + request.getContextPath()+"/member";
	final int maxUpload = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	

	MultipartRequest multi = new MultipartRequest(
		request,
		uploadPath,
		maxUpload,
		encoding,
		new DefaultFileRenamePolicy()
	); 
	
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String passwdChk = multi.getParameter("passwdChk");
	String name = multi.getParameter("name");
	String phone = multi.getParameter("phone");
	String email = multi.getParameter("email");
	String jumin1 = multi.getParameter("jumin1");
	String jumin2 = multi.getParameter("jumin2");
	String juso1 = multi.getParameter("juso1");
	String juso2 = multi.getParameter("juso2");
	String juso3 = multi.getParameter("juso3");
	String juso4 = multi.getParameter("juso4");
	String grade = multi.getParameter("grade");
	
	
	if(juso4 == null || juso4.trim().equals("")){
		juso4 = "-";
	}
	
	String attachInfo = "";
	try{
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()){
			String tagName = "";
			String fileOriginalName = ""; //파일의 원래이름
			String fileSavedName = "";	//탐색기에 올라가있는이름 
			String fileType = "";
			String fileSize ="";
			String fileExtName =""; //확장자
			
			tagName = (String)files.nextElement(); //html에서 작성한 파일의 이름
			
			//out.println("tagName :" + tagName);
			
			File fileObj = multi.getFile(tagName); //파일이 있나 없나 확인
			
			//out.println("fileObj :" + fileObj);
			
			if(fileObj != null){ 
				fileOriginalName = multi.getOriginalFileName(tagName);
				fileSavedName = multi.getFilesystemName(tagName);
				fileType =multi.getContentType(tagName);
				fileSize = St
			}
				out.println(fileOriginalName);
				out.println(fileSavedName);
			
		}
	}catch(Exception e){
		//e.printStackTrace();
	}
	
	
%>
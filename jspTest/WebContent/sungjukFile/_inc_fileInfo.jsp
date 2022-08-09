<%@page import="java.io.*"%>
<%@page import="java.util.Scanner"%>
<%@page import="config.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String attachPath = Constants.ATTACH_PATH;
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/sungjuk.txt";
	File isDir = new File(uploadPath);
	File f = new File(uploadFile);
	
	if(!isDir.exists()){
		try{
			isDir.mkdirs();
			System.out.println("== 폴더생성완료 ==");
		}catch(Exception e){
			//e.printStackTrace();
		}
	}
	if(!f.exists()){
			f.createNewFile();
			System.out.println("== 파일생성완료 ==");
	}
	

	
%>
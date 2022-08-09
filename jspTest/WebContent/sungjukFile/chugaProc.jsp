<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_fileInfo.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String scie_ = request.getParameter("scie");
	String his_ = request.getParameter("his");
	
	String msg = name + "," + kor_ + "," + eng_ + "," + mat_ + "," + scie_ + "," + his_ + "\n";
	int result =0;
	try{
		FileWriter fw = new FileWriter(uploadFile,true);
		fw.write(msg);
		fw.close();
		result++;
	}catch(Exception e){
		result=0;
	}
	if(result > 0){
		out.println("<script>");
		out.println("alert('추가성공');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	} else{
		out.println("<script>");
		out.println("alert('등록 중 오류 발생');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>
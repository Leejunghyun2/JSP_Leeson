<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
	

	String dbId = "kim";
	String dbPw = "0987";
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	if(dbId.equals(id) && dbPw.equals(pw)){
		out.print("로그인성공");
	} else{
		out.print("로그인실패");
	}
%>
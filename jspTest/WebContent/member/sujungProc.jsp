<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("UTF-8");
	
	String pw = request.getParameter("pw");
	String phone = request.getParameter("tel");
	String email = request.getParameter("email");
	String addr = request.getParameter("address");
 	
	out.print(pw+phone+email+addr);
	response.sendRedirect("view.jsp");//jsp로 바로 넘길때
%>
    
    
    
    
    
    
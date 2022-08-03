<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("UTF-8");
	
	String pw = request.getParameter("pw");
 	
	out.print(pw);
	response.sendRedirect("list.jsp");//jsp로 바로 넘길때
%>
    
    
    
    
    
    
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String author = request.getParameter("author");
	
	
	BookAuthorDTO dto = new BookAuthorDTO();
	dto.setAuthor(author);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	int result = dao.setInsert(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('추가처리중 오류가 발생 하였습니다.');");
		out.println("location.href = 'chuga.jsp';");
		out.println("</script>");
	}
	
	
%>
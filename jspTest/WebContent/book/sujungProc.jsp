<%@page import="java.sql.Date"%>
<%@page import="book.model.dto.BookDTO"%>
<%@page import="book.model.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String subject = request.getParameter("subject");
	String author = request.getParameter("author");
	Date created = Date.valueOf(request.getParameter("created"));
	String profile = request.getParameter("profile");
	
	BookDTO dto = new BookDTO();
	dto.setNo(no);
	dto.setSubject(subject);
	dto.setAuthor(author);
	dto.setCreated(created);
	dto.setProfile(profile);
	
	BookDAO dao = new BookDAO();
	int result = dao.setUpdate(dto); 
	 
	if(result > 0){
		out.println("<script>");
		out.println("alert('수정이 완료 되었습니다.')");
		out.println("location.href = 'view.jsp?no="+no+"';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리중 오류가 발생했습니다.');");
		out.println("location.href = 'sujung.jsp?no="+no+"';");
		out.println("</script>");
	}
%>
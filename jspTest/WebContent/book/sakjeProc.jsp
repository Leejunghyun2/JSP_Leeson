<%@page import="java.sql.Date"%>
<%@page import="book.model.dto.BookDTO"%>
<%@page import="book.model.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	

	BookDTO dto = new BookDTO();
	dto.setNo(no);

	
	BookDAO dao = new BookDAO();
	int result = dao.setDelete(dto);
	 
	if(result > 0){
		out.println("<script>");
		out.println("alert('삭제가 완료 되었습니다.')");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 처리중 오류가 발생했습니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
%>
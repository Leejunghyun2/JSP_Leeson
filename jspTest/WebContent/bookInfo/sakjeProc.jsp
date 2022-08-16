<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String infoNo_ = request.getParameter("infoNo");
	
	int infoNo = Integer.parseInt(infoNo_);
	
	
	BookInfoDTO dto = new BookInfoDTO();
	dto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setDelete(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('삭제처리중 오류가 발생 하였습니다.');");
		out.println("location.href = 'sakje.jsp?infoNo="+infoNo+"';");
		out.println("</script>");
	}
	
	
%>
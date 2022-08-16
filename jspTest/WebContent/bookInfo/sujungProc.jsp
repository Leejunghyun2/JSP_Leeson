<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String InfoNo_ = request.getParameter("infoNo");
	String subject = request.getParameter("subject");
	String authorNo_ = request.getParameter("authorNo");
	String profileNo_ = request.getParameter("profileNo");
	
	int infoNo = Integer.parseInt(InfoNo_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	
	BookInfoDTO dto = new BookInfoDTO();
	dto.setInfoNo(infoNo);
	dto.setSubject(subject);
	dto.setAuthorNo(authorNo);
	dto.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setUpdate(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('추가처리중 오류가 발생 하였습니다.');");
		out.println("location.href = 'sujung.jsp?infoNo="+infoNo+"';");
		out.println("</script>");
	}
	
	
%>
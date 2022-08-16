<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String profileNo_ = request.getParameter("profileNo");
	
	int profileNo = Integer.parseInt(profileNo_);
	
	
	BookProfileDTO dto = new BookProfileDTO();
	dto.setProfileNo(profileNo);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setDelete(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('추가처리중 오류가 발생 하였습니다.');");
		out.println("location.href = 'sakje.jsp?authorNo="+profileNo+"';");
		out.println("</script>");
	}
	
	
%>
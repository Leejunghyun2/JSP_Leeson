<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String profile = request.getParameter("profile");
	BookProfileDTO dto = new BookProfileDTO();
	dto.setProfile(profile);
	
	BookProfileDAO dao = new BookProfileDAO();
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
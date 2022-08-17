<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String sihumName = request.getParameter("sihumName");
	Date sihumDate =  Date.valueOf(request.getParameter("sihumDate"));
	
	
	HaksaSihumDTO dto = new HaksaSihumDTO();
	dto.setSihumName(sihumName);
	dto.setSihumDate(sihumDate);
	HaksaSihumDAO dao = new HaksaSihumDAO();
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
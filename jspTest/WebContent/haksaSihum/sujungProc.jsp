<%@page import="java.sql.Date"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	String sihumName = request.getParameter("sihumName");
	Date sihumDate = Date.valueOf(request.getParameter("sihumDate"));
	
	
	
	HaksaSihumDTO dto = new HaksaSihumDTO();
	dto.setSihumNo(sihumNo);
	dto.setSihumName(sihumName);
	dto.setSihumDate(sihumDate);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	int result = dao.setUpdate(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('수정처리중 오류가 발생 하였습니다.');");
		out.println("location.href= 'sujung.jsp?sihumNo="+sihumNo+"';");
		out.println("</script>");
	}

%>
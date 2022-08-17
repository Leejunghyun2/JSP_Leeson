<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sungjukNo_ = request.getParameter("sungjukNo");
	
	int sungjukNo = Integer.parseInt(sungjukNo_);	


	
	HaksaSungjukDTO dto = new HaksaSungjukDTO();
	dto.setSungjukNo(sungjukNo);
	
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	int result = dao.setDelete(dto);  
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('삭제처리중 오류가 발생 하였습니다.');");
		System.out.println("location.href = 'sakje.jsp?sungjukNo="+sungjukNo+"';");
		out.println("</script>");
	}
	
%>
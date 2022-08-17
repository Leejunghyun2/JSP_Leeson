<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hakbun_ = request.getParameter("hakbun");
	
	int hakbun = Integer.parseInt(hakbun_);
	
	
	
	HaksaMemberDTO dto = new HaksaMemberDTO();
	dto.setHakbun(hakbun);
	
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setDelete(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('삭제처리중 오류가 발생 하였습니다.');");
		System.out.println("location.href= 'sakje.jsp?hakbun="+hakbun+"';");
		out.println("</script>");
	}

%>
<%@page import="member.model.memberDao.MemberDAO"%>
<%@page import="member.model.memberDto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getSelectOne(arguDto);
	
	if(dto.getId() == null || dto.getId().equals("")){
		out.println("<script>");
		out.println("alert('로그인실패');");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	} else{
		session.setAttribute("sessionName", dto.getId());
		session.setMaxInactiveInterval(60);
		out.println("<script>");
		out.println("alert('로그인성공');");
		out.println("location.href = 'main.jsp'");
		out.println("</script>");
	}
	
%>
<%@page import="member.model.dao.DAO"%>
<%@page import="member.model.dto.DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String job = request.getParameter("job");
	


	DTO arguDto = new DTO();
	arguDto.setId(id);
	arguDto.setPwd(pwd);
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setJob(job);
	
	DAO dao = new DAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('성공');");
		out.println("location.href = 'joinList.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생');");
		out.println("location.href = 'join.jsp'");
		out.println("</script>");
	}
	
	
%>
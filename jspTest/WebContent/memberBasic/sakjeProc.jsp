<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String passwd = request.getParameter("passwd");


	MemberBasicDTO dto = new MemberBasicDTO();
	dto.setNo(no);
	dto.setPasswd(passwd);

	MemberBasicDAO dao = new MemberBasicDAO();
	int result = dao.setDelete(dto); 
	if(result > 0){
		out.println("<script>");
		out.println("alert('삭제가 완료되었습니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	} else{
		out.println("<script>");
		out.println("alert('삭제에 실패하였습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
	
	
%>
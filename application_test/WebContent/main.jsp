<%@page import="member.model.memberDto.MemberDTO"%>
<%@page import="member.model.memberDao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("sessionName") != null){
		id = (String)session.getAttribute("sessionName");
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.getDateChk(dto);
		if(result >= 6){
			out.println("<script>");
			out.println("alert('비밀번호 변경일이 6개월지났습니다. \\n 비밀번호 변경후 이용해주세요.');");
			out.println("location.href = 'change.jsp'");
			out.println("</script>");
			return;
		}
	}
	if(id.equals("")){
		out.println("<script>");
		out.println("alert('로그인 후 이용해주세요');");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=id %>님 환영합니다. <a href="logout.jsp">[로그아웃]</a></h2> 
<h2>메인 페이지입니다.</h2>

</body>
</html>
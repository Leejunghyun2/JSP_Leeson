<%@page import="member.model.memberDao.MemberDAO"%>
<%@page import="member.model.memberDto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	
	if(passwd == null || passwd.equals("")){
		out.println("<script>");
		out.println("alert('비밀번호가 틀리거나 입력하지 않았습니다.');");
		out.println("location.href = 'change.jsp'");
		out.println("</script>");
		return;
	}
	if(passwdChk == null || passwdChk.equals("")){
		out.println("<script>");
		out.println("alert('비밀번호가 틀리거나 입력하지 않았습니다.');");
		out.println("location.href = 'change.jsp'");
		out.println("</script>");
		return;
	}
	if(!passwd.equals(passwdChk)){
		out.println("<script>");
		out.println("alert('비밀번호가 틀리거나 입력하지 않았습니다.');");
		out.println("location.href = 'change.jsp'");
		out.println("</script>");
		return;
	}
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setUpdate(dto);
	out.println(result);
	if(result > 0){
		dao.setDateUpdate(dto);
		out.println("<script>");
		out.println("alert('비밀번호변경완료.\\n 다시로그인해주세요');");
		out.println("location.href = 'login.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정처리중 오류가 발생하였습니다.');");
		out.println("location.href = 'change.jsp';");
		out.println("</script>");
	}
	
	
%>
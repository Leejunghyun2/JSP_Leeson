<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO returnDto = dao.getLogin(dto);
	//세션(Session) - 서버에 저장하여 보안이 더 강화.
	//쿠키(Cookie)
	if(returnDto.getNo() > 0){
		session.setAttribute("sessionNo", returnDto.getNo());//회원번호 회원번호만 저장하여 회원등급 같은게 변화되면 변화되게 하는 게 좋음
		session.setAttribute("sessionId", id);//회원아이디
		session.setAttribute("sessionName", returnDto.getName());//회원이름
		session.setAttribute("sessionGrade", returnDto.getGrade());//회원이름
		
		
		out.println("<script>");
		out.println("alert('로그인성공..');");
		out.println("location.href = 'main.jsp?menuGubun=dashBoard_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록된 정보가 없습니다.\\n 확인 후 다시 로그인 해주세요.');");
		out.println("location.href = 'main.jsp?menuGubun=noLogin_login';");
		out.println("</script>");
	}
%>
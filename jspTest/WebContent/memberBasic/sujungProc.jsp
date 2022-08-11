<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String passwd = request.getParameter("passwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	String juso1 = request.getParameter("juso1");
	String juso2 = request.getParameter("juso2");
	String juso3 = request.getParameter("juso3");
	String juso4 = request.getParameter("juso4");

	MemberBasicDTO dto = new MemberBasicDTO();
	dto.setNo(no);
	dto.setPasswd(passwd);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setJuso1(juso1);
	dto.setJuso2(juso2);
	dto.setJuso3(juso3);
	dto.setJuso4(juso4);
	
	MemberBasicDAO dao = new MemberBasicDAO();
	int result = dao.setUpdate(dto); 
	if(result > 0){
		out.println("<script>");
		out.println("alert('수정이 완료되었습니다.');");
		out.println("location.href = 'view.jsp?no="+dto.getNo()+"';");
		out.println("</script>");
	} else{
		out.println("<script>");
		out.println("alert('수정에 실패하였습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
	
	
%>
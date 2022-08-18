<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String passwd = request.getParameter("passwd");

	
	
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	dto.setPasswd(passwd);

	
	MemberDAO dao = new MemberDAO();
	int result = dao.setDelete(dto);   
	
	String tmpMsg = "삭제 중 오류가 발생했습니다.";
	String tmpUrl = "main.jsp?menuGubun=member_sakje&no="+no;
	
	if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=member_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('"+ tmpMsg +"')");
		out.println("location.href = '"+tmpUrl+"';");
		out.println("</script>");
	}
	
	
	
	
	
%>
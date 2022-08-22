<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 String content = request.getParameter("content");
 
 if(no_ == null || no_.equals("")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}
 
 int no = Integer.parseInt(no_);

 
 MemoDTO dto = new MemoDTO();
 dto.setNo(no);
 dto.setContent(content);
 MemoDAO dao = new MemoDAO();
 int result = dao.setUpdate(dto); 
 
 if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=memo_view&no="+no+"';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_sujung&no="+no+"';");
		out.println("</script>");
	}
	
%>
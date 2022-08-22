<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 if(no_ == null || no_.equals("")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}
 int no = Integer.parseInt(no_);

 
 MemoDTO dto = new MemoDTO();
 dto.setNo(no);
 
 MemoDAO dao = new MemoDAO();
 int result = dao.setDelete(dto); 
 
 if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_sakje&no="+no+"';");
		out.println("</script>");
	}
	
%>
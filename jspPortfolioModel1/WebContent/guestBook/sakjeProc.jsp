<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 String passwd = request.getParameter("passwd");
 
 if(no_ == null || no_.equals("")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}
 
 int no = Integer.parseInt(no_);

 
 GuestBookDTO dto = new GuestBookDTO();
 dto.setNo(no);
 dto.setPasswd(passwd);
 GuestBookDAO dao = new GuestBookDAO();
 if(!dto.getPasswd().equals(passwd)){
	 out.println("<script>");
		out.println("alert('입력한 비밀번호가 다릅니다.')");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_sakje&no="+no+"';");
		out.println("</script>");
		return;
 }
 int result = dao.setDelete(dto); 
 
 if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_sakje&no="+no+"';");
		out.println("</script>");
	}
	
%>
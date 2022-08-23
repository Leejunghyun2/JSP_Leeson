<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 String name = request.getParameter("name");
 String no_ = request.getParameter("no");
 String passwd = request.getParameter("passwd");
 String email = request.getParameter("email");
 String content = request.getParameter("content");
 
 
 
 
 if(no_ == null || no_.equals("")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}
 int no = Integer.parseInt(no_);

 
 GuestBookDTO dto = new GuestBookDTO();
 dto.setNo(no);
 dto.setName(name);
 dto.setEmail(email);
 dto.setPasswd(passwd);
 dto.setContent(content);
 GuestBookDAO dao = new GuestBookDAO();
 dto = dao.getSelectOne(dto);
 if(!dto.getPasswd().equals(passwd)){
	 out.println("<script>");
		out.println("alert('입력한 비밀번호가 다릅니다.')");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_sujung&no="+no+"';");
		out.println("</script>");
		return;
 }
 int result = dao.setUpdate(dto); 
 
 
 if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_view&no="+no+"';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_sujung&no="+no+"';");
		out.println("</script>");
	}
	
%>
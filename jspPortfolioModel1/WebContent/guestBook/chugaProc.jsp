<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="config.Util"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 request.setCharacterEncoding("UTF-8");
 
 String name = request.getParameter("name");	
 String passwd = request.getParameter("passwd");
 String email = request.getParameter("email");
 String content = request.getParameter("content");	
 
 
 Util util = new Util();
 name = util.getCheckString(name);
 content = util.getCheckString(content);
 
 
 GuestBookDTO dto = new GuestBookDTO();
 dto.setName(name);
 dto.setPasswd(passwd);
 dto.setEmail(email);
 dto.setContent(content);
 dto.setMemberNo(sessionNo);
 
 GuestBookDAO dao = new GuestBookDAO(); 
 int result = dao.setInsert(dto); 
 /*
 html entity
  &nbsp; 공백
  &lt;   <
  &gt;   >
  &amp;  &
  &quot; "
  &apos; '
 */
 if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=guestBook_chuga';");
		out.println("</script>");
	}
	
%>
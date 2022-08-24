<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="config.Util"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ include file="_inc_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 String passwd = request.getParameter("passwd");
 int no = Integer.parseInt(no_);
 
 Util util = new Util();
 
 
 BoardBasicDTO dto = new BoardBasicDTO();
 dto.setNo(no);
 dto.setPasswd(passwd);
 
 BoardBasicDAO dao = new BoardBasicDAO(); 
 int result = dao.setDelete(dto); 
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
		out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=boardBasic_sakje&no="+no+"';");
		out.println("</script>");
	}
	
%>
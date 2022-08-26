<%@page import="java.util.ArrayList"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="config.Util"%>
<%@ include file="_inc_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 String passwd = request.getParameter("passwd");
 int no = Integer.parseInt(no_);
 
 // parentsNO 를 만들어 글을쓸떄 답변글이면 부모글의 번호를 담고 없으면 0을담아 판단도가능
 BoardBasicDTO dto = new BoardBasicDTO();
 dto.setNo(no);
 dto.setPasswd(passwd);
 
 
 BoardBasicDAO dao = new BoardBasicDAO(); 
 dto = dao.getSelectOne(dto);
	 out.println("<script>");
	 out.println("alert('자식글이 있어 지울수 없습니다.');");
	 out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
	 out.println("</script>");
	 
	 

 
 Util util = new Util();
 

 
 
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
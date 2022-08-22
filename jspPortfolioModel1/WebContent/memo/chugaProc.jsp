<%@page import="config.Util"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
 String writer = request.getParameter("writer");	
 String content = request.getParameter("content");	
 
 int failCounter = 0;
 if(writer == null || writer.equals("")){ failCounter++;}
 if(content == null || content.equals("")){ failCounter++;}
 
 Util util = new Util();
 writer = util.getCheckString(writer);
 content = util.getCheckString(content);
 
 
 MemoDTO dto = new MemoDTO();
 dto.setWriter(writer);
 dto.setContent(content);
 MemoDAO dao = new MemoDAO();
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
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_chuga';");
		out.println("</script>");
	}
	
%>
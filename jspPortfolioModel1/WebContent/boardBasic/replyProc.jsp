<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@ include file="_inc_top.jsp" %>
<%@page import="config.Util"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 request.setCharacterEncoding("UTF-8");
 
 String no_ = request.getParameter("no");
 String writer = request.getParameter("writer");
 String subject = request.getParameter("subject");
 String content = request.getParameter("content");	
 String passwd = request.getParameter("passwd");
 String email = request.getParameter("email");

 
 
 Util util = new Util();
 content = util.getCheckString(content);
 
 BoardBasicDAO dao = new BoardBasicDAO();
 int num = dao.getMaxNum() + 1;
 if(no_ == null || no_.equals("")){
	return;
 } 
	  int no = Integer.parseInt(no_);
 	  BoardBasicDTO searchDto = new BoardBasicDTO();
	  searchDto.setNo(no);
	  searchDto = dao.getSelectOne(searchDto);
	  int  refNo = searchDto.getRefNo();
	  int  stepNo = searchDto.getStepNo()+1;
	  dao.updateLevelNo(searchDto);
	  int levelNo = searchDto.getLevelNo()+1;
	  System.out.println("2");
 
 
 
 
 
 int hit = 0;
 
 BoardBasicDTO dto = new BoardBasicDTO();
 dto.setWriter(writer);
 dto.setPasswd(passwd);
 dto.setEmail(email);
 dto.setContent(content);
 dto.setSubject(subject);
 dto.setNum(num);
 dto.setRefNo(refNo);
 dto.setStepNo(stepNo);
 dto.setLevelNo(levelNo);
 dto.setHit(hit);
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
		out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=boardBasic_reply';");
		out.println("</script>");
	}
	
%>
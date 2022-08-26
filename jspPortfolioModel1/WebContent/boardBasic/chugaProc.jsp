<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@ include file="_inc_top.jsp" %>
<%@page import="config.Util"%>
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
 no_ = util.getNullBlankCheck(no_, "0");
 int no = Integer.parseInt(no_);
 content = util.getCheckString(content);
 
 BoardBasicDAO dao = new BoardBasicDAO();
 BoardBasicDTO dto = new BoardBasicDTO();
 int num = dao.getMaxNum() + 1;
 int parentNo=0;
 
 int refNo = dao.getRefNo() + 1;
 int stepNo = 1;
 int levelNo = 1;
 int memberNo = sessionNo;
 if(no > 0){
	 BoardBasicDTO arguDto = new BoardBasicDTO();
	 arguDto.setNo(no);
	 dto = dao.getSelectOne(arguDto);
	 refNo = dto.getRefNo();
	 stepNo = dto.getStepNo() + 1;
	 dao.updateLevelNo(dto);
	 levelNo = dto.getLevelNo() +1;
	 parentNo = no;
 	 System.out.println("1");
 }
 
 int hit = 0;
 
 
 
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
 dto.setMemberNo(memberNo);
 dto.setIp(ip);
 dto.setParentNo(parentNo);
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
		out.println("location.href = 'main.jsp?menuGubun=boardBasic_chuga';");
		out.println("</script>");
	}
	
%>
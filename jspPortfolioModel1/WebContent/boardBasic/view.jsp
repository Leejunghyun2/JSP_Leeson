<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ include file="_inc_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String no_ = request.getParameter("no");
if(no_ == null || no_.equals("")){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.')");
	out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
	out.println("</script>");
}

int no = Integer.parseInt(no_);
BoardBasicDTO dto = new BoardBasicDTO();
dto.setNo(no);
BoardBasicDAO dao = new BoardBasicDAO();
dao.setUpdateHit(dto);
dto = dao.getSelectOne(dto);   
if(dto.getNo() <= 0){ 
	out.println("<script>");
	out.println("alert('존재하지 않습니다.')");
	out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
	out.println("</script>");
	return;
}
String moveUrl = "main.jsp?menuGubun=";
%>
<h2>메모상세보기</h2>
	<table border="1" align="center" width="80%">
		<tr>
			<td width="150">제목 :</td>
			<td><%=dto.getSubject() %></td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td><%=dto.getWriter() %></td>
		</tr>
		
		<tr>
			<td>이메일 :</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>
			<%
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			out.println(content);
			%>
			</td>
		</tr>
		<tr>
			<td>조회수 :</td>
			<td><%=dto.getHit() %></td>
		</tr>
	</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('boardBasic_reply','<%=dto.getNo()%>');">댓글달기</a>
		|
		<a href="#" onclick="move('boardBasic_list','');">목록</a>
		|
		<a href="#" onclick="move('boardBasic_chuga','');">등록</a>
		|
		<a href="#" onclick="move('boardBasic_sujung','<%=dto.getNo()%>');">수정</a>
		|
		<a href="#" onclick="move('boardBasic_sakje','<%=dto.getNo()%>');">삭제</a>
		|
	</div>
<script>
	function move(val1, val2) {
		location.href = "<%=moveUrl%>" + val1 +"&no=" + val2;
	}
</script>
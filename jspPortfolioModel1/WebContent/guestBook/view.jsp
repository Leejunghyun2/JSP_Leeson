<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String no_ = request.getParameter("no");

if(no_ == null || no_.equals("")){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.')");
	out.println("location.href = 'main.jsp?menuGubun=memo_list';");
	out.println("</script>");
}

int no = Integer.parseInt(no_);
GuestBookDTO dto = new GuestBookDTO();
dto.setNo(no);

GuestBookDAO dao = new GuestBookDAO();
dto = dao.getSelectOne(dto);   
if(dto.getNo() <= 0){
	out.println("<script>");
	out.println("alert('존재하지 않습니다.')");
	out.println("location.href = 'main.jsp?menuGubun=memo_list';");
	out.println("</script>");
	return;
}
%>
<h2>메모상세보기</h2>
	<table border="1" align="center">
		<tr>
			<td>작성자 :</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>
			<%=dto.getContent() %>
			<hr>
			<%
			String content = dto.getContent();
			content = content.replace("\n", "<br>");
			out.println(content);
			
			%>
			
			
			</td>
		</tr>
		<tr>
			<td>등록일 :</td>
			<td><%=dto.getRegiDate() %></td>
		</tr>
	</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%"; align="right">
		|
		<a href="#" onclick="move('guestBook_list','');">목록</a>
		|
		<a href="#" onclick="move('guestBook_chuga','');">등록</a>
		|
		<a href="#" onclick="move('guestBook_sujung','<%=dto.getNo()%>');">수정</a>
		|
		<a href="#" onclick="move('guestBook_sakje','<%=dto.getNo()%>');">삭제</a>
		|
	</div>
<script>
	function move(val1, val2) {
		location.href = "main.jsp?menuGubun=" +val1+"&no=" + val2;
	}
</script>
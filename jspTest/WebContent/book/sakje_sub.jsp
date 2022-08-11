<%@page import="book.model.dto.BookDTO"%>
<%@page import="book.model.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	BookDTO dto = new BookDTO();
	dto.setNo(no);
	BookDAO dao = new BookDAO();
	dto = dao.getSelectOne(dto);
%>    
<h2>도서상세보기</h2>

<form name="sakjeForm">
<input type="hidden" name="no" value=<%=no %> readonly>
<table border="1">
	<tr>
		<td>제목 : </td>
		<td><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td><%=dto.getAuthor() %></td>
	</tr>
	<tr>
		<td>발행일 : </td>
		<td><%=dto.getCreated() %></td>
	</tr>
	<tr>
		<td>분류 : </td>
		<td><%=dto.getProfile() %></td>
	</tr>
	<tr>
		<td>등록일 : </td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button" onclick="move();">삭제하기</button></td>
	</tr>
	
</table>
</form>
	<div width: 70%; margin-top : "10px;" align="center">
			|
			<a href="#" onclick="location.href = 'list.jsp'">목록으로</a> 
			| 
	</div>
<script>
	function move(){
		var f = document.sakjeForm;
		f.action = "sakjeProc.jsp";
		f.method = "post";
		f.submit();
	}

</script>
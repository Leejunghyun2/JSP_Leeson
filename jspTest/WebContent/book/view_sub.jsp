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

<form name="dirForm">
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
	
</table>
<div width: 70%; margin-top : "10px;" align="center">
				|
				<a href="#" onclick="location.href = 'list.jsp'">목록</a> 
				|
				<a href="#" onclick="move('sujung.jsp',<%=no%>)">수정</a> 
				|
				<a href="#" onclick="move('sakje.jsp',<%=no%>)">삭제</a> 
				| 
		</div>
</form>
<script>
	function move(val1, val2){
		location.href = val1 + '?no=' + val2;
	}

</script>
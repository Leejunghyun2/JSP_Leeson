<%@page import="java.util.ArrayList"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookDTO> list = dao.getSelectAll();
	
%> 
<h2>도서목록</h2>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>저자</th>
		<th>발행일</th>
		<th>분류</th>
		<th>등록일</th>
	</tr>
	<% 
		int totalRecord = list.size();
		if(totalRecord == 0){
	%>
	<tr>
		<td colspan="6" align="center">등록된 내용이 존재 하지 않습니다.</td>
	</tr>
	<%
		}
		for(int i=0;i<list.size();i++){
	
	%>
	<tr>
		<th><%=totalRecord-- %></th>
		<th><a href="#" onclick="move('view.jsp','<%=list.get(i).getNo()%>');"><%=list.get(i).getSubject() %></a></th>
		<th><%=list.get(i).getAuthor() %></th>
		<th><%=list.get(i).getCreated() %></th>
		<th><%=list.get(i).getProfile() %></th>
		<th><%=list.get(i).getRegiDate() %></th>
	</tr>
	<%
		}
	%>
</table>
		<div width: 70%; margin-top : "10px;" align="center">
				|
				<a href="#" onclick="move('list.jsp','');">목록</a> 
				| 
				<a href="#" onclick="move('chuga.jsp','');">등록</a> 
				|
		</div>
<script>
	function move(val1, val2){
		location.href = val1 + '?no=' + val2;
	}
</script>
<%@page import="java.sql.Date"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookAuthorDAO dao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
%>
	<table border="1" width="80%" align="center">
		<tr>
			<td>순번</td>
			<td>저자</td>
			<td>등록일</td>
			<td colspan="2">선택</td>
		</tr>
		 
		<%
		for(int i=0; i < list.size(); i++){
			BookAuthorDTO dto = list.get(i);
			int authorNo = dto.getAuthorNo();
			String name = dto.getAuthor();
			Date regiDate = dto.getRegiDate();
		%>
		<tr>
			<td><%=totalRecord-- %></td>
			<td><%=name %></td>
			<td><%=regiDate %></td>
			<td><a href="#" onclick="move('sujung.jsp','<%=authorNo%>')">[수정]</a></td>
			
			<td><a href="#" onclick="move('sakje.jsp','<%=authorNo%>')">[삭제]</a></td>
			
		</tr>
		<%
		}
		%>
	</table>
		|
	 	<a href="#" onclick="move('chuga.jsp','')">등록</a>
	 	|
	<script>
		function move(val1, val2){
			location.href = val1 + "?authorNo=" +val2;
		} 	
		 	
 	</script>
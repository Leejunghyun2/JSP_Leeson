<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookInfoDAO dao = new BookInfoDAO();
	ArrayList<BookInfoDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
%>
	<table border="1" width="80%" align="center">
		<tr>
			<td>순번</td>
			<td>제목</td>
			<td>저자번호</td>
			<td>저자</td>
			<td>분류번호</td>
			<td>등록일</td>
			<td>비고</td>
		</tr>
		 
		<%
		for(int i=0; i < list.size(); i++){
			BookInfoDTO dto = list.get(i);
			int infoNo = dto.getInfoNo();
			String subject = dto.getSubject();
			int authorNo = dto.getAuthorNo();
			String author = dto.getAuthor();
			int profileNo = dto.getProfileNo();
			Date created = dto.getCreated();
		%>
		<tr>
			<td><%=totalRecord-- %></td>
			<td><%=subject %></td>
			<td><%=authorNo %></td>
			<td><%=author %></td>
			<td><%=profileNo %></td>
			<td><%=created %></td>
			<td><a href="#" onclick="move('sujung.jsp','<%=infoNo%>')">[수정]</a>
			
			<a href="#" onclick="move('sakje.jsp','<%=infoNo%>')">[삭제]</a></td>
			
		</tr>
		<%
		}
		%>
	</table>
		|
	 	<a href="#" onclick="move('chuga.jsp','')">등록</a>
	 	|
	 	<a href="#" onclick="move('list.jsp','')">목록</a>
	 	|
	<script>
		function move(val1, val2){
			location.href = val1 + "?infoNo=" +val2;
		} 	
		 	
 	</script>
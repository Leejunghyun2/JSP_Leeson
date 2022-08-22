<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    GuestBookDAO dao = new GuestBookDAO();
    ArrayList<GuestBookDTO> list = dao.getSelectAll(); 
    int totalCount = list.size();
    %>
<h2>방명록내용</h2>
<table border="1" align="center" width="80%">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th width="300px">메모내용</th>
		<th>등록일</th>
	</tr>
	<% 
		for(int i=0; i<list.size();i++){
			GuestBookDTO dto = list.get(i);
		%>
	<tr>
		<th><%=totalCount-- %></th>
		<th><a href="#" onclick="move('guestBook_view','<%=dto.getNo()%>');"><%=dto.getName() %></a></th>
		<th width="300px"><%=dto.getContent() %></th>
		<th><%=dto.getRegiDate() %></th>
	</tr>
    <%} %>
</table>

	<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('guestBook_list','');">목록</a>
		|
		<a href="#" onclick="move('guestBook_chuga','');">등록</a>
		|
	</div>
	<script>
		function move(val1, val2){
			location.href = "main.jsp?menuGubun="+val1+"&no="+val2;
		}
	</script>
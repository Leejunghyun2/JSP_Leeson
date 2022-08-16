<%@page import="java.util.ArrayList"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookProfileDAO dao = new BookProfileDAO();
	ArrayList<BookProfileDTO> list = dao.getSelectAll();
	
	int num = list.size();
%>
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>분류</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<% 
		for(int i=0; i<list.size(); i++){
			BookProfileDTO dto = list.get(i);
	%>
		<tr>
			<td><%=num-- %></td>
			<td><%=dto.getProfile() %></td>
			<td><%=dto.getRegiDate() %></td>
			<td>
				<a href="#" onclick="move('sujung.jsp','<%=dto.getProfileNo() %>');">[수정]</a>
				<a href="#" onclick="move('sakje.jsp','<%=dto.getProfileNo() %>');">[삭제]</a>
			</td>	
		</tr>
	<%
	}
	%>
</table>
	|
	<a href="chuga.jsp">등록하기</a>
	|
	<a href="list.jsp">목록으로</a>
	|
<script>
	function move(val1, val2){
		location.href = val1 + "?profileNo=" + val2;
	}

</script>
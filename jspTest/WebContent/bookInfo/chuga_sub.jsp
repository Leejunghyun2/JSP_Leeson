<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	BookProfileDAO dao = new BookProfileDAO();
	ArrayList<BookProfileDTO> list = dao.getSelectAll();
	BookAuthorDAO dao2 = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> list2 = dao2.getSelectAll();
%>
<h2>저자등록</h2>
<form name="dirForm">
<table border="1" align="center">
	<tr>
		<td>책제목 : </td>
		<td><input type="text" name="subject" id=""></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td>
		<%
		for(int i=0; i<list2.size(); i++){
			BookAuthorDTO dto2 = list2.get(i);
		%>
		<input type="radio" name="authorNo" value="<%=dto2.getAuthorNo() %>"><%=dto2.getAuthor() %>
		<%} %>
		</td>
	</tr>
	<tr>
		<td>분류번호 : </td>
		<td>
		<%
		for(int i=0; i<list.size(); i++){
			BookProfileDTO dto = list.get(i);
		
		%>
		<input type="radio" name="profileNo" value="<%=dto.getProfileNo() %>"><%=dto.getProfile() %>
		<%} %>
		</td>
		
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">저장하기</button>
			<button type="button" onclick="location.href = 'list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
function formSubmit(){
	if(confirm('저장할까요?')){
		var f = document.dirForm;
		f.action = "chugaProc.jsp";
		f.method = "post";
		f.submit();
	}
}
</script>
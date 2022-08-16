<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		String authorNo_= request.getParameter("authorNo");
   		int authorNo = Integer.parseInt(authorNo_);
   		
   		BookAuthorDTO arguDto = new BookAuthorDTO();
   		arguDto.setAuthorNo(authorNo);
   		
   		BookAuthorDAO resultDao = new BookAuthorDAO();
   		BookAuthorDTO resultDto = resultDao.getSelectOne(arguDto);
   %>
<h2>저자수정</h2>
<form name="sakjeForm">
	<input type="hidden" name="authorNo" value="<%=authorNo %>">
<table border="1" align="center">
	<tr>
		<td>저자이름 : </td>
		<td><%=resultDto.getAuthor() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">삭제하기</button>
			<button type="button" onclick="location.href = 'list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
function formSubmit(){
	if(confirm('삭제할까요?')){
		var f = document.sakjeForm;
		f.action = "sakjeProc.jsp";
		f.method = "post";
		f.submit();
	}
}
</script>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		String infoNo_= request.getParameter("infoNo");
   		int infoNo = Integer.parseInt(infoNo_);
   		
   		BookInfoDTO arguDto = new BookInfoDTO();
   		arguDto.setInfoNo(infoNo);
   		
   		BookInfoDAO resultDao = new BookInfoDAO();
   		BookInfoDTO resultDto = resultDao.getSelectOne(arguDto);
   %>
<h2>저자수정</h2>
<form name="sakjeForm">
	<input type="hidden" name="infoNo" value="<%=infoNo %>">
<table border="1" align="center">
	<tr>
		<td>책 제목 : </td>
		<td><%=resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>책 저자 : </td>
		<td><%=resultDto.getAuthorNo() %></td>
	</tr>
	<tr>
		<td>책 분류 : </td>
		<td><%=resultDto.getProfileNo() %></td>
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
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   		String profileNo_= request.getParameter("profileNo");
   		int profileNo = Integer.parseInt(profileNo_);
   		
   		BookProfileDTO arguDto = new BookProfileDTO();
   		arguDto.setProfileNo(profileNo);
   		
   		BookProfileDAO resultDao = new BookProfileDAO();
   		BookProfileDTO resultDto = resultDao.getSelectOne(arguDto);
   %>
<h2>저자수정</h2>
<form name="sakjeForm">
	<input type="hidden" name="infoNo" value="<%=profileNo %>">
<table border="1" align="center">
	<tr>
		<td>분류 : </td>
		<td><%=resultDto.getProfile() %></td>
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
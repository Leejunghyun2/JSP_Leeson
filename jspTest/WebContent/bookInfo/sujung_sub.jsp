<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   		String infoNo_= request.getParameter("infoNo");
   		int infoNo = Integer.parseInt(infoNo_);
   		
   		BookInfoDTO arguDto = new BookInfoDTO();
   		arguDto.setInfoNo(infoNo);
   		
   		BookInfoDAO resultDao = new BookInfoDAO();
   		BookInfoDTO resultDto = resultDao.getSelectOne(arguDto);
   		
   		BookProfileDAO dao = new BookProfileDAO();
   		ArrayList<BookProfileDTO> list = dao.getSelectAll();
   		BookAuthorDAO dao2 = new BookAuthorDAO();
   		ArrayList<BookAuthorDTO> list2 = dao2.getSelectAll();
   %>
<h2>저자수정</h2>
<form name="sujungForm">
	<input type="hidden" name="infoNo" value="<%=infoNo %>">
<table border="1" align="center">
	<tr>
		<td>책 제목 : </td>
		<td><input type="text" name="subject" id="" value="<%=resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td>
		<%
		for(int i=0; i<list2.size(); i++){
			BookAuthorDTO dto2 = list2.get(i);
			if(resultDto.getAuthorNo() == dto2.getAuthorNo()){
		%>
		
		<input type="radio" name="authorNo" value="<%=dto2.getAuthorNo() %>" checked><%=dto2.getAuthor() %>
		<%} else { %>
			<input type="radio" name="authorNo" value="<%=dto2.getAuthorNo() %>" ><%=dto2.getAuthor() %>	
		<%	}
		}%>
		</td>
	</tr>
	<tr>
		<td>분류번호 : </td>
		<td>
		<select name="profileNo" >
		<%
		for(int i=0; i<list.size(); i++){
			BookProfileDTO dto = list.get(i);
			if(resultDto.getProfileNo() == dto.getProfileNo()){
		%>
		<option value="<%=dto.getProfileNo() %>" selected><%=dto.getProfile() %>
		<%} else { %>
			<option value="<%=dto.getProfileNo() %>" ><%=dto.getProfile() %>	
		<%	}
		}%>
		</select>
		</td>
		
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">수정하기</button>
			<button type="button" onclick="location.href = 'list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
function formSubmit(){
	if(confirm('수정할까요?')){
		var f = document.sujungForm;
		f.action = "sujungProc.jsp";
		f.method = "post";
		f.submit();
	}
}
</script>
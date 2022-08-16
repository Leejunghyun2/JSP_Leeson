<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String profileNo_ = request.getParameter("profileNo");
int profileNo = Integer.parseInt(profileNo_);

BookProfileDTO arguDto = new BookProfileDTO();
arguDto.setProfileNo(profileNo);

BookProfileDAO resultDao = new BookProfileDAO();
BookProfileDTO resultDto = resultDao.getSelectOne(arguDto);
%>
<form name="sujungForm">
	<input type="hidden" value="<%=profileNo%>">
	<table border="1" align="center">
		<tr>
			<td>분류</td>
			<td><input type="text" name="profile"></td>
		</tr>
		<tr>
			<td><button type="button" onclick="sujung();">수정하기</button></td>
	</table>
</form>
<script>
	function sujung() {
		var f = document.sujungForm;
		f.action = "sujungProc.jsp";
		f.method = "post";
		f.submit();
	}
</script>

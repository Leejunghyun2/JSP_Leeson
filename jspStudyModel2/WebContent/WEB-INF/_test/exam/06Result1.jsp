<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../_include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../_include/inc_menu.jsp" %>
<h2>06</h2>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>${id }</td>
	</tr>
	<tr>
		<td>로그인결과</td>
		<td>${msg }</td>
	</tr>
	
	
</table>
<%--
	<a href="/jspStudyModel2/exam_servlet/06Proc2.do?id=${id }&msg=${msg}">다음페이지로 이동</a>
<form name="DirForm">
	<input type="text" name="id" value="${id }">
	<input type="text" name="msg" value="${msg }">
</form>
<script>
	function autoMove(){
		var f = document.DirForm;
		f.action = "/jspStudyModel2/exam_servlet/06Proc2.do";
		f.method = "post";
		f.submit();
	}
	//autoMove();
</script>
 --%>
 <meta http-equiv="refresh" content="0; url=/jspStudyModel2/exam_servlet/06Proc2.do?id=${id }&msg=${msg}" >
</body>
</html>
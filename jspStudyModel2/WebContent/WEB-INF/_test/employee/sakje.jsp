<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../_include/inc_header.jsp" %>      
<%@ include file = "../../_include/inc_menu.jsp" %>
<h2>학사관리(학생등록)</h2>
<form name="DirForm">
<input type="hidden" name="sabun" value="${dto.sabun }">
	<table border="1">
		<tr>
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${dto.phone }</td>
		</tr>
		<tr>
			<td>입사일</td>
			<td>${dto.hireDate }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<td>연봉</td>
			<td>${dto.salary }</td>
		</tr>
		<tr>
			<td>부서</td>
			<td>${dto.buseo }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">삭제</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function save(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/employee_servlet/sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</body>
</html>
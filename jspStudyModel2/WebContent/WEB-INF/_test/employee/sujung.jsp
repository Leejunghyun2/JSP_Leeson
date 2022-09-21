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
			<td><input type="text" name="phone" value="${dto.phone }"></td>
		</tr>
		<tr>
			<td>입사일</td>
			<td>${dto.hireDate }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" value="${dto.email }"></td>
		</tr>
		<tr>
			<td>연봉</td>
			<td><input type="text" name="salary" value="${dto.salary }"></td>
		</tr>
		<tr>
			<td>부서</td>
			<td><input type="text" name="buseo" value="${dto.buseo }"></td>
		</tr>
		<tr>
			<td>직급</td>
			<td><input type="text" name="positionNo" value="${dto.positionNo }"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">수정</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function save(){
		if(confirm('수정하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/employee_servlet/sujungProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</body>
</html>
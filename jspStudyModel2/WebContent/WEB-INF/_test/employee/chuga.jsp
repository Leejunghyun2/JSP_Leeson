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
	<table border="1" width="80%">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>입사일</td>
			<td><input type="date" name="hireDate"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>연봉</td>
			<td><input type="text" name="salary"></td>
		</tr>
		<tr>
			<td>부서</td>
			<td>
				<select name="buseo">
					<option value="">-- 선택 --</option>
					<c:forEach var="dto" items="${list }">
					<option value="${dto.buseoNo }">${dto.buseoName }</option>
					</c:forEach>	
				</select>
			</td>
		</tr>
		<tr>
			<td>직급</td>
			<td><input type="text" name="positionNo"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">등록</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function save(){
		if(confirm('등록하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/employee_servlet/chugaProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</body>
</html>
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
<table border="1" width="80%">
		<tr>
			<td>사번</td>
			<td>${dto.sabun }</td>
		</tr>
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
			<td>등록일</td>
			<td>${dto.regiDate }</td>
		</tr>
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('list.do','')">목록</a>
		|
		<a href="#" onclick="move('chuga.do','')">등록</a>
		|
		<a href="#" onclick="move('sujung.do','${dto.sabun }')">수정</a>
		|
		<a href="#" onclick="move('sakje.do','${dto.sabun }')">삭제</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/employee_servlet/' + val1 + '?sabun=' + val2;
	}
</script>
</body>
</html>
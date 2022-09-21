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
			<td>이름</td>
			<td>전화번호</td>
			<td>입사일</td>
			<td>이메일</td>
			<td>연봉</td>
			<td>부서</td>
			<td>직급</td>
			<td>등록일</td>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.sabun }</td>
			<td><a href="#" onclick="move('view.do','${dto.sabun}')">${dto.name }</a></td>
			<td>${dto.phone }</td>
			<td>${dto.hireDate }</td>
			<td>${dto.email }</td>
			<td>${dto.salary } 만원</td>
			<td>${dto.buseo }</td>
			<td>${dto.positionNo }</td>
			<td>${dto.regiDate }</td>
		</tr>
		</c:forEach>
		
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('list.do','')">목록</a>
		|
		<a href="#" onclick="move('chuga.do','')">등록</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/employee_servlet/' + val1 + '?sabun=' + val2;
	}
</script>	
</body>
</html>
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
			<td>부서번호</td>
			<td>부서이름</td>
			<td>등록일</td>
			<td></td>
		</tr>
		<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.buseoNo }</td>
			<td>${dto.buseoName }</td>
			<td>${dto.regiDate }</td>
			<td>
				<a href="#" onclick="move('sujung.do','${dto.buseoNo}');">[수정]</a>
				<a href="#" onclick="move('sakje.do','${dto.buseoNo}');">[삭제]</a>
			</td>
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
		location.href = '${path }/buseo_servlet/' + val1 + '?buseoNo=' + val2;
	}
</script>	
</body>
</html>
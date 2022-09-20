<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../../_include/inc_header.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../../_include/inc_menu.jsp" %>

<hr>
<h2>학사관리(학생목록)</h2>
	<table border="1" width="80%">
		<tr>
			<td>시험이름</td>
			<td>시험날짜</td>
			<td>등록일</td>
			<td></td>
		</tr>
	<c:if test="${fn:length(list) == 0 }">
		<tr>
			<td colspan="6" style="width: 300px; height: 100px;">등록된 내용이 없습니다.</td>
		</tr>
	</c:if>
<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.sihumName }</td>
			<td><a href="#" onclick="move('view.do','')">${dto.sihumDate }</a></td>
			<td>${dto.regiDate }</td>
			<td>
				<a href="#" onclick="move('sujung.do','${dto.sihumNo}')">[수정]</a>
				<a href="#" onclick="move('sakje.do','${dto.sihumNo}')">[삭제]</a>			
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
		location.href = '${path }/haksaSihum_servlet/' + val1 + '?sihumNo=' + val2;
	}
</script>
</body>
</html>
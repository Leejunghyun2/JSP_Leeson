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
			<td>학번</td>
			<td>시험</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>과학</td>
			<td>역사</td>
			<td>총점</td>
			<td>평균</td>
			<td>등급</td>
		</tr>
	<c:if test="${fn:length(list) == 0 }">
		<tr>
			<td colspan="10" style="width: 300px; height: 100px;">등록된 내용이 없습니다.</td>
		</tr>
	</c:if>
<c:forEach var="dto" items="${list }">
		<tr>
			<td><a href="#" onclick="move('view.do','${dto.sungjukNo}')">${dto.name }</a></td>
			<td>${dto.sihumName }</td>
			<td>${dto.kor }</td>
			<td>${dto.eng }</td>
			<td>${dto.mat }</td>
			<td>${dto.sci }</td>
			<td>${dto.his }</td>
			<td>${dto.tot }</td>
			<td>${dto.avg }</td>
			<td>${dto.grade }</td>
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
		location.href = '${path }/haksaSungjuk_servlet/' + val1 + '?sungjukNo=' + val2;
	}
</script>
</body>
</html>
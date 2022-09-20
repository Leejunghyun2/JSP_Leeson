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
<h2>학사관리(학생상세정보)</h2>
<table border="1" width="80%">
		
		<tr>
			<td>학번</td>
			<td>${dto.hakbun }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>시험</td>
			<td>${dto.sihumName }</td>
		</tr>
		<tr>
			<td>국어</td>
			<td>${dto.kor }</td>
		</tr>
		<tr>
			<td>영어</td>
			<td>${dto.eng} </td>
			
		</tr>
		<tr>
			<td>수학</td>
			<td>${dto.mat }</td>
		</tr>
		<tr>
			<td>과학</td>
			<td>${dto.sci }</td>
		</tr>
		<tr>
			<td>역사</td>
			<td>${dto.his }</td>
		</tr>
		<tr>
			<td>합계</td>
			<td>${dto.tot }</td>
		</tr>
		<tr>
			<td>평균</td>
			<td>${dto.avg }</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>${dto.grade }</td>
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
		<a href="#" onclick="move('sujung.do','${dto.sungjukNo }')">수정</a>
		|
		<a href="#" onclick="move('sakje.do','${dto.sungjukNo }')">삭제</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/haksaSungjuk_servlet/' + val1 + '?sungjukNo=' + val2;
	}
</script>
</body>
</html>
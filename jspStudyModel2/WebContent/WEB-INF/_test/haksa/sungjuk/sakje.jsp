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
<h2>학사관리(학생등록)</h2>
<form name="sakjeForm">
<input type="hidden" name="sungjukNo" value="${dto.sungjukNo }">
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
			<td>${dto.eng }</td>
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
			<td colspan="2" align="center">
				<button type="button" onclick="sakje();">삭제</button>
			</td>
		</tr>
	</table>

<script>
	function sakje(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.sakjeForm;
			f.action = "${path }/haksaSungjuk_servlet/sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>

	
</form>
</body>
</html>
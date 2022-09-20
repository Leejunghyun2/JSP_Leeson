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
<form name="DirForm">
	<table border="1">
		<tr>
			<td>학번</td>
			<td><input type="text" name="hakbun"></td>
		</tr>
		<tr>
			<td>시험</td>
			<td>
				<select name="sihumNo">
				<c:forEach var="str" items="${list }">
					<option value="${str.sihumNo }">${str.sihumName }</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>국어</td>
			<td><input type="text" name="kor"></td>
		</tr>
		<tr>
			<td>영어</td>
			<td><input type="text" name="eng"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="mat"></td>
		</tr>
		<tr>
			<td>과학</td>
			<td><input type="text" name="sci"></td>
		</tr>
		<tr>
			<td>역사</td>
			<td><input type="text" name="his"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">등록</button>
			</td>
		</tr>
	</table>

<script>
	function save(){
		if(confirm('등록하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/haksaSungjuk_servlet/chugaProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>

	
</form>
</body>
</html>
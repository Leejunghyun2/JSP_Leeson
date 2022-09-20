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
<h2>학사관리(시험수정)</h2>
<form name="sakjeForm">
<input type="hidden" name="sihumNo" value="${dto.sihumNo }">
	<table border="1">
		<tr>
			<td>시험이름</td>
			<td>${dto.sihumName }</td>
		</tr>
		<tr>
			<td>시험날짜</td>
			<td>${dto.sihumDate }</td>
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
			f.action = "${path }/haksaSihum_servlet/sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>	
</form>
</body>
</html>
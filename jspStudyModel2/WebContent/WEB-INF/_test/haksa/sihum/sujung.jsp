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
<form name="sujungForm">
<input type="hidden" name="sihumNo" value="${dto.sihumNo }">
	<table border="1">
		<tr>
			<td>시험이름</td>
			<td><input type="text" name="sihumName" value="${dto.sihumName }"></td>
		</tr>
		<tr>
			<td>시험날짜</td>
			<td><input type="date" name="sihumDate" value="${dto.sihumDate }"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sujung();">수정</button>
			</td>
		</tr>
	</table>

<script>
	function sujung(){
		if(confirm('수정하시겠습니까?')){
			var f = document.sujungForm;
			f.action = "${path }/haksaSihum_servlet/sujungProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>	
</form>
</body>
</html>
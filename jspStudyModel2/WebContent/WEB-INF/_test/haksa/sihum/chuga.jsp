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
<h2>학사관리(시험등록)</h2>
<form name="DirForm">
	<table border="1">
		<tr>
			<td>시험이름</td>
			<td><input type="text" name="sihumName"></td>
		</tr>
		<tr>
			<td>시험날짜</td>
			<td><input type="date" name="sihumDate"></td>
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
			f.action = "${path }/haksaSihum_servlet/chugaProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>	
</form>
</body>
</html>
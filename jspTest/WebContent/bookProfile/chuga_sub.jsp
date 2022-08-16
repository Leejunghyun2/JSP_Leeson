<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="dirForm">
	<table border="1" align="center">
		<tr>
			<td>분류</td>
			<td><input type="text"  name="profile"></td>
		</tr>
		<tr>
			<td><button type="button" onclick="chuga();">등록하기</button></td>
	</table>
</form>
<script>
	function chuga(){
		var f = document.dirForm;
		f.action="chugaProc.jsp";
		f.method="post";
		f.submit();
	}
</script>
</body>
</html>
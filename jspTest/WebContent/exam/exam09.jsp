<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam09.jsp</h2>
	<form name="testForm09">
		<table border="1">
			<tr>
				<td>이름1 :</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이름2 :</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이름3 :</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td><button type="button" onclick="move();">등록</button></td>
			</tr>
		</table>
	</form>
	<script>
		function move() {
			var f = document.testForm09
			f.action = "exam09Proc.jsp";
			f.method = "post";
			f.submit();
		}
	</script>
</body>
</html>
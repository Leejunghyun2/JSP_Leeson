<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../_include/inc_header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../_include/inc_menu.jsp" %>
<h2>07</h2>
<%--
	<table border="1">
		<tr>
			<td>이름 :</td>
			<td>${name }</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td>${address }</td>
		</tr>
		<tr>
			<td>나이 :</td>
			<td>${age }</td>
		</tr>
		
	</table>
--%>
<script>
	function autoMove(){
		location.href = "/jspStudyModel2/exam_servlet/07.do?name=${name}&address=${address}&age=${age}";
	}
	autoMove()
</script>
</body>
</html>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_fileInfo.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성적관리(등록)</h2>
	<form name="chugaForm">
		<table border="1">
		<tr>
			<td>이름 : </td> 
			<td><input type="text" name="name"></td>
		</tr>
		<tr>	
			<td>국어 : </td>
			<td><input type="text" name="kor"></td>
		<tr>
			<td>영어 : </td>
			<td><input type="text" name="eng"></td>
		</tr>
		<tr>
			<td>수학 : </td>
			<td><input type="text" name="mat"></td>
		</tr>
		<tr>
			<td>과학 : </td>
			<td><input type="text" name="scie"></td>
		</tr>
		<tr>
			<td>역사 : </td>
			<td><input type="text" name="his"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="chuga();">확인</button>
		</tr>
		<tr>
			<td height="30px" colspan="7"  align="right">
				<a href="#" onclick="move('list','');">목록</a>
				|
				<a href="#" onclick="move('chuga','');">등록</a>
			</td>
		</tr>
		</table>
	</form>
	<script>
		function chuga(){
			if(confirm('저장 하시겠습니까?')){
				var f = document.chugaForm
				f.action = "chugaProc.jsp";
				f.method = "post"
				f.submit();
			}
		}
	
	</script>
</body>
</html>
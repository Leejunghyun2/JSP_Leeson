<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../_include/inc_menu.jsp" %>
<form name="DirForm">
	<table border="1">
		<tr>
			<td>이름 :</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>출생년도 :</td>
			<td><input type="text" name="birth"></td>
		</tr>
		<tr>
			<td colspan="2">
			   <button type="button" onclick="save();">확인</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function save(){
		var f = document.DirForm;
		if(confirm('등록하시겠습니까?')){
			f.action = "/jspStudyModel2/exam_servlet/02Proc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</body>
</html>
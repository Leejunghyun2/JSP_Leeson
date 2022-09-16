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
			<td>주민번호 :</td>
			<td>
				<input type="text" name="jumin1" maxlength="6">
				<input type="text" name="jumin2" maxlength="7">
			</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td colspan="2">
			   <button type="button" onclick="save();">확인</button>
			</td>
		</tr>
	</table>
</form>
</body>
<script>
	function save(){
		var f = document.DirForm;
		if(confirm('등록하시겠습니까?')){
			f.action = "/jspStudyModel2/exam_servlet/03Proc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</html>
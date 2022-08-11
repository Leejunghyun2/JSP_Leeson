<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>도서등록</h2>

<form name="dirForm">
<table border="1">
	<tr>
		<td>제목 : </td>
		<td><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td><input type="text" name="author" id="author"></td>
	</tr>
	<tr>
		<td>발행일 : </td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>분류 : </td>
		<td><input type="text" name="profile" id="profile"></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button" onclick="formSubmit();">저장하기</button></td>
	</tr>
</table>
	<div width: 70%; margin-top : "10px;" align="center">
			|
			<a href="#" onclick="location.href = 'list.jsp'">목록으로</a> 
			| 
	</div>
</form>
<script>
	function formSubmit(){
		if(confirm('저장할까요?')){
			var f = document.dirForm
			f.action = "chugaProc.jsp";
			f.method = "post";
			f.submit();
		}
	}

</script>
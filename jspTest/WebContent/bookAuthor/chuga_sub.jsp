<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>저자등록</h2>
<form name="dirForm">
<table border="1" align="center">
	<tr>
		<td>저자이름 : </td>
		<td><input type="text" name="author" id="author"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">저장하기</button>
			<button type="button" onclick="location.href = 'list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
function formSubmit(){
	if(confirm('저장할까요?')){
		var f = document.dirForm;
		f.action = "chugaProc.jsp";
		f.method = "post";
		f.submit();
	}
}
</script>
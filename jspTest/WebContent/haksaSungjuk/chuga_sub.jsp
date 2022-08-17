<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="dirForm">
<table border="1" width="80%" align="center">
	
	<tr>
		<td>학번 :</td>
		<td><input type="text" name="hakbun"></td>
	</tr>
	<tr>
		<td>시험 :</td>
		<td><input type="text" name="sihumNo"></td>
	</tr>
	<tr>
		<td>국어 :</td>
		<td><input type="text" name="kor"></td>
	</tr>
	<tr>
		<td>영어 :</td>
		<td><input type="text" name="eng"></td>
	</tr>
	<tr>
		<td>수학 :</td>
		<td><input type="text" name="mat"></td>
	</tr>
	<tr>
		<td>과학 :</td>
		<td><input type="text" name="sci"></td>
	</tr>
	<tr>
		<td>역사 :</td>
		<td><input type="text" name="his"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><button type="button" onclick="chuga();">등록하기</button></td>	 	
	</tr>
</table>
</form>
<script>
	function chuga(){
		if(confirm('추가하시겠습니까?')){
			var f = document.dirForm
			f.action = "chugaProc.jsp";
			f.method = "post";
			f.submit();
		}
	}

</script>


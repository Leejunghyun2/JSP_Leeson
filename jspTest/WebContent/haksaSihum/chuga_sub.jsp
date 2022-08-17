<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form name="dirForm">
<table border="1" width="80%" align="center">
	
	<tr>
		<td>시험이름</td>
		<td><input type="text" name="sihumName"></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><input type="date" name="sihumDate"></td>
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


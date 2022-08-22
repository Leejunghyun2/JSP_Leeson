<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>메모등록</h2>
	<form name="chugaForm">
	<table border="1" align="center">
		<tr>
			<td>작성자 :</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea  rows="10" name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="join();">등록하기</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.chugaForm
		function join(){
			if(confirm('등록 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=guestBook_chugaProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
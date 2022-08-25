<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ include file="_inc_top.jsp" %>
<h2>메모등록</h2>
	<form name="chugaForm">
	<table border="1" align="center" style="margin-bottom: 50px">
		<tr>
			<td>작성자 :</td>
			<td width="300"><input type="text" name="writer" value="<%=sessionName%>"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea   style="width: 300px; height: 180px;" name="content"></textarea></td>
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
			<td colspan="2"><button type="button" onclick="join();">등록하기</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.chugaForm
		function join(){
			if(confirm('등록 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=boardBasic_chugaProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
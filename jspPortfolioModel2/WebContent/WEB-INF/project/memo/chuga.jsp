<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>메모등록</h2>
<%@ include file="../include/inc_header.jsp" %> 
<form name="DirForm">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="writer">
			</td>
		</tr>
		<tr>
			<td>메모내용</td>
			<td><input type="text" name="content" value=""></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">등록</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function save(){
		if(confirm('등록하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/memo_servlet/memo_chugaProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>	

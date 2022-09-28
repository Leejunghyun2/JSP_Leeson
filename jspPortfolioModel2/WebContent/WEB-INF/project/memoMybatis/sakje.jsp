<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원등록</h2>
<%@ include file="../include/inc_header.jsp" %> 
<form name="DirForm">
<input type="hidden" name="no" value="${dto.no }">
<input type="hidden" name="searchData" value="${searchData }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
	<table border="1">
		<tr>
			<td>작성자</td>
			<td>
				${dto.writer }
			</td>
		</tr>
		<tr>
			<td>메모내용</td>
			<td>${dto.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">삭제</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function save(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/memoMybatis_servlet/memoMybatis_sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>

	

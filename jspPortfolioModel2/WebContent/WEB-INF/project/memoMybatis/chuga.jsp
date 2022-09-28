<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>메모등록</h2>
<%@ include file="../include/inc_header.jsp" %> 
<form name="DirForm">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
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
				<button type="button" onclick="move('memoMybatis_list.do','');">목록</button>
			</td>
		</tr>
	</table>
</form>
<script>
function move(val1, val2){
	location.href = '${path }/memoMybatis_servlet/' + val1 + '?no=' + val2 +"&${searchQuery}";
	}
	function save(){
		if(confirm('등록하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/memoMybatis_servlet/memoMybatis_chugaProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>		
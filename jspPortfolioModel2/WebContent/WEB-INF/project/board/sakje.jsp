<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>     
<h2>게시글수정</h2>
<form name="DirForm">
<input type="hidden" name="no" value="${dto.no }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
<input type="hidden" name="pageNumber" value="1">
<input type="hidden" name="tbl" value="-">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="${dto.email }"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="${dto.subject }"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${dto.content }</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			<c:if test="${dto.noticeNo > 0 }"> 공지글</c:if>&nbsp;
		 	<c:if test="${dto.noticeNo <= 0 }"> 공지글아님</c:if>&nbsp;
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<c:if test="${dto.secretGubun == 'T'  }"> 비밀글</c:if>
			<c:if test="${dto.secretGubun == 'F'  }"> 비밀글아님</c:if> &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="save();">삭제하기</button>
			<button type="button" onclick="location.href = '${path}/board_servlet/board_list.do';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
	function save(){
		if(confirm('삭제할까요?')){
			var f = document.DirForm;
			f.action = "${path}/board_servlet/board_sakjeProc.do";
			f.method = "post";
			f.submit();
		}		
	}
</script>
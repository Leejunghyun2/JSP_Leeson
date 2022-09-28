<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원관리</h2>
<%@ include file="../include/inc_header.jsp" %>
 
	<table border="1" width="80%">
		<tr>
			<td>순번</td>
			<td>작성자</td>
			<td>메모내용</td>
			<td>등록일</td>
			<td></td>
		</tr>
		<c:if test="${fn:length(list) == 0 }">
		<tr>
			<td colspan="6" style="width: 300px; height: 100px;">등록된 내용이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="memo" items="${list }">
			<tr>
				<td>${memo.no }</td>
				<td>${memo.writer }</td>
				<td>${memo.content }</td>
				<td>${memo.regiDate }</td>
				<td>
					<a href="#" onclick="move('memo_sujung.do','${memo.no}')">[수정]</a>
					<a href="#" onclick="move('memo_sakje.do','${memo.no}')">[삭제]</a>
				</td>
			</tr>
		</c:forEach>
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('memo_list.do','')">목록</a>
		|
		<a href="#" onclick="move('memo_chuga.do','')">등록</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/memo_servlet/' + val1 + '?no=' + val2;
	}
</script>
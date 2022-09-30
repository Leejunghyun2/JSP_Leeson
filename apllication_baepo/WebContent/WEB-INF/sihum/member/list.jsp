<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %>
<h2>회원목록</h2> 
<table border="1" width="80%">
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>출생년도</td>
			<td>가입일</td>
		</tr>
		<c:if test="${totalRecord == 0 }">
		<tr>
			<td colspan="7" style="width: 300px; height: 100px;" align="center">등록된 회원이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="memberDto" items="${list }">
			<tr>
				<td>${memberDto.no }</td>
				<td><a href="#" onclick="move('member_view.do','${memberDto.no}')">${memberDto.id }</a></td>
				<td>${memberDto.passwd }</td>
				<td>${memberDto.name }</td>
				<td>${memberDto.birthYear }</td>
				<td>${memberDto.regiDate }</td>
			</tr>
		</c:forEach>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="${path }/member_servlet/member_chuga.do">등록</a>
		|
</div>
<script>
function move(val1, val2){
	location.href = "${path}/member_servlet/"+ val1 +"?no=" + val2
}
</script>
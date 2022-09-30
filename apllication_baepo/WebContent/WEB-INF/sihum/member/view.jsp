<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %> 
<table border="1" width="50%">
	<tr>
		<td colspan="2">
			<h2>회원 상세보기</h2>
		</td>
	</tr>
	<tr>
		<td>순번</td>
		<td>${dto.no }</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			${dto.id }
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${dto.passwd }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			${dto.gender }
		</td>
	</tr>
	<tr>
		<td>태어난연도</td>
		<td>${dto.birthYear }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			${dto.addr1 } ${dto.addr2 } ${dto.addr3 } ${dto.addr4 }
		</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>
			${dto.regiDate }
		</td>
	</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 50%;" align="right">
		|
		<a href="${path }/member_servlet/member_list.do">목록</a>
		|
		<a href="${path }/member_servlet/member_chuga.do">등록</a>
		|
</div>
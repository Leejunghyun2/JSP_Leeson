<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../../_include/inc_header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../../_include/inc_menu.jsp" %>
<h2>학사관리(학생상세정보)</h2>
<table border="1" width="80%">
		<tr>
			<td>학번</td>
			<td>${dto.hakbun }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${dto.phone }</td>
		</tr>
		<tr>
			<td>부모전화번호</td>
			<td>${dto.parentPhone }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				${dto.addr1 }
				${dto.addr2 }
				${dto.addr3 }
				${dto.addr4 }
			</td>
		</tr>	
		<tr>
			<td>등록일</td>
			<td>${dto.regiDate }</td>
		</tr>
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('list.do','')">목록</a>
		|
		<a href="#" onclick="move('chuga.do','')">등록</a>
		|
		<a href="#" onclick="move('sujung.do','${dto.hakbun }')">수정</a>
		|
		<a href="#" onclick="move('sakje.do','${dto.hakbun }')">삭제</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/haksaStudent_servlet/' + val1 + '?hakbun=' + val2;
	}
</script>
</body>
</html>
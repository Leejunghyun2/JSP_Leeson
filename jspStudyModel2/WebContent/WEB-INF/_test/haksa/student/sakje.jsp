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
<h2>학사관리(학생등록)</h2>
<form name="sakjeForm">
<input type="hidden" name="hakbun" value="${dto.hakbun }">
	<table border="1">
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
			<td>
				${dto.regiDate }
			</td>
		</tr>	
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sakje();">삭제</button>
			</td>
		</tr>
	</table>

<script>
	function sakje(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.sakjeForm;
			f.action = "${path }/haksaStudent_servlet/sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</form>
</body>
</html>
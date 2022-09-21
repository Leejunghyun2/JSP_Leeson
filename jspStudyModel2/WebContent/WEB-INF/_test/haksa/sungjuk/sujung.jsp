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
<h2>학사관리(학생정보수정)</h2>
<form name="sujungForm">
<input type="hidden" name="sungjukNo" value="${dto.sungjukNo }">
	<table border="1">
		<tr>
			<td>학번</td>
			<td>${dto.hakbun }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>시험</td>
			<td>
				<select name="sihumNo">
				<c:forEach var="str" items="${list }">
					<option value="${str.sihumNo }" <c:if test="${str.sihumNo == dto.sihumNo }">selected</c:if>>${dto.sihumName }</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>국어</td>
			<td><input type="text" name="kor" value="${dto.kor }"></td>
		</tr>
		<tr>
			<td>영어</td>
			<td><input type="text" name="eng" value="${dto.eng }"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="mat" value="${dto.mat }"></td>
		</tr>
		<tr>
			<td>과학</td>
			<td><input type="text" name="sci" value="${dto.sci }"></td>
		</tr>
		<tr>
			<td>역사</td>
			<td><input type="text" name="his" value="${dto.his }"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sujung();">수정</button>
			</td>
		</tr>
	</table>

<script>
	function sujung(){
		if(confirm('수정하시겠습니까?')){
			var f = document.sujungForm;
			f.action = "${path }/haksaSungjuk_servlet/sujungProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>


</form>
</body>
</html>
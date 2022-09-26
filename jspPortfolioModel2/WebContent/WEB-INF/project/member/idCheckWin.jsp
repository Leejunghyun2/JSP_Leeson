<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form name="DirForm">
<table border="1" align="center" width="80%">
	<tr>
		<td colspan="2"><h2>아이디찾기</h2></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id" value="${id }" style="width: 100px;">
			<span id="spanMsg">${msg }</span>
			<br>
			<input type="hidden" name="result" id="result" value="${imsiId }" style="width: 100px;">
			</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onclick="search();">검색</button>
			<c:choose>
			<c:when test="${imsiId == '' }">
				
			</c:when>
			<c:otherwise>
				<button type="button" onclick="apply();">적용</button>
			</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
</form>
<script>
	function search(){
		var f = document.DirForm;
		f.action = "${path}/member_servlet/member_idCheckWinProc.do";
		f.method = "post";
		f.submit();
	}
	function apply(){
		var id = document.getElementById("result").value;
		opener.document.getElementById("id").value = id;
		opener.document.getElementById("tempId").value = id;
		//opener.document.getElementById("label_id").innerHTML = "<font style='color: red; font-size: 14px;'>hahaha</font>";
		window.close();
	}
</script>
</body>
</html>
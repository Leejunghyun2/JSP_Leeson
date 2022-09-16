<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = "../../_include/inc_header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../../_include/inc_menu.jsp" %>

<form name="DirForm">

<c:set var="startValue" value="1" /> <%-- jstl --%>
<c:set var="endValue" value="3" />  
<c:set var="n" value="0" />

<c:forEach var="i" begin="${startValue }" end="${endValue }" step="1">  
<table border="1">
		<tr>
			<td>이름 :</td>
			<td><input type="text" name="name_${i }"></td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><input type="text" name="address_${i }"></td>
		</tr>
		<tr>
			<td>나이 :</td>
			<td>
				<input type="text" name="age_${i }" maxlength="6">
			</td>
		</tr> 
		<c:if test="${i == endValue }">
			<tr>
				<td colspan="2">
				   <button type="button" onclick="save();">확인</button>
				</td>
			</tr>
		</c:if>
	</table>
<hr>
<c:set var="n" value="${n = n + 1 }" />
</c:forEach>
<input type="text" name="formCounter" value="${n }">
</form>
</body>
<script>
	function save(){
		var f = document.DirForm;
		if(confirm('등록하시겠습니까?')){
			f.action = "/jspStudyModel2/exam_servlet/04Proc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>
</html>
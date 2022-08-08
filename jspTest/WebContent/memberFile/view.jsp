<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");
   String member = request.getParameter("viewMember");
   
   String[] tmp = member.split(",");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
		<tr>
			<td>아이디 :</td>
			<td><%=tmp[0]%></td>
		</tr>
		<tr>
			<td>이름 :</td>
			<td><%=tmp[3]%></td>
		</tr>
		<tr>
			<td>전화번호 :</td>
			<td><%=tmp[4]%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=tmp[5]%></td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><%=tmp[6]%></td>
		</tr>
	

	</table>
	<div margin-top :"10px;" align="left">
		| <a onclick="move('list.jsp','');">목록</a> 
		| <a onclick="move('sujung.jsp','<%=member%>');">수정</a> 
		| <a onclick="move('sakje.jsp','<%=member%>');">삭제</a> 
		|
			<form name="moveValue">
				<input type="hidden" name="memberInfo"> 
			</form>
	</div>
	<script>
		function move(value1,value2){
			var f = document.moveValue
			f.memberInfo.value = value2;
			f.action = value1;
			f.submit();
		}
	</script>
</body>
</html>
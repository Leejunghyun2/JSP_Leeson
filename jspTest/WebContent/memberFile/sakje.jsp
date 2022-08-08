<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
   String member = request.getParameter("memberInfo");
   
   String[] tmp = member.split(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
		
	<form name=sujungForm>
		<table border="1">
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id" value=<%=tmp[0]%> readonly></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="passwd"><input type="hidden" name="passwdChk" value=<%=tmp[2] %>></td>
				   
			</tr>
			<tr>
				<td>이름 :</td>
				<td><%=tmp[3]%><input type="hidden" name="name" value=<%=tmp[3] %> readonly></td>
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
			<tr>
				<td><button type="button" onclick="sakje();">삭제하기</button></td>
			</tr>
			
		</table>
			
	</form>
	<script>
		function move(value1) {
			location.href = value1;
		}

		function sakje() {
			var f = document.sujungForm;
			f.action = "sakjeProc.jsp";
			f.method = "post";
			f.submit();
		}
	</script>
</body>
</html>
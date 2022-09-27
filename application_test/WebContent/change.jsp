<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = "";
	if(session.getAttribute("sessionName") != null){
		id = (String)session.getAttribute("sessionName");
	}
	if(id.equals("")){
		out.println("<script>");
		out.println("alert('로그인 후 이용해주세요');");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=id %>님 환영합니다. <a href="logout.jsp">[로그아웃]</a></h2> 
	<h2>비밀번호 수정 페이지입니다.</h2>
<form name="passwdChangeForm">
<input type="hidden" name="id" value="<%=id %>">
	<table border="1">
		<tr>
			<td>비밀번호:</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>비밀번호 확인:</td>
			<td><input type="password" name="passwdChk"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button type="button" onclick="passwdChange();">비밀번호변경하기</button></td>
		</tr>
	</table>
</form>
<script>
function passwdChange(){
	var passwd = document.passwdChangeForm.passwd.value;
	var passwdChk = document.passwdChangeForm.passwdChk.value;
	if(passwd == null || passwd == '' ){
		alert('비밀번호가 틀리거나 입력하지 않았습니다.');
		return;
	}
	if(passwdChk == null || passwdChk == '' ){
		alert('비밀번호가 틀리거나 입력하지 않았습니다.');
		return;
	}
	if(passwd != passwdChk){
		alert('비밀번호가 틀리거나 입력하지 않았습니다.');
		return;
	}
	
	var f = document.passwdChangeForm;
	f.action = "changeProc.jsp";
	f.method = "post";
	f.submit();
}
</script>
</body>
</html>
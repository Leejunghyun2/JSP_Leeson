<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<h2>로그인</h2>
<form name="dirForm">
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="passwd" id="passwd"><br>
이름 : <input type="text" name="name" id="name"><br>
나이 : <input type="text" name="age" id="age"><br>
<button type="button" onclick="save();">확인</button>
</form>

<script>
	function save(){
		var f = document.dirForm
		f.action = "exam01Proc.jsp";
		f.method = "post";
		f.submit();
	}
	
</script>
</body>
</html>
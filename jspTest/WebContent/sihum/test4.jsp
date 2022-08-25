<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<form name="testForm">
	이름 : <input type="text" name="name"><br>
	주소 : <input type="text" name='addr'><br>
	나이 : <input type="text" name='age'>
	<button type="button" onclick="test();">등록</button>
	</form>
	
</body>
<script>
	function test(){
		var f = document.testForm;
		f.action = "test4Proc.jsp";
		f.method = "post";
		f.submit();
	}

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>exam05.jsp</h2>
 	<form name="testForm05">
 	이름 : <input type="text" name="name"> <br>
 	나이 : <input type="text" name="age"> <br>
 	성별 : <input type="text" name="gender"> <br>
 	<button type="button" onClick="formSubmit();">등록</button>
 	</form>
 <script>
 function formSubmit(){
	 document.testForm05.action = "exam05Proc.jsp";
	 document.testForm05.method = "post";
	 document.testForm05.submit();
 }
 
 </script>
 
</body>
</html>
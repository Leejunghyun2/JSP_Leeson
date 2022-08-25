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
	사원번호 : <input type="text" name="e_num"><br>
	사원명 : <input type="text" name='e_name'><br>
	부서명 : <input type="text" name='d_name'><br>
	급여 : <input type="text" name='salary'><br>
	부서장명 : <input type="text" name='m_name'><br>
	<button type="button" onclick="test();">등록</button>
	</form>
	
</body>
<script>
	function test(){
		var f = document.testForm;
		f.action = "test5Proc.jsp";
		f.method = "post";
		f.submit();
	}

</script>
</html>
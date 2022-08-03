<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam08.jsp</h2>
	 <form name="testForm08">
 
 	 <input type="checkbox" name="hobby1" value="독서">독서 &nbsp; 
 	 <input type="checkbox" name="hobby2" value="음악">음악 &nbsp; 
 	 <input type="checkbox" name="hobby3" value="캠핑">캠핑 &nbsp; <br> 
 	 <input type="checkbox" name="hobby4" value="골프">골프 &nbsp; 
 	 <input type="checkbox" name="hobby5" value="등산">등산 &nbsp; 
 	 <input type="checkbox" name="hobby6" value="스쿠버">스쿠버 &nbsp; <br>
 	 <input type="checkbox" name="hobby7" value="모터사이클">모터사이클 &nbsp; 
 	 <input type="checkbox" name="hobby8" value="자동차">자동차 &nbsp; <br>
 	
 	<button type="button" onclick="formSubmit();">등록</button>
 	</form>
 	
 	<script>
 	 	function formSubmit(){
 	 		var f = document.testForm08;
 	 		f.action = "exam08Proc.jsp";
 	 		f.method = "post";
 	 		f.submit();
 	 	}
 	</script>
 	
</body>
</html>
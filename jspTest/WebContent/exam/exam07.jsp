<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>exam07.jsp</h2>
	 <form name="testForm07">
 	주소: <select name="address">
 		<option value="" selected>-선택-</option>
 		<option value="서울">서울</option>
 		<option value="대전">대전</option>
 		<option value="대구">대구</option>
 		<option value="부산">부산</option>
 		<option value="광주">광주</option>
 		<option value="기타">기타</option>
 	</select> <hr>
 	회원등급 : <input type="radio" name="grade" value="최우수회원" id="cus1"><label for="cus1" >최우수회원</label> &nbsp; 
 	<input type="radio" name="grade" value="우수회원" id="cus2"><label for="cus2">우수회원</label> &nbsp; 
 	<input type="radio" name="grade" value="일반회원" id="cus3"><label for="cus3">일반회원</label> &nbsp; <hr>
 	관심분야: <br><input type="checkbox" name="hobby" value="영화">영화 &nbsp; 
 	 <input type="checkbox" name="hobby" value="독서">독서 &nbsp; 
 	 <input type="checkbox" name="hobby" value="음악">음악 &nbsp; 
 	 <input type="checkbox" name="hobby" value="캠핑">캠핑 &nbsp; <br> 
 	 <input type="checkbox" name="hobby" value="골프">골프 &nbsp; 
 	 <input type="checkbox" name="hobby" value="등산">등산 &nbsp; 
 	 <input type="checkbox" name="hobby" value="스쿠버">스쿠버 &nbsp; <br>
 	 <input type="checkbox" name="hobby" value="모터사이클">모터사이클 &nbsp; 
 	 <input type="checkbox" name="hobby" value="자동차">자동차 &nbsp; <br>
 	
 	<button type="button" onclick="formSubmit();">등록</button>
 	</form>
 	
 	<script>
 	 	function formSubmit(){
 	 		var f = document.testForm07;
 	 		f.action = "exam07Proc.jsp";
 	 		f.method = "post";
 	 		f.submit();
 	 	}
 	</script>
 	
</body>
</html>
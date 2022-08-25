<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1번문제</h2>
<hr>
	<%
		int holSum = 0;
		int jjakSum = 0;
		for(int i=1; i<=100;i++){
			if((i%2) == 0){
				jjakSum += i;
			} else {
				holSum += i;
			}
		}
	
	%>
	1 ~ 100 사이의 홀수의 합계 : <%=holSum %> <br>
	1 ~ 100 사이의 짝수의 합계 : <%=jjakSum %> 
</body>
</html>
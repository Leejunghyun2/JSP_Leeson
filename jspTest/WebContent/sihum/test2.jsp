<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>2번문제</h2>
<hr>
	<% 
	int sum = 0;
	for(int i=1; i<=100; i++){
		if((i%3) != 0){
			continue;
		}
		sum += i;
	}
	%>
	1부터 100까지의 3의 배수의 합 <%=sum %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>3번문제</h2>
<hr>
	<table border="1" >
		
		<% 
		int sum = 0;
		for(int i=1; i<=10; i++){ %>
			<tr>
				<td width="50"><%=i %></td>
				<td width="50"><%=sum += i %></td>
			</tr>
		<%} %>
	</table>
</body>
</html>
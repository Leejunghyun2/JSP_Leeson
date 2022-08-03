<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String imsiInfo01 = "홍길동/90/80/70";
String imsiInfo02 = "이성순/99/88/77";
String imsiInfo03 = "장천용/100/100/100";

String memo = imsiInfo01 + "|" + imsiInfo02 + "|" + imsiInfo03;
String[] imsi = memo.split("[|]");
String[] imsi2;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
		</tr>

		
			<%
			for (int i = 0; i < imsi.length; i++) {%>
				<tr>
				<% 
				imsi2 = imsi[i].split("/");
				for(int j=0; j<imsi2.length; j++){
				%>
				<td><%=imsi2[j] %></td>
			<%	}%></tr>
			<%
			}%>
			
			
			
		


	</table>
</body>
</html>
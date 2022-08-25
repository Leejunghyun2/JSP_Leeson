<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String age_ = request.getParameter("age");
	
	int age = Integer.parseInt(age_);
%>
<h2>4번문제</h2>
<hr>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=addr %></td>
		</tr>
		<tr>
			<th>나이</th>
			<td><%=age %></td>
		</tr>
	</table>
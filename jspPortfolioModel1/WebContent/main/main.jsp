<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String menuGubun = request.getParameter("menuGubun");

	if(menuGubun==null || menuGubun.equals("")){
		menuGubun = "member_list";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	main.jsp
	<br>
	<%=menuGubun %>
</body>
</html>
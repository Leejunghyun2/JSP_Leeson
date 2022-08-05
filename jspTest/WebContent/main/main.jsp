<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String menuGubun = request.getParameter("menuGubun");
out.println("menuGubun :" + menuGubun + "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<!-- header 시작 -->
			<td height="100px" align="center"><jsp:include
					page="../include/inc_menu.jsp" flush="true"></jsp:include></td>
		</tr>
		<!-- main 시작 -->
		<tr>
			<td height="300px" align="center">
				<%
				String tmpPage = menuGubun.replace("_","/");
				tmpPage += ".jsp";
				String movePage = "../" + tmpPage;
				%>
				<jsp:include page="<%=movePage%>" flush="true"></jsp:include>
			</td>
		</tr>
		<!-- footer 시작 -->
		<tr>
			<td height="100px" align="center"><jsp:include
					page="../include/inc_bottom.jsp" flush="true" /></td>
		</tr>

	</table>
</body>
</html>
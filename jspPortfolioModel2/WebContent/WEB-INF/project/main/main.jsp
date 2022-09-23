<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 변수를 공유하여 사용하기위해 include file을 사용 --%>  
<%@ include file="../include/inc_header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center" width="80%">
		<tr>
			<td align="center" style="padding:20px 20px;">
				<jsp:include page="../include/inc_menu.jsp"/> 				
			</td>
		</tr>
		<tr>
			<td align="center" style="padding:20px 20px;">
			 <jsp:include page="../${folderName }/${fileName }"/> 
			</td>
		</tr>
		<tr>
			<td align="center" style="padding:20px 20px;" align="center">
				<jsp:include page="../include/inc_bottom.jsp"/>
			</td>
		</tr>
	</table>
</body>
</html>
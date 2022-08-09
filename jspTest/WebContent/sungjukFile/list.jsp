<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageName = "listPage";
%>
<%@ include file="_inc_fileInfo.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<String> list = new ArrayList<>();
	try{
		Scanner sReader = new Scanner(f);
		
		while(sReader.hasNextLine()){
			String data = sReader.nextLine();
			list.add(data);
		}
		sReader.close();
	}catch(Exception e){
		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성적관리(목록)</h2>
	<table border="1">
		<tr>
			<th>No.</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>과학</th>
			<th>역사</th>
		</tr>
		<%
		int no = 1;
		for(int i=0; i<list.size(); i++){ 
			String[] tmp = list.get(i).split(",");
		%>
			<tr>
				<td><%=no %></td>
				<td><a href="#" onclick="move('view','<%=tmp[0]%>');"><%=tmp[0] %></a></td>
				<td><%=tmp[1] %></td>
				<td><%=tmp[2] %></td>
				<td><%=tmp[3] %></td>
				<td><%=tmp[4] %></td>
				<td><%=tmp[5] %></td>
			</tr>
			
		<% no++;
		} %>
		<tr>
			<td height="30px" colspan="7"  align="right">
				<a href="#" onclick="move('list','');">목록</a>
				|
				<a href="#" onclick="move('chuga','');">등록</a>
			</td>
		</tr>
	</table>
	
	<script>
		function move(val1,val2){
			location.href = val1+".jsp?name="+val2;
		}
	</script>
	
</body>
</html>
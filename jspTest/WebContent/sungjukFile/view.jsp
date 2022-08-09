<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageName = "viewPage";
%>
<%@ include file="_inc_fileInfo.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String imsiData = "";
	
	try{
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()){
			String data = sReader.nextLine();
			int colonChk = data.indexOf(",");
			String nameChk = data.substring(0,colonChk);
			if(nameChk.equals(name)){
				imsiData = data;
				break;
			}
		}
		sReader.close();
	}catch(Exception e){
		
	}
	String[] tmp = imsiData.split(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>성적관리(상세보기)</h2>
	<form name="chugaForm">
		<table border="1">
		<tr>
			<td>이름 : </td> 
			<td><%=tmp[0] %></td>
		</tr>
		<tr>	
			<td>국어 : </td>
			<td><%=tmp[1] %></td>
		<tr>
			<td>영어 : </td>
			<td><%=tmp[2] %></td>
		</tr>
		<tr>
			<td>수학 : </td>
			<td><%=tmp[3] %></td>
		</tr>
		<tr>
			<td>과학 : </td>
			<td><%=tmp[4] %></td>
		</tr>
		<tr>
			<td>역사 : </td>
			<td><%=tmp[5] %></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="chuga();">확인</button>
		</tr>
		<tr>
			<td height="30px" colspan="7"  align="right">
				<a href="#" onclick="move('list','');">목록</a>
				|
				<a href="#" onclick="move('chuga','');">등록</a>
				|
				<a href="#" onclick="move('sujung','<%=tmp[0]%>');">수정</a>
				|
				<a href="#" onclick="move('sakje','<%=tmp[0]%>');">삭제</a>
			</td>
		</tr>
		</table>
	</form>
	<script>
		function move(val1,val2){
			location.href = val1 + '.jsp?name=' + val2;
		}
	
	</script>
</body>
</html>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h2>성적관리(수정)</h2>
	<form name="sujungForm">
		<table border="1">
		<tr>
			<td>이름 : </td> 
			<td><%=name %><input type="hidden" name="name" value="<%=name %>"></td>
		</tr>
		<tr>	
			<td>국어 : </td>
			<td><input type="text" name="kor" value="<%=tmp[1]%>"></td>
		<tr>
			<td>영어 : </td>
			<td><input type="text" name="eng" value="<%=tmp[2]%>"></td>
		</tr>
		<tr>
			<td>수학 : </td>
			<td><input type="text" name="mat" value="<%=tmp[3]%>"></td>
		</tr>
		<tr>
			<td>과학 : </td>
			<td><input type="text" name="scie" value="<%=tmp[4]%>"></td>
		</tr>
		<tr>
			<td>역사 : </td>
			<td><input type="text" name="his" value="<%=tmp[5]%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><button type="button" onclick="sujung();">수정하기</button>
		</tr>
		<tr>
			<td height="30px" colspan="7"  align="right">
				<a href="#" onclick="move('list','');">목록</a>
				|
				<a href="#" onclick="move('chuga','');">등록</a>
			</td>
		</tr>
		</table>
	</form>
	<script>
		function move(val1,val2){
			location.href = val1;
		}
		function sujung(){
			if(confirm('수정 하시겠습니까?')){
				var f = document.sujungForm
				f.action = "sujungProc.jsp";
				f.method = "post"
				f.submit();
			}
		}
	
	</script>
</body>
</html>
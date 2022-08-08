<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원목록</h2>
	<table border="1" align="center">
		<tr>
			<td>순번</td>
			<td>아이디</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>주소</td>
			<td>이메일</td>
			
		</tr>
		<%
		String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
		String uploadPath = attachPath + "/testFile/jspTest";
		String uploadFile = uploadPath + "/member.txt";
		ArrayList<String> list = new ArrayList<>();
		try{
			File f = new File(uploadFile);
			Scanner sReader = new Scanner(f);
			while(sReader.hasNextLine()){
				String date = sReader.nextLine();
				list.add(date);
			}
			sReader.close();
		}catch (Exception e){
			//e.printStackTrace();

		}
		int totalCounter= list.size();
		for(int i=0; i<list.size(); i++){
			String[] tmp = list.get(i).split(",");
			String mem = list.get(i);
		%>
		<tr>
			<td><%=totalCounter%></td>
			<td><a href="#" onclick="view('<%=mem%>');">
					<%=tmp[0]%>
			</a></td>
			<td><%=tmp[3]%></td>
			<td><%=tmp[4]%></td>
			<td><%=tmp[5]%></td>
			<td><%=tmp[6]%></td>
		</tr>
		<%
		totalCounter--;
		}
		%>
	<form name="viewProc">
	<input type="hidden" name="viewMember">
	</form>


	</table>
	<div width: 70%; margin-top : "10px;" align="center">
		| <a href="#" onclick="move('list.jsp','');">목록</a> | <a href="#"
			onclick="move('chuga.jsp','');">등록</a> |

	</div>

	<script>
		function move(value1, value2) {
			location.href = value1;
		}
		function view(value2){
			var f = document.viewProc;
			f.viewMember.value = value2;
			f.action = "view.jsp";
			f.method = "post";
			f.submit();
		}
	</script>
</body>
</html>
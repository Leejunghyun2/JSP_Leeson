<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = null; 
PreparedStatement pstmt= null;
ResultSet rs = null;
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<!-- header 시작 -->
		<%@ include file="../include/inc_menu.jsp" %>
		</tr>
		<!-- main 시작 -->
		<tr>
			<td height="300px" align="center">
				<h2>회원목록</h2>
				<form name=chugaForm>
					<table border="1">
						<tr>
							<td>순번</td>
							<td>아이디</td>
							<td>이름</td>
							<td>전화번호</td>
							<td>주소</td>
							<td>등록일</td>
						</tr>
						<tr>
							<td>1</td>
							<td>ljh</td>
							<td>홍길동</td>
							<td>01010101010</td>
							<td>ㅇㅇ</td>
							<td>2022-08-03</td>
						</tr>
						<tr>
							<td>2</td>
							<td>ljh</td>
							<td>홍길동</td>
							<td>01010101010</td>
							<td>ㅇㅇ</td>
							<td>2022-08-03</td>
						</tr>
						<tr>
							<td>3</td>
							<td>ljh</td>
							<td>홍길동</td>
							<td>01010101010</td>
							<td>ㅇㅇ</td>
							<td>2022-08-03</td>
						</tr>
						<tr>
							<td>4</td>
							<td>ljh</td>
							<td>홍길동</td>
							<td>01010101010</td>
							<td>ㅇㅇ</td>
							<td>2022-08-03</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center">
							<button type="button" onclick="move('chuga.jsp');">등록</button>
							</td>
						</tr>
					</table>
				<div margin-top :"10px;" align="right">
					 |
					 <a onclick="move('list.jsp');">목록</a>
					 |
					 <a onclick="move('chuga.jsp');">등록</a>
					 |
					 <a onclick="move('sujung.jsp');">수정</a>
					 |
					 <a onclick="move('sakje');">삭제</a>
					 |
					 
					</div>
				</form>
			</td>
		</tr>
		<!-- footer 시작 -->
		<tr>
			<td height="100px" align="center">
			<!-- include file="../include/inc_bottom.jsp" -->
			<%@ include file ="../include/inc_bottom.jsp" %>
			</td>
		</tr>

	</table>
  <script>
    function move(value1){
    	location.href = value1;
    }
  
  </script>

</body>
</html>
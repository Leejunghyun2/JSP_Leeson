
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
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
			<td height="100px" align="center">
		<%@ include file = "../include/inc_menu.jsp" %> <!-- 다른폴더에 있는걸 끌어와서 표시 -->
			</td>
		</tr>
		<!-- main 시작 -->
		<tr>
			<td height="300px" align="center">
				<h2>회원등록</h2>
				<form name=sakjeForm>
					<table border="1">
						<tr>
							<td>아이디 :</td>
							<td>hong</td>
						</tr>
						<tr>
							<td>비밀번호 :</td>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr>
							<td>이름 :</td>
							<td>홍길동</td>
						</tr>
						<tr>
							<td>전화번호 :</td>
							<td>010-111-1111</td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td>hong@gmail.com</td>
						</tr>
						<tr>
							<td>주소 :</td>
							<td>대구</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><button
									type="button" onclick="sujung();">수정하기</button></td>
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
					 <a onclick="move('sakje.jsp');">삭제</a>
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
 
    function sujung(){
    	 var f = document.sujungForm;
    	f.action = "sujungProc.jsp";
    	f.method = "post";
    	f.submit();
    }
  </script>

</body>
</html>
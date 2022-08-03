
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
				<form name=chugaForm>
					<table border="1">
						<tr>
							<td>아이디 :</td>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td>비밀번호 :</td>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr>
							<td>비밀번호확인 :</td>
							<td><input type="password" name="pw2"></td>
						</tr>			
			
						<tr>
							<td>이름 :</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>전화번호 :</td>
							<td><input type="tel" name="tel"></td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>주소 :</td>
							<td><input type="text" name="address"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><button
									type="button" onclick="join();">가입하기</button></td>
						</tr>
					</table>
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
    function join(){
/*     	
    	if(chuga.id.value == ""){
    		alert('아이디를 입력하세요.');
    		chuga.id.focus();
    		return;
    	} 
    	if(chuga.pw.value == ""){
    		alert('비밀번호를 입력하세요.');
    		chuga.id.focus();
    		return;
    	}
    	if(chuga.pw.value != chuga.pw2.value){
    		alert('비밀번호를 확인하세요. \n 확인 후 다시 입력하세요.');
    		chuga.id.focus();
    		return;
    	}
    	 */
    	 var chuga = document.chugaForm;
    	chuga.action = "chugaProc.jsp";
    	chuga.method = "post";
    	chuga.submit();
    }
  </script>

</body>
</html>
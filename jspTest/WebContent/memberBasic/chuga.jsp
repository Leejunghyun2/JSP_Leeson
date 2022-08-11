<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="80%" align="center">
		<tr>
			<td height="100px;" align="center">
				<jsp:include page="../include/inc_menu.jsp" flush="true"/>
			</td>
		</tr>
		<tr>
			<td height="300px;" align="center">
				<h2>회원등록</h2>
				<form name=chugaForm>
					<table border="1">
						<tr>
							<td>아이디 :</td>
							<td><input type="text" name="id"></td>
						</tr>
						<tr>
							<td>비밀번호 :</td>
							<td><input type="password" name="passwd"></td>
						</tr>
						<tr>
							<td>비밀번호확인 :</td>
							<td><input type="password" name="passwdChk"></td>
						</tr>			
			
						<tr>
							<td>이름 :</td>
							<td><input type="text" name="name"></td>
						</tr>
						<tr>
							<td>전화번호 :</td>
							<td><input type="tel" name="phone"></td>
						</tr>
						<tr>
							<td>이메일 :</td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>주민번호</td>
							<td>
							<input type="text" name="jumin1" style="width: 60px;">
							-
							<input type="text" name="jumin2" style="width: 60px;">
							</td>
						</tr>
						<tr>
							<td rowspan="3">주소 :</td>
							<td>
							<input type="text" name="juso1" id="sample6_postcode" placeholder="우편번호">
							<button type="button" onclick="sample6_execDaumPostcode();">우편번호 찾기</button>
							
							</td>
						</tr>
						<tr>
							<td><input type="text" name="juso2" id="sample6_address" placeholder="주소"></td>
						</tr>
						<tr>
							<td>
							<input type="text" name="juso3" id="sample6_detailAddress" placeholder="상세주소">
							<input type="text" name="juso4" id="sample6_extraAddress" placeholder="참고항목">
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<button type="button" onclick="chuga();">가입하기</button></td>
						</tr>
					</table>
					</form>
			</td>
		</tr>
		<tr>
			<td height="100px;" align="center">
			 	<jsp:include page="../include/inc_bottom.jsp" flush="true"/>
			</td>
		</tr>
	</table>
	<script>
	function chuga(){
		if(confirm('가입하시겠습니까?')){
			var f = document.chugaForm;
			f.action = "chugaProc.jsp";
			f.method = "post";
			f.submit();
		}
	}
	</script>
<jsp:include page="_inc_daumAPI.jsp" flush="true"/>
</body>
</html>
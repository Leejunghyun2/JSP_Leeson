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
		<tr>
			<td height="300px" align="center">
		<!-- 본문 시작 -->
			<h2>Test useBean</h2>
			<form name="form" method="post" action="chugaProcUseBean.jsp">
				<table border="1">
				 	<tr>
				 		<td>반장</td>
				 		<td>
				 			<input type="radio" name="boss_1" value="홍길동">홍길동 &nbsp;&nbsp;
				 			<input type="radio" name="boss_1" value="김철수">김철수 &nbsp;&nbsp;
				 			<input type="radio" name="boss_1" value="이영희">이영희 &nbsp;&nbsp;
				 	</tr>
				 	<tr>
				 		<td>부반장</td>
				 		<td>
				 			<input type="radio" name="boss_2" value="이승엽">이승엽 &nbsp;&nbsp;
				 			<input type="radio" name="boss_2" value="박찬호">박찬호 &nbsp;&nbsp;
				 			<input type="radio" name="boss_2" value="김병현">김병현 &nbsp;&nbsp;
				 	</tr>
				 	<tr>
				 		<td>회장</td>
				 		<td>
				 			<input type="radio" name="boss_3" value="이문세">이문세 &nbsp;&nbsp;
				 			<input type="radio" name="boss_3" value="안성기">안성기 &nbsp;&nbsp;
				 			<input type="radio" name="boss_3" value="이연복">이연복 &nbsp;&nbsp;
				 	</tr>
				</table>
				<button type="submit">확인</button>
			</form>
		<!-- 본문 종료 -->
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

</body>
</html>
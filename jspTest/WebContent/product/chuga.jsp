
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
				<h2>상품등록</h2>
				<form name=chugaForm>
					<table border="1">
						<tr>
							<td>상품이름 :</td>
							<td><input type="text" name="productName"></td>
						</tr>
						<tr>
							<td>상품가격 :</td>
							<td><input type="text" name="productPrice"></td>
						</tr>
						<tr>
							<td>상품설명 :</td>
							<td><input type="text" name="productContent"></td>
						</tr>			
			
						<tr>
							<td>상품종류 :</td>
							<td><input type="text" name="productCategory"></td>
						</tr>
						<tr>
							<td>상품회사 :</td>
							<td><input type="text" name="vendor"></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center"><button
									type="button" onclick="join();">등록하기</button></td>
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
    	 var chuga = document.chugaForm;
    	chuga.action = "chugaProc.jsp";
    	chuga.method = "post";
    	chuga.submit();
    }
  </script>

</body>
</html>
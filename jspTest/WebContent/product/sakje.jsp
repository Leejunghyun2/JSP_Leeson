
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/inc_dbInfo.jsp" %>
<%
  	request.setCharacterEncoding("UTF-8");
	
	String productName = request.getParameter("productName");
	String productCode = "";
 	if(productName == null || productName.trim().equals("")){
 		response.sendRedirect("list.jsp");
 	} 
	//response.sendRedirect("list.jsp");//jsp로 바로 넘길때
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg ="";
	
	try{
		
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
		System.out.print("\n db 접속성공");
		//---------------------------------------
		String sql = "select * from product where productName = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productName);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String productPrice = rs.getString("productPrice");
			String productContent = rs.getString("productContent");
			String productCategory = rs.getString("productCategory");
			String vendor = rs.getString("vendor");
			String regiDate = rs.getString("regiDate");
			productCode = rs.getString("productCode");
			msg = productName +"/"+ productPrice +"/"+ productContent +"/"+ productCategory +"/"+ vendor +"/"+ regiDate;
		}
		
		//---------------------------------------
	}catch(Exception e){
		System.out.print("db 접속실패");
	}finally{
	   if(rs !=null){rs.close();}
	   if(pstmt !=null){pstmt.close();}
	   if(conn !=null){conn.close();}
	   System.out.print("db 접속해제");
	}
	out.print("end");
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
			<td height="100px" align="center">
		<%@ include file = "../include/inc_menu.jsp" %> <!-- 다른폴더에 있는걸 끌어와서 표시 -->
			</td>
		</tr>
		<!-- main 시작 -->
		<tr>
			<td height="300px" align="center">
				<h2>삭제하기</h2>
				<form name=sakjeForm>
					<%String[] tmp = msg.split("/"); %>
					<table border="1">
						<tr>
							<td>상품이름 :</td>
							<td><%=tmp[0] %></td>
						</tr>
						<tr>
							<td>상품가격 :</td>
							<td><%=tmp[1] %></td>
						</tr>
						<tr>
							<td>상품설명 :</td>
							<td><%=tmp[2] %></td>
						</tr>
						<tr>
							<td>상품종류 :</td>
							<td><%=tmp[3] %></td>
						</tr>
						<tr>
							<td>상품회사 :</td>
							<td><%=tmp[4] %></td>
						</tr>
						<tr>
							<td>등록일 :</td>
							<td><%=tmp[5] %></td>
						</tr>
						<tr>
							<td><button type="button" onclick="sakje(<%=productCode %>);">삭제하기</button></td>
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
    function sakje(value1){
		location.href = "sakjeProc.jsp?productCode="+value1;
    }
  </script>

</body>
</html>
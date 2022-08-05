
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../include/inc_dbInfo.jsp" %>
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg ="";
	ArrayList<String> list = new ArrayList<>();
	try{
		
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
		System.out.print("\n db 접속성공");
		//---------------------------------------
		String sql = "select * from product";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			String productCode = rs.getString("productCode");
			String productName = rs.getString("productName");
			String productPrice = rs.getString("productPrice");
			String productContent = rs.getString("productContent");
			String productCategory = rs.getString("productCategory");
			String vendor = rs.getString("vendor");
			Date date = rs.getDate("regiDate");
			msg = productCode +"/"+ productName +"/"+ productPrice +"/"+productCategory+"/"+ vendor;
			list.add(msg);
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
				<h2>상품목록</h2>
					<table border="1">
						<tr>
							<td>상품코드 :</td>
							<td>상품이름 :</td>
							<td>상품가격 :</td>
							<td>상품종류 :</td>
							<td>상품회사 :</td>
						<tr>
						<%
							for (int i=0; i<list.size();i++){ 
								String[] tmp = list.get(i).split("/");
						%>
								<tr>
									<td><%=tmp[0] %></td>
									<td><a href="#" onclick="join(<%=tmp[0] %>);"><%=tmp[1] %></a></td>
									<td><%=tmp[2] %></td>
									<td><%=tmp[3] %></td>
									<td><%=tmp[4] %></td>
								</tr>
						<%} %>					
					</table>
					<div width: 70%; margin-top : "10px;" align="center">
						|
						<a href="#" onclick="move('list.jsp');">목록</a> 
						| 
						<a href="#" onclick="move('chuga.jsp');">등록</a> 
						|

					</div>
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
    function join(value1){
    	location.href = "view.jsp?productCode="+value1;
    }
  </script>

</body>
</html>
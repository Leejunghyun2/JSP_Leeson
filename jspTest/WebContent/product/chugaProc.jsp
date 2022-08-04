<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_dbInfo.jsp" %>	   
<%
  	request.setCharacterEncoding("UTF-8");
	
	String productCode = request.getParameter("productCode");
	String productName = request.getParameter("productName");
	String productPrice_ = request.getParameter("productPrice");
	String productContent = request.getParameter("productContent");
	String productCategory = request.getParameter("productCategory");
	String vendor = request.getParameter("vendor");
	String regiDate = request.getParameter("regiDate");
	int productPrice = Integer.parseInt(productPrice_);
	
	if(productName == null || productName.equals("")){
		
%>
 	<script>
 	    function move(){
 	    	alert("d");
 	    	history.back();
 	    	//history.go(-1);
 	    }
 	    move();
 	</script>
 	
<%
	}
	//response.sendRedirect("list.jsp");//jsp로 바로 넘길때
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	try{
	
		
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
		System.out.print("\n db 접속성공");
		//---------------------------------------
		String sql = "insert into product(productCode, productName, productPrice, productContent,productCategory,vendor,regiDate)" + 
					 " values(seq_product.nextval,?,?,?,?,?,sysdate)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productName);
		pstmt.setInt(2, productPrice);
		pstmt.setString(3, productContent);
		pstmt.setString(4, productCategory);
		pstmt.setString(5, vendor);
		result = pstmt.executeUpdate();
		if(result > 0){
			System.out.println("\n== INSERT Success ==");
			response.sendRedirect("list.jsp");//jsp로 바로 넘길때
		}else{
			System.out.println("\n== INSERT Fail ==");
			out.print("<script>");
			out.print("alert('추가 처리 중 오류가 발생했습니다.')");
			out.print("location.href = 'chugo.jsp';");
			out.print("</script>");
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
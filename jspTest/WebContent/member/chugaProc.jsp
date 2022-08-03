<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone = request.getParameter("tel");
	String email = request.getParameter("email");
	String addr = request.getParameter("address");
	if(id == null || id.equals("")){
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
	try{
		String dbDriver ="oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "javaOracleDB";
		String dbPw = "1234";
		
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
		System.out.print("db 접속성공");
		
	}catch(Exception e){
		System.out.print("db 접속실패");
		
	}finally{
	   if(rs !=null){rs.close();}
	   if(pstmt !=null){pstmt.close();}
	   if(conn !=null){conn.close();}
	}
	out.print("end");
%>
    
    
    
    
    
    
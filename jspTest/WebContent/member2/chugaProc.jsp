<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/inc_dbInfo.jsp" %>	
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
String pw2 = request.getParameter("pw2");
String name = request.getParameter("name");
String phone = request.getParameter("tel");
String email = request.getParameter("email");
String address = request.getParameter("address");

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
		int result = 0;
		try{
		
			
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbUrl,dbId,dbPw);
			System.out.print("\n db 접속성공");
			//---------------------------------------
			String sql = "insert into member(id, passwd, name, phone, email, address, regidate)" + 
						 " values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, address);
			result = pstmt.executeUpdate();
			if(result > 0){
				System.out.println("\n== INSERT Success ==");
				out.print("<script>");
				out.print("location.href = 'main.jsp?menuGubun=member2_list'");
				out.print("</script>");
			}else{
				System.out.println("\n== INSERT Fail ==");
				out.print("<script>");
				out.print("alert('추가 처리 중 오류가 발생했습니다.')");
				out.print("location.href = 'main.jsp?menugubun=member2_chuga';");
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
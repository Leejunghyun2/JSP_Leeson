
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String arg1 = request.getParameter("arg1");
if (arg1 == null || arg1.trim().equals("")) {
	response.sendRedirect("list.jsp");
}
//response.sendRedirect("list.jsp");//jsp로 바로 넘길때
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String msg = "";
try {
	String dbDriver = "oracle.jdbc.driver.OracleDriver";
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbId = "jspTest";
	String dbPw = "1234";

	Class.forName(dbDriver);
	conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	System.out.print("\n db 접속성공");
	//---------------------------------------
	//---------------------------------------
	String sql = "select * from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, arg1);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		String id = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String email = rs.getString("email");
		String addr = rs.getString("address");
		Date date = rs.getDate("regidate");
		msg = id + "/" + name + "/" + phone + "/" + email + "/" + addr + "/" + date + "/" + passwd;
	}

	//---------------------------------------
} catch (Exception e) {
	System.out.print("db 접속실패");
} finally {
	if (rs != null) {
		rs.close();
	}
	if (pstmt != null) {
		pstmt.close();
	}
	if (conn != null) {
		conn.close();
	}
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
	<h2>회원등록</h2>
	<form name=sujungForm>
		<%
		String[] tmp = msg.split("/");
		%>
		<table border="1">
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="arg1" value=<%=tmp[0]%> readonly></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><%=tmp[1]%></td>
			</tr>
			<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="tel" value=<%=tmp[2]%>></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><input type="text" name="email" value=<%=tmp[3]%>></td>
			</tr>
			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address" value=<%=tmp[4]%>></td>
			</tr>
			<tr>
				<td><button type="button" onclick="sujung();">수정하기</button></td>
			</tr>

		</table>
	</form>

	<script>
		function move(value1) {
			location.href = value1;
		}

		function sujung() {
			var f = document.sujungForm;
			f.action = "main.jsp?menuGubun=member2_sujungProc";
			f.method = "post";
			f.submit();
		}
	</script>

</body>
</html>
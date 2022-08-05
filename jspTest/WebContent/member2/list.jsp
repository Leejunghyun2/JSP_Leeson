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
int result = 0;
ArrayList<String> list = new ArrayList<>();
try {

	Class.forName(dbDriver);
	conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	System.out.print("\n db 접속성공");
	//---------------------------------------
	String sql = "select * from member order by regidate desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String email = rs.getString("email");
		String addr = rs.getString("address");
		Date date = rs.getDate("regidate");
		String msg = "";
		msg = id + "/"+passwd+ "/"+name+ "/"+phone+ "/"+email+ "/"+addr+ "/"+date;
		list.add(msg);
	}
	
	
	if (result > 0) {
		System.out.println("\n== SELECT Success ==");
	} else {
		System.out.println("\n== SELECT Fail ==");
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
%>



				<h2>회원목록</h2>
					<table border="1" align="center">
						<tr>
						    <td>순번</td>
							<td>아이디</td>
							<td>이름</td>
							<td>전화번호</td>
							<td>주소</td>
							<td>등록일</td>
						</tr>
					    <% 
					    int totalCounter = list.size();
					    for(int i=0; i<list.size(); i++){
					        String[] tmp = list.get(i).split("/");%>
					    <tr>
					      <td><%=totalCounter %></td>
					      <td><a href="#" onclick="move('member2_view','<%=tmp[0]%>');"> <%=tmp[0] %> </a></td>
					      <td><%=tmp[2] %></td>
					      <td><%=tmp[3] %></td>
					      <td><%=tmp[5] %></td>
					      <td><%=tmp[6] %></td>
					    </tr>
					    <%
					    totalCounter--;
					    } 
					    %>
					        
					    
					    
					</table>
					<div width: 70%; margin-top : "10px;" align="center">
						|
						<a href="#" onclick="move('member2_list','');">목록</a> 
						| 
						<a href="#" onclick="move('member2_chuga','');">등록</a> 
						|

					</div>
		
	<script>
		function move(value1, value2) {
			location.href = "main.jsp?menuGubun="+value1+"&id="+value2;
		}
	</script>

</body>
</html>
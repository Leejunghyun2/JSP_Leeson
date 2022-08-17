<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%
	HaksaMemberDAO dao = new HaksaMemberDAO();
	ArrayList<HaksaMemberDTO> list = dao.getSelectAll();
	
	int totalCount = list.size();
%>
<table border="1" width="80%" align="center">
		<tr>
			<td>순번</td>
			<td>학번</td>
			<td>이름</td>
			<td>연락처</td>
			<td>주소</td>
			<td>등록일</td>
		</tr>
		 
		<%
		for(int i=0; i < list.size(); i++){
			HaksaMemberDTO dto = list.get(i);
			String addr = dto.getAddr1() + " ";
			addr += dto.getAddr2() + " ";
			addr += dto.getAddr3() + " ";
			addr += dto.getAddr4() + " ";
		%>
		<tr>
			<td><%=totalCount-- %></td>
			<td><%=dto.getHakbun() %></td>
			<td><a href="#" onclick="move('view.jsp','<%=dto.getHakbun()%>');"><%=dto.getName() %></a></td>
			<td><%=dto.getPhone() %></td>
			<td><%=addr %></td>
			<td><%=dto.getRegiDate() %></td>
	
			
		</tr>
		<%
		}
		%>
	</table>
		|
	 	<a href="#" onclick="move('chuga.jsp','')">등록</a>
	 	|
	 	<a href="#" onclick="move('list.jsp','')">목록</a>
	 	|
	<script>
		function move(val1, val2){
			location.href = val1 + "?hakbun=" +val2;
		} 	
		 	
 	</script>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HaksaSihumDAO dao = new HaksaSihumDAO();
	ArrayList<HaksaSihumDTO> list = dao.getSelectAll();
	
	int totalCount = list.size();
%>
<table border="1" width="80%" align="center">
		<tr>
			<td>순번</td>
			<td>시험번호</td>
			<td>시험이름</td>
			<td>시험날짜</td>
			<td>등록일</td>
			<td>비고</td>
		</tr>
		 
		<%
		for(int i=0; i < list.size(); i++){
			HaksaSihumDTO dto = list.get(i);
		
		%>
		<tr>
			<td><%=totalCount-- %></td>
			<td><%=dto.getSihumNo() %></td>
			<td><%=dto.getSihumName() %></td>
			<td><%=dto.getSihumDate() %></td>
			<td><%=dto.getRegiDate() %></td>
			<td>
			<a href="#" onclick="move('sujung.jsp','<%=dto.getSihumNo()%>');">[수정]</a> 
			<a href="#" onclick="move('sakje.jsp','<%=dto.getSihumNo()%>');">[삭제]</a>
			</td>
			
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
			location.href = val1 + "?sihumNo=" +val2;
		} 	
		 	
 	</script>
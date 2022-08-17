<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	<%
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	ArrayList<HaksaSungjukDTO> list = dao.getSelectAll();
	
	int totalCount = list.size();
%>
<table border="1" width="80%" align="center">
		<tr>
			<td>순번</td>
			<td>학번</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>과학</td>
			<td>역사</td>
			<td>평균</td>
			<td>등급</td>
		</tr>
		 
		<%
		for(int i=0; i < list.size(); i++){
			HaksaSungjukDTO dto = list.get(i);
		%>
		<tr>
			<td><%=totalCount-- %></td>
			<td><a href="#" onclick="move('view.jsp','<%=dto.getSungjukNo()%>');"><%=dto.getHakbun() %></a></td>
			<td><%=dto.getKor() %></td>
			<td><%=dto.getEng() %></td>
			<td><%=dto.getMat() %></td>
			<td><%=dto.getSci() %></td>
			<td><%=dto.getHis() %></td>
			<td><%=dto.getAvg() %></td>
			<td><%=dto.getGrade() %></td>
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
			location.href = val1 + "?sungjukNo=" +val2;
		} 	
		 	
 	</script>
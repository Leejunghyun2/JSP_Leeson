<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	HaksaMemberDTO dto = new HaksaMemberDTO();
	dto.setHakbun(hakbun);
	HaksaMemberDAO dao = new HaksaMemberDAO();
	dto = dao.getSelectOne(dto);	
	String addr = dto.getAddr1() + " ";
	addr += dto.getAddr2() + " ";
	addr += dto.getAddr3() + " ";
	addr += dto.getAddr4() + " ";
%>
<table border="1" width="80%" align="center">
	
		<tr>
			<td>학번</td>
			<td><%=hakbun%></td>
		</tr>
		<tr>	
			<td>이름</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>	
			<td>연락처</td>
			<td><%=dto.getPhone() %></td>
		</tr>
		<tr>
			<td>부모연락처</td>
			<td><%=dto.getParentPhone() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=addr %></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=dto.getRegiDate() %></td>
		</tr>
			
	
	</table>
		|
	 	<a href="#" onclick="move('sujung.jsp','<%=hakbun%>')">수정</a>
	 	|
	 	<a href="#" onclick="move('sakje.jsp','<%=hakbun%>')">삭제</a>
	 	|
	 	<a href="#" onclick="move('list.jsp','')">목록</a>
	 	|
	<script>
		function move(val1, val2){
			location.href = val1 + "?hakbun=" +val2;
		} 	
		 	
 	</script>
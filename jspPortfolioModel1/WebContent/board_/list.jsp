<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<% 
 	dao = new BoardDAO(); 
	ArrayList<BoardDTO> list = dao.getSelectAll();
%>
<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		
		<th>refNo</th>
		<th>stepNo</th>
		<th>levelNo</th>
		<th>parentNo</th>
		
		<th>memberNo</th>
		<th>ip</th>
		<th>공지글</th>
		<th>비밀글</th>
	</tr>

	<%
		for(int i=0; i<list.size(); i++){
			BoardDTO dto = list.get(i);
	%>
	<tr>
		<td><%=dto.getNo() %></td>
		<td>
			<%	
				String subject = dto.getSubject();
				String blankValue = "";
				for(int j=2; j <= dto.getStepNo(); j++){
					blankValue += "&nbsp;&nbsp;";
				}
				if(dto.getStepNo() > 1){
					blankValue += "└[Re]:";
				}
				if(dto.getSubject().length() > 5){
					subject = dto.getSubject().substring(0,6)+"...";
				}
			%>
			<%=blankValue%><a href="#" onclick="move('board_view','<%=dto.getNo()%>');"><%=subject %></a>
		</td>
		<td><%=dto.getWriter() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td><%=dto.getHit() %></td>
		
		<td><%=dto.getRefNo() %></td>
		<td><%=dto.getStepNo() %></td>
		<td><%=dto.getLevelNo() %></td>
		<td><%=dto.getParentNo() %></td>
		
		<td><%=dto.getMemberNo() %></td>
		<td><%=dto.getIp() %></td>
		<td><%=dto.getNoticeNo() %></td>
		<td><%=dto.getSecretGubun() %></td>
	</tr>
	<%
		}	
	%>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('board_list','');">목록</a>
		|
		<a href="#" onclick="move('board_chuga','');">등록</a>
		|
</div>
<script>
		function move(val1, val2){
			location.href = "main.jsp?menuGubun="+val1+"&no="+val2;
		}
		
</script>







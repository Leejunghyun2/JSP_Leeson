<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="_inc_top.jsp" %>

<%
	SubBoardDAO dao = new SubBoardDAO();
	ArrayList<SubBoardDTO> list = dao.getselectAll();
%>

<h2>게시글 목록</h2>
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
		if(list == null || list.size() <= 0) {
		%> 
			<tr>
				<td colspan="13" height="200px" align="center">
					등록된 내용이 없습니다.
				</td>
			</tr>
		<%
		} 
		for(int i=0; i<list.size(); i++){
			SubBoardDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td><a href="#" onclick="move('subBoard_view' , '<%=dto.getNo()%>');"><%=dto.getSubject() %></a></td>
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
		<a href="#" onclick="move('subBoard_list','');">목록</a>
		|
		<a href="#" onclick="move('subBoard_chuga','');">등록</a>
		|
</div>

<script>
	function move(val1, val2){
		location.href = 'main.jsp?menuGubun='+ val1 +"&no=" + val2;
	}
</script>
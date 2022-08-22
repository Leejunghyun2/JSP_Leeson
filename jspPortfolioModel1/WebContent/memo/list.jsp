<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemoDAO dao = new MemoDAO();
ArrayList<MemoDTO> list = dao.getSelectAll();
int totalCounter = list.size();
int pageCount = 1;
%>
<h2>메모내용</h2>
<form name="chugaForm">
	<fieldset>
		작성자 : <input type="text" name="writer" id="writer"> 
		내용 : <textarea name="content" id="content"></textarea>
		<button type="button" onclick="join();" id="btnSave" >등록하기</button>
	</fieldset>
</form>
<table border="1" align="center" width="80%">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th width="300px">메모내용</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<%
	for (int i = 0; i < list.size(); i++) {
		MemoDTO dto = list.get(i);
	%>
	<tr>

		<td><%=totalCounter--%></td>
		<td><a href="#" onclick="move('memo_view','<%=dto.getNo()%>');"><%=dto.getWriter()%></a></td>
		<td><%=dto.getContent()%></td>
		<td><%=dto.getRegiDate()%></td>
		<td>
			<input type="hidden" id="no_<%=dto.getNo() %>" value="<%=dto.getNo() %>">
			<input type="hidden" id="writer_<%=dto.getNo() %>" value="<%=dto.getWriter() %>">
			<input type="hidden" id="content_<%=dto.getNo() %>" value="<%=dto.getContent() %>">
			<a href="#" onclick="suntaek('<%=dto.getNo() %>');">[수정]</a>
			<a href="#" onclick="suntaek('<%=dto.getNo() %>');">[삭제]</a>
		</td>
		
	</tr>
	<%
	}
	%>

</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%"; align="right">
	| <a href="#" onclick="move('memo_list','');">목록</a> | <a href="#"
		onclick="move('memo_chuga','');">등록</a> |
</div>

<script>
	function suntaek(val1){
		var jsWriter = $("#writer_" + val1).val();
		var jsContent = $("#content_" + val1).val();
		$("#writer").val(jsWriter);
		$("#content").val(jsContent);
	}
	
</script>
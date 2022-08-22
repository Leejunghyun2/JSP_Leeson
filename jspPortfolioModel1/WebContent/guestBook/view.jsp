<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String no_ = request.getParameter("no");

if(no_ == null || no_.equals("")){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.')");
	out.println("location.href = 'main.jsp?menuGubun=memo_list';");
	out.println("</script>");
}

int no = Integer.parseInt(no_);
MemoDTO dto = new MemoDTO();
dto.setNo(no);

MemoDAO dao = new MemoDAO();
dto = dao.getSelectOne(dto);
%>
<h2>메모상세보기</h2>
<form name="chugaForm">
	<table border="1" align="center">
		<tr>
			<td>작성자 :</td>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=dto.getContent() %></td>
		</tr>
		<tr>
			<td>등록일 :</td>
			<td><%=dto.getRegiDate() %></td>
		</tr>
	</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%"; align="right">
		|
		<a href="#" onclick="move('memo_list','');">목록</a>
		|
		<a href="#" onclick="move('memo_chuga','');">등록</a>
		|
		<a href="#" onclick="move('memo_sujung','<%=dto.getNo()%>');">수정</a>
		|
		<a href="#" onclick="move('memo_sakje','<%=dto.getNo()%>');">삭제</a>
		|
	</div>
</form>
<script>
	function move(val1, val2) {
		location.href = "main.jsp?menuGubun=" +val1+"&no=" + val2;
	}
</script>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String no_ = request.getParameter("no");
int no = Integer.parseInt(no_);
MemoDTO dto = new MemoDTO();
dto.setNo(no);

MemoDAO dao = new MemoDAO();
dto = dao.getSelectOne(dto);
%>   
<h2>메모삭제</h2>
	<form name="sakjeForm">
	<input type="hidden" name="no" value="<%=dto.getNo() %>">
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
		<tr>
			<td colspan="2"><button type="button" onclick="sakje();">삭제하기</button>
		</tr>
	</table>
	</form>
<script>
	function sakje(){
		if(confirm('삭제 하시겠습니까?')){
			var f = document.sakjeForm
			f.action = "mainProc.jsp?menuGubun=memo_sakjeProc"
			f.method = "post"
			f.submit();
			
		}
	}
</script>
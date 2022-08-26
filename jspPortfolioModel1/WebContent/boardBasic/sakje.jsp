<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
 	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BoardBasicDTO dto = new BoardBasicDTO();
	dto.setNo(no);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	dto = dao.getSelectOne(dto);
%>
<h2>메모등록</h2>
	<form name="sakjeForm">
	<input type="hidden" name="no" value="<%= no %>">
	<table border="1" align="center">
		<tr>
			<td>작성자 :</td>
			<td><%=dto.getWriter()%></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=dto.getContent().replace("\n", "<br>") %></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="sakje();">삭제하기</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.sakjeForm
		function sakje(){
			if(confirm('삭제 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=boardBasic_sakjeProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
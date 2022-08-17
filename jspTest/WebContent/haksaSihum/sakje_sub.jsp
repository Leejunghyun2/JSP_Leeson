<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	HaksaSihumDTO dto = new HaksaSihumDTO();
	dto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	dto = dao.getSelectOne(dto); 
	
%>
<form name="sakjeForm">
<input type="hidden" name="sihumNo" value="<%=dto.getSihumNo() %>">
<table border="1" width="80%" align="center">
	
	<tr>
		<td>시험이름</td>
		<td><%=dto.getSihumName()%></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><%=dto.getSihumDate()%></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><button type="button" onclick="sakje();">삭제하기</button></td>	 	
	</tr>
</table>
</form>
<script>
	function sakje(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.sakjeForm
			f.action = "sakjeProc.jsp";
			f.method = "post";
			f.submit();
		}
	}

</script>


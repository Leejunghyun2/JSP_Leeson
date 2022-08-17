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
<form name="sujungForm">
<input type="hidden" name="sihumNo" value="<%=dto.getSihumNo() %>">
<table border="1" width="80%" align="center">
	
	<tr>
		<td>시험이름</td>
		<td><input type="text" name="sihumName" value="<%=dto.getSihumName()%>"></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><input type="date" name="sihumDate" value="<%=dto.getSihumDate()%>"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><button type="button" onclick="sujung();">수정하기</button></td>	 	
	</tr>
</table>
</form>
<script>
	function sujung(){
		if(confirm('수정하시겠습니까?')){
			var f = document.sujungForm
			f.action = "sujungProc.jsp";
			f.method = "post";
			f.submit();
		}
	}

</script>


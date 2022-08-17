<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	HaksaSungjukDTO dto = new HaksaSungjukDTO();
	dto.setSungjukNo(sungjukNo);
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	dto = dao.getSelectOne(dto);	
%>
<form name="sujungForm">
<input type="hidden" name="sungjukNo" value="<%=sungjukNo %>">
<table border="1" align="center">
		<tr>
			<td>학번</td>
			<td><%=dto.getHakbun()%></td>
		</tr>
		<tr>
			<td>시험번호</td>
			<td><%=dto.getSihumNo() %></td>
		</tr>
		<tr>	
			<td>국어</td>
			<td><input type="text" name="kor" value="<%=dto.getKor() %>"></td>
			
		</tr>
		<tr>	
			<td>영어</td>
			<td><input type="text" name="eng" value="<%=dto.getEng() %>"></td>
		</tr>
		<tr>
			<td>수학</td>
			<td><input type="text" name="mat" value="<%=dto.getMat() %>"></td>
		</tr>
		<tr>
			<td>과학</td>
			<td><input type="text" name="sci" value="<%=dto.getSci() %>"></td>
		</tr>
		<tr>
			<td>역사</td>
			<td><input type="text" name="his" value="<%=dto.getHis() %>"></td>
		</tr>
		<tr>
			<td>총점</td>
			<td><%=dto.getTot() %></td>
		</tr>
		<tr>
			<td>평균</td>
			<td><%=dto.getAvg() %></td>
		</tr>
		<tr>
			<td>등급</td>
			<td><%=dto.getGrade() %></td>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=dto.getRegiDate() %></td>
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
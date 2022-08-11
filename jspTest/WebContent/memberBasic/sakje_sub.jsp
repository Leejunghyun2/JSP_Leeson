<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	
	int failCounter = 0;
	if (no_ == null || no_.equals("")) {
		failCounter++;
	}
	int no = 0;
	try {
		no = Integer.parseInt(no_);
	} catch (Exception e) {
		no = 0;
	}
	
	if (failCounter > 0) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}
	MemberBasicDTO dto = new MemberBasicDTO();
	dto.setNo(no);
	MemberBasicDAO dao = new MemberBasicDAO();
	dto = dao.getSelectOne(dto);
%>
<form name=sakjeForm>
<input type="hidden" name="no" value=<%=dto.getNo()%>>
	<table border="1">
		<tr>
			<td>아이디 :</td>
			<td><%=dto.getId()%></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>이름 :</td>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<td>전화번호 :</td>
			<td><%=dto.getPhone()%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td><%=dto.getJumin()%></td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td><%=dto.getJuso1()%> <%=dto.getJuso2()%> <%=dto.getJuso3()%> <%=dto.getJuso4()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sakje();">삭제하기</button>
			</td>
		</tr>
	</table>
	</form>
	<script>
		function sakje() {
			if (confirm('삭제하시겠습니까?')) {
				var f = document.sakjeForm;
				f.action = "sakjeProc.jsp";
				f.method = "post";
				f.submit();
			}
		}
	</script>

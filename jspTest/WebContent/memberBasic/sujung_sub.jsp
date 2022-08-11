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
<form name=sujungForm>
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
			<td><input type="tel" name="phone" value="<%=dto.getPhone()%>"></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="email" name="email" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td><%=dto.getJumin()%></td>
		</tr>
		<tr>
			<td rowspan="3">주소 :</td>
			<td><input type="text" name="juso1" id="sample6_postcode"
				placeholder="우편번호" value="<%=dto.getJuso1()%>">
				<button type="button" onclick="sample6_execDaumPostcode();">우편번호
					찾기</button></td>
		</tr>
		<tr>
			<td><input type="text" name="juso2" id="sample6_address"
				placeholder="주소" value="<%=dto.getJuso2()%>"></td>
		</tr>
		<tr>
			<td><input type="text" name="juso3" id="sample6_detailAddress"
				placeholder="상세주소" value="<%=dto.getJuso3()%>"> 
				<input type="text" name="juso4"
				id="sample6_extraAddress" placeholder="참고항목" value="<%=dto.getJuso4()%>"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sujung();">수정하기</button>
			</td>
		</tr>
	</table>
	</form>
	<script>
		function sujung() {
			if (confirm('수정하시겠습니까?')) {
				var f = document.sujungForm;
				f.action = "sujungProc.jsp";
				f.method = "post";
				f.submit();
			}
		}
	</script>

<jsp:include page="_inc_daumAPI.jsp" flush="true"/>
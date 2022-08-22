<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
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
    GuestBookDTO dto = new GuestBookDTO();
    dto.setNo(no);
    
    GuestBookDAO dao = new GuestBookDAO();
    dto = dao.getSelectOne(dto);
    
    %>
<h2>메모등록</h2>
	<form name="sujungForm">
	<input type="hidden" name="no" value="<%=dto.getNo() %>">
	<table border="1" align="center">
		<tr>
			<td>작성자 :</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="text" name="email" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea  rows="10" name="content"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="sujung();">수정하기</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.sujungForm
		function sujung(){
			if(confirm('수정 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=guestBook_sujungProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
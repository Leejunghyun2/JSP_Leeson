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
	<form name="sakjeForm">
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
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=dto.getContent()%></td>
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
				f.action = "mainProc.jsp?menuGubun=guestBook_sakjeProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
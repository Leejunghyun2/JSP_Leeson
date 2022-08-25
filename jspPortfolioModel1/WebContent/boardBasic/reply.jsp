<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<%@ include file="_inc_top.jsp" %>
<%
String no_ = request.getParameter("no");
if(no_ == null || no_.equals("")){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.')");
	out.println("location.href = 'main.jsp?menuGubun=boardBasic_list';");
	out.println("</script>");
}

int no = Integer.parseInt(no_);
BoardBasicDTO dto = new BoardBasicDTO();
dto.setNo(no);
BoardBasicDAO dao = new BoardBasicDAO();
dao.setUpdateHit(dto);
dto = dao.getSelectOne(dto);  

%>
<h2>답변글등록</h2>
	<form name="replyForm">
	<input type="hidden" name="no" value=<%=no %>>
	<table border="1" align="center" style="margin-bottom: 50px">
		<tr>
			<td>작성자 :</td>
			<td width="300"><input type="text" name="writer" value="<%=sessionName%>"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><input type="text" name="subject" value="<%=dto.getSubject()%>"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea   style="width: 300px; height: 180px;" name="content">[원글]<%=dto.getContent()%>
--------------------------------
[답글]</textarea></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="join();">등록하기</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.replyForm
		function join(){
			if(confirm('등록 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=boardBasic_replyProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
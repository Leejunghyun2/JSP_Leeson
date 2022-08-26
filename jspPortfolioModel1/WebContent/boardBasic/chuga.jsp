<%@page import="config.Util"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	Util util = new Util();
	
	String no_ = request.getParameter("no");
	no_ = util.getNullBlankCheck(no_, "0");
	int no = Integer.parseInt(no_);
	
 	String imsiTitle = "";
 	String subject ="";
 	String content ="";
	if(no <= 0){
		imsiTitle = "게시글등록";
	} else {
		imsiTitle = "답변글등록";
		BoardBasicDTO dto = new BoardBasicDTO();
		dto.setNo(no);
		BoardBasicDAO dao = new BoardBasicDAO();
		dto = dao.getSelectOne(dto);
		subject = dto.getSubject();
		content = dto.getContent();
	}
%>
<h2><%=imsiTitle %></h2>
	<form name="chugaForm">
	<input type="hidden" name="no" value="<%=no %>">
	<table border="1" align="center" style="margin-bottom: 50px">
		<tr>
			<td>작성자 :</td>
			<td width="300"><input type="text" name="writer" value="<%=sessionName%>"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><input type="text" name="subject" value="<%=subject%>"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea   style="width: 300px; height: 180px;" name="content"><%=content %></textarea></td>
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
		var f = document.chugaForm
		function join(){
			if(confirm('등록 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=boardBasic_chugaProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
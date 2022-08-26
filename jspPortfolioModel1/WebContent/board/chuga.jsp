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
			<td width="300"><input type="text" name="writer" id="writer"></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="text" name="email" id="email"></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><input type="text" name="subject" id="subject" value="<%=subject%>"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea   style="width: 300px; height: 180px;" name="content"><%=content %></textarea></td>
		</tr>
		<tr>
			<td>공지글</td>
			<td>
				<input type="radio" name="noticeGubun" id="noticeGubun1" value="T">공지글 &nbsp;
				<input type="radio" name="noticeGubun" id="noticeGubun2" value="F" checked>공지글아님 &nbsp;
			</td>
		</tr>
		<tr>
		<tr>
			<td>비밀글</td>
			<td>
				<input type="radio" name="secretGubun" id="secretGubun1" value="T">비밀글 &nbsp;
				<input type="radio" name="secretGubun" id="secretGubun2" value="F" checked>비밀글아님 &nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" onclick="save();">저장하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=board_list';">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function save(){
		if(confirm('등록할까요?');){
			var f = document.chugaForm
			f.action="mainProc.jsp?menuGubun=board_chugaProc";
			f.method="post";
			f.submit();
		}
	}
</script>
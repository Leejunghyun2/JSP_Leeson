<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<h2>게시글삭제</h2>
<form name="sakjeForm">
	<input type="hidden" name="no" id="no" value="<%=resultDto.getNo()%>">
	<input type="text" name="noticeNo" value="<%=resultDto.getNoticeNo() %>"><br>
	<table border="1" align="center" style="margin-bottom: 50px">
		<tr>
			<td>작성자 :</td>
			<td width="300"><%=resultDto.getWriter()%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=resultDto.getEmail()%></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><%=resultDto.getSubject()%></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><%=resultDto.getContent().replace("\n", "<br>") %></td>
		</tr>
		<tr>
			<td>공지글</td> 
			<td>
 		<%if(resultDto.getNoticeNo() > 0){ %>			
				공지글 &nbsp;
		<%} else { %>
				공지글아님 &nbsp;
		<%} %>
			</td> 
		</tr>
		<tr>
		<tr>
			<td>비밀글</td>
		<%if(resultDto.getSecretGubun().equals("T") ){ %>		
			<td>
				비밀글 &nbsp;
			</td>
		<%} else { %>
			<td>
				비밀글아님 &nbsp;
			</td>
		<%} %>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" onclick="sakje();">삭제하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=board_list';">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function sakje(){
		if(confirm('수정할까요?')){
			var f = document.sakjeForm
			f.action="mainProc.jsp?menuGubun=board_sakjeProc";
			f.method="post";
			f.submit();
		}
	}
</script>
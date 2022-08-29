<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>

<h2>게시글수정</h2>
<form name="sujungForm">
	<input type="hidden" name="no" id="no" value="<%=resultDto.getNo()%>">
	<input type="text" name="noticeNo" value="<%=resultDto.getNoticeNo() %>"><br>
	<table border="1" align="center" style="margin-bottom: 50px">
		<tr>
			<td>작성자 :</td>
			<td width="300"><%=resultDto.getWriter()%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><input type="text" name="email" id="email" value="<%=resultDto.getEmail()%>"></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<td>제목 :</td>
			<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject()%>"></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td><textarea   style="width: 300px; height: 180px;" name="content"><%=resultDto.getContent() %></textarea></td>
		</tr>
		<tr>
			<td>공지글</td> 
			<td>
 		<%if(resultDto.getNoticeNo() > 0){ %>			
				<input type="radio" name="noticeGubun" id="noticeGubun1" value="T" checked>공지글 &nbsp;
				<input type="radio" name="noticeGubun" id="noticeGubun2" value="F">공지글아님 &nbsp;
		<%} else { %>
				<input type="radio" name="noticeGubun" id="noticeGubun1" value="T">공지글 &nbsp;
				<input type="radio" name="noticeGubun" id="noticeGubun2" value="F" checked>공지글아님 &nbsp;
		<%} %>
			</td> 
		</tr>
		<tr>
		<tr>
			<td>비밀글</td>
		<%if(resultDto.getSecretGubun().equals("T") ){ %>		
			<td>
				<input type="radio" name="secretGubun" id="secretGubun1" value="T" checked>비밀글 &nbsp;
				<input type="radio" name="secretGubun" id="secretGubun2" value="F">비밀글아님 &nbsp;
			</td>
		<%} else { %>
			<td>
				<input type="radio" name="secretGubun" id="secretGubun1" value="T">비밀글 &nbsp;
				<input type="radio" name="secretGubun" id="secretGubun2" value="F" checked>비밀글아님 &nbsp;
			</td>
		<%} %>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" onclick="sujung();">수정하기</button>
			<button type="button" onclick="location.href='main.jsp?menuGubun=board_list';">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function sujung(){
		if(confirm('수정할까요?')){
			var f = document.sujungForm
			f.action="mainProc.jsp?menuGubun=board_sujungProc";
			f.method="post";
			f.submit();
		}
	}
</script>
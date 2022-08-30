<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	Util util = new Util();
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}
	String no_ = request.getParameter("no");
	if(no_ == null || no_.trim().equals("")){
		no_ = "0";
	}
	int no = Integer.parseInt(no_);

	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);

 	BoardDAO dao = new BoardDAO();
	BoardDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>메모상세보기</h2>
	<table border="1" align="center" width="80%">
		<tr>
			<td width="150">제목 :</td>
			<td><%=resultDto.getSubject() %></td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td><%=resultDto.getWriter() %></td>
		</tr>
		<tr>
			<td>작성일 :</td>
			<td><%=resultDto.getRegiDate() %></td>
		</tr>
		<tr>
			<td>조회수 :</td>
			<td><%=resultDto.getHit() %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=resultDto.getEmail() %></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>
			<%
			String content = resultDto.getContent();
			content = content.replace("\n", "<br>");
			out.println(content);
			%>
			</td>
		</tr>
		<tr>
			<td>refNo :</td>
			<td><%=resultDto.getRefNo() %></td>
		</tr>
		<tr>
			<td>stepNo :</td>
			<td><%=resultDto.getStepNo() %></td>
		</tr>
		<tr>
			<td>levelNo :</td>
			<td><%=resultDto.getLevelNo() %></td>
		</tr>
		<tr>
			<td>memberNo :</td>
			<td><%=resultDto.getMemberNo() %></td>
		</tr>
		<tr>
			<td>refNo :</td>
			<td><%=resultDto.getIp() %></td>
		</tr>
		<tr>
			<td>공지글 </td>
			<td><%=resultDto.getNoticeNo() %></td>
		</tr>
		<tr>
			<td>비밀글 </td>
			<td><%=resultDto.getSecretGubun() %></td>
		</tr>
		<tr>
			<td>조회수 </td>
			<td><%=resultDto.getHit() %></td>
		</tr>
		<tr>
			<td>파일 </td>
			<td><%=resultDto.getAttachInfo() %></td>
		</tr>
	</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('board_list','','','');">전체목록</a>
		|
		<a href="#" onclick="move('board_list','','<%=searchGubun%>','<%=searchData%>');">목록</a>
		|
		<a href="#" onclick="move('board_chuga','','<%=searchGubun%>','<%=searchData%>');">등록</a>
		|
		<a href="#" onclick="move('board_chuga','<%=resultDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">답변</a>
		|
		<a href="#" onclick="move('board_sujung','<%=resultDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">수정</a>
		|
		<a href="#" onclick="move('board_sakje','<%=resultDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">삭제</a>
		|
	</div>
<script>
	function move(val1, val2, val3, val4) {
		location.href = "main.jsp?menuGubun="+val1+"&no="+val2+"&searchGubun=" +val3 + "&searchData=" + val4;
	}
</script>
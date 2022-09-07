<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	String viewPasswd = request.getParameter("viewPasswd");
	viewPasswd = util.getNullBlankCheck(viewPasswd, "");
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	arguDto.setSearchGubun(searchGubun);
	arguDto.setSearchData(searchData);
	
	SubBoardDAO subBoardeDao = new SubBoardDAO();
	SubBoardDTO returnDto = subBoardeDao.getSelectOne(arguDto);
	
	String imsiPage = "viewPage";
	if(returnDto.getSecretGubun().equals("T")){
		if(!returnDto.getPasswd().equals(viewPasswd)){
			imsiPage = "viewPasswdPage";
		}
	}
	
%>
<%if(imsiPage.equals("viewPasswdPage")){ %>
	<form name="passwdForm">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="searchGubun" value="<%=searchGubun %>">
	<input type="hidden" name="searchData" value="<%=searchData %>">
	<table border="1" align="center" width="80%">
		<tr>
			<td colspan="2">
				<h2>글상세보기 (비밀글입니다.)</h2>
			</td>
		</tr>
		<tr>
			<td>
			 	비밀번호 :
			</td>
			<td>
				<input type="password" name="viewPasswd" id="viewPasswd">
				<button type="button" onclick="passwdSubmit();">확인</button>
			</td>
		</tr>
	</table>
	</form>
	<script>
		function passwdSubmit(){
			if(confirm('전송할까요?')){
				document.passwdForm.action = "main.jsp?menuGubun=subBoard_view";
				document.passwdForm.method = "post";
				document.passwdForm.submit();
			}
		}
	</script>
<%} else { %>
<h2>메모상세보기</h2>
	<table border="1" align="center" width="80%">
		<tr>
			<td width="150">제목 :</td>
			<td><%=returnDto.getSubject() %></td>
		</tr>
		<tr>
			<td>작성자 :</td>
			<td><%=returnDto.getWriter() %></td>
		</tr>
		<tr>
			<td>작성일 :</td>
			<td><%=returnDto.getRegiDate() %></td>
		</tr>
		<tr>
			<td>조회수 :</td>
			<td><%=returnDto.getHit() %></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td><%=returnDto.getEmail() %></td>
		</tr>
		<tr>
			<td>내용 :</td>
			<td>
			<%
			String content = returnDto.getContent();
			content = content.replace("\n", "<br>");
			out.println(content);
			%>
			</td>
		</tr>
		<tr>
			<td>refNo :</td>
			<td><%=returnDto.getRefNo() %></td>
		</tr>
		<tr>
			<td>stepNo :</td>
			<td><%=returnDto.getStepNo() %></td>
		</tr>
		<tr>
			<td>levelNo :</td>
			<td><%=returnDto.getLevelNo() %></td>
		</tr>
		<tr>
			<td>memberNo :</td>
			<td><%=returnDto.getMemberNo() %></td>
		</tr>
		<tr>
			<td>parentNo :</td>
			<td><%=returnDto.getParentNo() %></td>
		</tr>
		<tr>
			<td>ip :</td>
			<td><%=returnDto.getIp() %></td>
		</tr>
		<tr>
			<td>공지글 </td>
			<td><%=returnDto.getNoticeNo() %></td>
		</tr>
		<tr>
			<td>비밀글 </td>
			<td><%=returnDto.getSecretGubun() %></td>
		</tr>
		<tr>
			<td>조회수 </td>
			<td><%=returnDto.getHit() %></td>
		</tr>
		<tr>
			<td>파일 </td>
			<td><%=returnDto.getAttachInfo() %></td>
		</tr>
	</table>
	
	<div style="border: 0px solid red; padding-top: 10px; width: 80%;" align="center">
	<table width="100%">
		<tr>
			<td width="150">이전글</td>
			<%if (returnDto.getPreNo() > 0) {%>
			<td><a href="#" onclick="move('subBoard_view','<%=returnDto.getPreNo()%>','<%=searchGubun%>','<%=searchData%>')"><%=returnDto.getPreSubject() %></a></td>
			<%} else { %>
				<td>이전글이없습니다.</td>
			<%} %>
		</tr>
		<tr>
			<td>다음글</td>
			<%if (returnDto.getNxtNo() > 0) {%>
			<td><a href="#" onclick="move('subBoard_view','<%=returnDto.getNxtNo()%>','<%=searchGubun%>','<%=searchData%>')"><%=returnDto.getNxtSubject() %></a></td>
			<%} else { %>
				<td>다음글이 없습니다.</td>
			<%} %>
		</tr>
	</table>
	</div>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('subBoard_list','','','');">전체목록</a>
		|
		<a href="#" onclick="move('subBoard_list','','<%=searchGubun%>','<%=searchData%>');">목록</a>
		|
		<a href="#" onclick="move('subBoard_chuga','','<%=searchGubun%>','<%=searchData%>');">등록</a>
		|
		<a href="#" onclick="move('subBoard_chuga','<%=returnDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">답변</a>
		|
		<a href="#" onclick="move('subBoard_sujung','<%=returnDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">수정</a>
		|
		<a href="#" onclick="move('subBoard_sakje','<%=returnDto.getNo()%>','<%=searchGubun%>','<%=searchData%>');">삭제</a>
		|
	</div>
<script>
	function move(val1, val2, val3, val4) {
		location.href = "main.jsp?menuGubun="+val1+"&no="+val2+"&searchGubun=" +val3 + "&searchData=" + val4;
	}
</script>
<%}%>
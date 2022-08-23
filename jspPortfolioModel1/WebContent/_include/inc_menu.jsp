<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>
<%@ include file="../_include/inc_sessionChk.jsp" %>
<table border="0" align="center">
	<tr>
		<td colspan="10" align="right" style="padding: 0px 10px 0px 0px;">
		<%if(sessionNo <= 0){ %>
			<a href="main.jsp?menuGubun=noLogin_login">[로그인]</a>
			<%} else { %>
			<br>
			<%=sessionName %> (<%=sessionGrade %>)님 환영합니다.
			<a href="main.jsp?menuGubun=noLogin_logout">[로그아웃]</a>
			<%} %> 
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 10px;" id="home">
			<a href="<%=path%>">Home</a>
		</td>
		<td align="center" style="padding: 10px;" id="member">
			<a href="<%=path%>/main/main.jsp?menuGubun=member_list">회원관리</a>
		</td>
		<td align="center" style="padding: 10px;" id="memo">
			<a href="<%=path%>/main/main.jsp?menuGubun=memo_list">메모장</a>
		</td>
		<td align="center" style="padding: 10px;" id="guestBook">
			<a href="<%=path%>/main/main.jsp?menuGubun=guestBook_list">방명록</a>
		</td>
		<td align="center" style="padding: 10px;" id="boardBasic">
			<a href="<%=path%>/main/main.jsp?menuGubun=boardBasic_list">게시판(B)</a>
		</td>
		<td align="center" style="padding: 10px;" id="menu4">
			메뉴4
		</td>
		<td align="center" style="padding: 10px;" id="menu5">
			메뉴5
		</td>
		<td align="center" style="padding: 10px;" id="menu6">
			메뉴6
		</td>
	</tr>
</table>
<script>
function choiceMenuId(){
	$("#<%=folderName%>").css('background-color','gray');
}
choiceMenuId();
</script>
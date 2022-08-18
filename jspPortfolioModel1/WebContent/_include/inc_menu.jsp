<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_header.jsp" %>

<table border="0" align="center">
	<tr>
		<td colspan="10" align="right" style="padding: 0px 10px 0px 0px;">
			000님 환영합니다. 
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
		<td align="center" style="padding: 10px;" id="menu2">
			메뉴2
		</td>
		<td align="center" style="padding: 10px;" id="menu3">
			메뉴3
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
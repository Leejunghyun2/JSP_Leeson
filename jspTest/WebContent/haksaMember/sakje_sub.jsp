<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	HaksaMemberDTO dto = new HaksaMemberDTO();
	dto.setHakbun(hakbun);
	HaksaMemberDAO dao = new HaksaMemberDAO();
	dto = dao.getSelectOne(dto);
	String addr = dto.getAddr1() + " ";
	addr += dto.getAddr2() + " ";
	addr += dto.getAddr3() + " ";
	addr += dto.getAddr4() + " ";
 %>

<form name="sakjeForm">
<input type="hidden" name="hakbun" value="<%=hakbun %>">
<table border="1" width="80%" align="center">
	<tr>
		<td>학번 :</td>
		<td><%=dto.getHakbun() %></td>
	</tr>
	<tr>
		<td>이름 :</td>
		<td><%=dto.getName()%></td>
	</tr>
	<tr>
		<td>연락처 :</td>
		<td><%=dto.getPhone()%></td>
	</tr>
	<tr>
		<td>부모연락처 :</td>
		<td><%=dto.getParentPhone()%></td>
	</tr>
	<tr>
		<td >주소</td>
		<td><%=addr %></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><button type="button" onclick="sakje();">삭제하기</button></td>	 	
	</tr>
</table>
</form>
<script>
	function sakje(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.sakjeForm
			f.action = "sakjeProc.jsp";
			f.method = "post";
			f.submit();
		}
	}

</script>

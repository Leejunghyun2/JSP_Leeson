<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	SubBoardChkDAO dao = new SubBoardChkDAO();
	ArrayList<SubBoardChkDTO> list = dao.getselectAll();
%>
<h2>게시판관리목록</h2>
<fieldset style="width: 80%; border: 0px solid red;">
	<form name="DirForm">
			<input type="hidden" name="procGubun" value="chugaProc">
			<input type="hidden" name="boardChkNo">
	<table border="1" align="left" >
		
		<tr>
			<td>tbl :</td>
			<td><input type="text" name="tbl"></td>
		</tr>
		<tr>
			<td>tblName :</td>
			<td><input type="text" name="tblName"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="button" onclick="join();" id="btnSave">등록하기</button>
			<td colspan="2"><button type="button" id="btnReset">초기화</button>
		</tr>
	</table>
	</form>
<script>
		var f = document.DirForm
		f.writer.focus();
		function join(){
			if(confirm('등록 하시겠습니까?')){
				f.action = "mainProc.jsp?menuGubun=subBoardChk_chugaProc"
				f.method = "post"
				f.submit();
				
			}
		}
</script>
</fieldset>
<table border="1" width="80%">
	<tr>
		<td>No</td>
		<td>tbl</td>
		<td>tblName</td>
		<td>등록일</td>
		<td></td>
	</tr>
	<%
	for(int i=0; i<list.size(); i++){
		SubBoardChkDTO dto = list.get(i);
	%>
	
	<tr>
		<td>
		<%=dto.getBoardChkNo() %>
		<input type="hidden" name="boardChkNo_<%=i %>" id="boardChkNo_<%=i %>" value="<%=dto.getBoardChkNo() %>">
		<input type="hidden" name="tbl_<%=i %>" id="tbl_<%=i %>" value="<%=dto.getTbl()%>">
		<input type="hidden" name="tblName_<%=i %>" id="tblName_<%=i %>" value="<%=dto.getTblName()%>">
		</td>
		<td><%=dto.getTbl() %></td>
		<td><%=dto.getTblName() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td>
			<a href="#" onclick="move('sujungProc','<%=i%>')">수정</a>
			<a href="#" onclick="move('sakjeProc','<%=i%>')">삭제</a>
		</td>
	</tr>
	<%} %>
</table>
<script>
	function move(val1, val2){
		document.DirForm.procGubun.value = val1;
		document.DirForm.boardChkNo.value = $("#boardChkNo_"+val2).val();
		document.DirForm.tbl.value = $("#tbl_"+val2).val();
		document.DirForm.tblName.value = $("#tblName_"+val2).val();
		if(val1 == 'sujungProc'){
			$("#btnSave").text("수정하기");
		} else if(val1 == 'sakjeProc'){
			$("#btnSave").text("삭제하기");
		}
	}
	$("#btnReset").click(function(){
		document.DirForm.procGubun.value = 'chugaProc';
		document.DirForm.boardChkNo.value = 0;
		document.DirForm.tbl.value = '';
		document.DirForm.tblName.value = '';
	});
</script>

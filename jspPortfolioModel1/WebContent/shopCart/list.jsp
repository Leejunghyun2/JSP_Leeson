<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%


	CartDAO CartDAO = new CartDAO();
	ArrayList<CartDTO> list = CartDAO.getSelectAll();
	int totalPrice = 0;
%> 

<h2>제조사 목록</h2>
<form name="DirForm">
<table border="1" width="80%">
	<tr>
		<th>
			<input type="checkbox" name="checkAll" id="checkAll">
		</th>
		<th>이미지</th>
		<th>제조사</th>
		<th>상품명</th>
		<th>상품단가</th>
		<th>수량</th>
		<th>총 금액</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
<%
		if (list.size() == 0) {
			out.println("<tr>");
			out.println("<td colspan=\"4\" height=\"100px\" style=\"text-align:center;\">저장된 정보가 없습니다.</td>");
			out.println("</tr>");
		}//if
%>
<%
	for (int i = 0; i < list.size(); i++) {
		CartDTO resultCartDTO = list.get(i);
		String[] imsiArray01 = resultCartDTO.getProductInfo().split("/");
		String[] imsiArray02 = imsiArray01[3].split("[|]");
		String img = imsiArray02[1];
		if(img.equals("-")){
			img="&nbsp;";
		} else{ 
			img = "<img src='"+imgDisplayPath+"/shopProduct/"+img+"' width='50px' height='50px'>";
		}
		int sum = Integer.parseInt(imsiArray01[1]) * resultCartDTO.getAmount();
%>
	    <tr>
	    <td>
		    <input type="checkbox" name="chk" value="<%=resultCartDTO.getCartNo() %>" align="center">
		</td>
		<td>
			<%=img%>
		</td>
		<td>
			<%=imsiArray01[2] %>
		</td>
		<td><%=imsiArray01[0] %></td>
		<td><%=imsiArray01[1] %></td>
		<td><%=resultCartDTO.getAmount() %></td>
		<td><%=sum%></td>
		<td><%=resultCartDTO.getRegiDate() %></td>
		<td>
			
			 <a href="#" onclick="cartClearOne('<%=resultCartDTO.getCartNo() %>','G')">삭제(g)</a>
			<a href="#" onclick="cartClearOne('<%=resultCartDTO.getCartNo() %>','P')">삭제(p)</a>
		</td>
	</tr>
<%
	totalPrice += sum;
	}//for 
%>
	<tr>
		<td colspan="10" align="right">
			총금액 : <%=totalPrice %> 원
		</td>
	</tr>
</table>
</form>
<div style="border:0px solid red; width:80%; text-align:right; margin-top: 20px;">
|
<a href="#" onclick="move('shopCart_list')">목록</a>
|
<a href="#"  onclick="cartClearForm();">삭제(form)</a>
|
<a href="#"  onclick="cartClearScript();">삭제(Script)</a>
|
</div>

<form name="imsiForm">
<input type="hidden" name="cartNo">
</form>
<form name="choiceForm">
<input type="hidden" name="choiceNo">
</form>
<script>
	$(function(){
		$("#checkAll").click(function(){
			if($("#checkAll").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			} else{
				$("input[name=chk]").prop("checked",false);
			}
		});
	})//한번에 체크
	function move(addr, val2) {
		let linkAddr = 'main.jsp?menuGubun=' + addr;
		if (vendorCode != undefined) {
			linkAddr += '&cartNo=' + val2;
		}//if
		location.href = linkAddr;
	}//if
	function cartClearOne(val1, val2){
		
		if(confirm('삭제할까요?')){
			if(val2 == 'G'){
			location.href = 'mainProc.jsp?menuGubun=shopCart_sakjeProcOne&cartNo='+val1;
			} else {
				document.imsiForm.cartNo.value = val1;
				document.imsiForm.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcOne";
				document.imsiForm.method = "post";
				document.imsiForm.submit(); 
			}
		}
	}
	function cartClearForm(){
		if(confirm('삭제할까요?')){
			document.DirForm.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcForm";
			document.DirForm.method = "post";
			document.DirForm.submit(); 
		}
	}
	function cartClearScript(){
		var chk_no = '';
		var f = document.choiceForm;
		$('input[name="chk"]:checked').each(function (index){
			if(index != 0){
				chk_no += ',';
			}
			chk_no += $(this).val();
		});
		f.choiceNo.value = chk_no;
		f.action = "mainProc.jsp?menuGubun=shopCart_sakjeProcScript";
	    f.method = "post";
	    f.submit();
	    
	}
</script>
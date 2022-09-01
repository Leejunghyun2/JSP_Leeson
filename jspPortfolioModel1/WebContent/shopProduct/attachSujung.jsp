<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%
	String productCode_ = request.getParameter("productCode");
	
	productCode_ = util.getNullBlankCheck(productCode_, "0");
	
	int productCode = Integer.parseInt(productCode_);

	ShopProductDTO arguShopProductDto = new ShopProductDTO();
	arguShopProductDto.setProductCode(productCode);
	
	ShopProductDAO shopProductDao = new ShopProductDAO();
	ShopProductDTO resultShopProductDto = shopProductDao.getSelectOne(arguShopProductDto);
%>

<h2>상품 수정</h2>
<form name="inputForm">
	<input type="hidden" name="productCode" value="<%=resultShopProductDto.getProductCode() %>" />
	<table border="1">
		<tr>
			<td>상품명</td>	
			<td><input type="text" name="productName" value="<%=resultShopProductDto.getProductName() %>"/></td>	
		</tr>
		<tr>
			<td>상품가격</td>	
			<td><input type="text" name="productPrice" value="<%=resultShopProductDto.getProductPrice() %>"/></td>	
		</tr>
		<tr>
			<td>제조사</td>	
			<td>
				<input type="text" name="vendorCode" value="<%=resultShopProductDto.getVendorCode()%>">
			</td>
		</tr>
		<tr>
		<td>첨부된파일</td>
		<td>
		<%
				String[] imsiarray = resultShopProductDto.getAttachInfo().split(",");
				for (int j = 0; j < imsiarray.length; j++) {
					if(!imsiarray[j].equals("-|-|0|-|-")){
						String[] imsiArray2 = imsiarray[j].split("[|]");
						
						String imsiImgPath = "";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/attach";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/shopProduct/";
						imsiImgPath += imsiArray2[1];
						
						out.println("<img src=\""+ imsiImgPath + "\" width=\"70\" height=\"70\"><hr>");
					}else{
						out.println("첨부파일없음 <hr>");
					}
				}
		%>
		</td>
		</tr>
		<tr>
			<td>사진첨부</td>	
			<td>
				<input type="file" name="0" class="fileUp"/><br>
				<input type="file" name="1" class="fileUp"/><br>
				<input type="file" name="2" class="fileUp"/><br>
				<input type="file" name="3" class="fileUp"/><br>
				<input type="file" name="4" class="fileUp"/><br>
				<input type="hidden" name="attachCounter" />
			</td>	
		</tr>
		<tr>
			<td>
				<button type="button" onclick="formSubmit()">수정하기</button>
				<button type="button" onclick="location.href='main.jsp?menuGubun=shopProduct_list';">목록으로</button>
			</td>	
		</tr>
	</table>
</form>

<script>
	function formSubmit() {
		if (confirm('수정할까요?')) {
			document.inputForm.attachCounter.value = document.getElementsByClassName('fileUp').length;
			document.inputForm.enctype = 'multipart/form-data';
			document.inputForm.action = 'mainProc.jsp?menuGubun=shopProduct_attachSujungProc';
			document.inputForm.method = 'post';
			document.inputForm.submit();
		}//if
	}//formSubmit
</script>
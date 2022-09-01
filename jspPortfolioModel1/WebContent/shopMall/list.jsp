<%@page import="java.util.ArrayList"%>
<%@page import="shopProduct.model.dao.ShopProductDAO"%>
<%@page import="shopProduct.model.dto.ShopProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp"%>
<%
ShopProductDAO dao = new ShopProductDAO();
ArrayList<ShopProductDTO> list = dao.getSelectAll();
%>
<%
	int cellCounter = 3;
	
	int imsiMok = list.size() / cellCounter;
	int imsiNa = list.size() % cellCounter;
	
	int rowCounter = 0;
	if(imsiNa > 0){
		rowCounter = imsiMok + 1;
	}else{
		rowCounter = imsiMok;
	}

%>
<h2>리스트</h2>
<table border="1" width="80%">

<%
int idx = 0;
for(int i=0; i<rowCounter; i++){
%>
	<tr>
	<%
	for(int j=0; j<cellCounter; j++){
		String displayValue = "O";	
	%>
		<td style="padding: 20px;">
			<%
			if(idx < list.size() ){
			ShopProductDTO dto = list.get(idx);	
			%>
			<table border="1" style="width: 200px;">
				<tr>
					<td>
					<%
						String[] imsiArray = dto.getAttachInfo().split("[|]");
							
							String imsiImgPath = "";
							imsiImgPath += request.getContextPath();
							imsiImgPath += "/attach";
							imsiImgPath += request.getContextPath();
							imsiImgPath += "/shopProduct/";
							imsiImgPath += imsiArray[1];
							
							out.println("<img src=\""+ imsiImgPath + "\" width=\"200\" height=\"200\">");
					%>
					</td>
				</tr>
				<tr>
					<td><%=dto.getProductName() %></td>
				</tr>
				<tr>
					<td><%=dto.getProductPrice() %></td>
				</tr>
			</table>
			<%
		
			} else {
			%>
			   &nbsp;
			<%} %>
		</td>
	<%
	idx++;
	} %>
	</tr>
<%	} %>











</table>
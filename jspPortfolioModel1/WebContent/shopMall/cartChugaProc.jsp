<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp"%>

<%
	String amount_ = request.getParameter("amount");
	String productCode_ = request.getParameter("productCode");
	int productCode = Integer.parseInt(productCode_);
	int amount = Integer.parseInt(amount_);
	
	CartDTO arguDto = new CartDTO();
	arguDto.setMemberNo(sessionNo);
	arguDto.setProductCode(productCode);
	arguDto.setAmount(amount);
	
	CartDAO dao = new CartDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('장바구니에 담겼습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=shopMall_view&productCode="+productCode+"';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('장바구니  담는중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=shopMall_view&productCode="+productCode+"';");
		out.println("</script>");
	}
	
%>